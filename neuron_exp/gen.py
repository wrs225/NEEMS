import os.path
from argparse import ArgumentParser

from msdsl import *
from anasymod import get_full_path

from brian2.units import ms, um, pA, nS, uS, ohm, cm, mV, uF, mvolt, pF, nA
import numpy as np
from msdsl.expr.extras import if_


class NeuronModel(MixedSignalModel):
    def __init__(
        self,
        name="neuron",
        dt=1e-3,
        output="neuron/build",
    ):

        Vr_reg = -70.6  # mV
        g_soma = 314e-12  # S
        c_soma = 3.14e-12  # F
        EL = -70.6  # mV
        VT_ADJ = -6  # mV
        VT = -50.4 + VT_ADJ  # mV

        DeltaT = 2.0  # mV

        # Vcut = VT + 6 * DeltaT  # mV
        Vcut = VT - VT_ADJ + 6 * DeltaT  # mV

        super().__init__(name, dt=dt)
        digital_sel_2 = self.add_digital_state("digital_sel_2")
        I_in = self.add_analog_input("I_in")

        V_out_st = self.add_analog_state("V_out_st", init=Vr_reg, range_=1000)
        V_out = self.add_analog_output("V_out")

        V_out_exp = self.add_analog_output("V_out_exp")
        V_out_lin = self.add_analog_output("V_out_lin")
        V_out_I = self.add_analog_output("V_out_I")
        V_out_I_mult = self.add_analog_output("V_out_I_mult")
        dv_out = self.add_analog_output("dv_out")
        digital_sel_out = self.add_digital_output("digital_sel_out")

        digital_sel = self.add_digital_state("digital_sel")

        self.set_this_cycle(digital_sel, V_out_st <= Vcut)

        self.set_this_cycle(digital_sel_2, V_out_st <= VT)

        def exp_approx(x):

            # Use integer arithmetic to avoid division by variables
            term1 = x
            term2 = (x * x) / 2
            term3 = (x * x * x) / 6
            term4 = (x * x * x * x) / 24
            term5 = (x * x * x * x * x) / 120
            term6 = (x * x * x * x * x * x) / 720
            term7 = (x * x * x * x * x * x * x) / 5040
            # term8 = (x * x * x * x * x * x * x * x) / 40320
            # term9 = (x * x * x * x * x * x * x * x * x) / 362880

            # Sum the terms to approximate e^x
            result = (
                1 + term1 + term2 + term3 + term4 + term5 + term6 + term7
            )  # + term8 + term9
            #
            return if_(digital_sel_2, 0.0, result)

        # exp_lambda = lambda x: np.exp((x - VT) / DeltaT)

        # exp_func = self.make_functon(exp_lambda,domain=[-70.4,38.4])

        # exp_eval = self.

        dt_eq = (
            dt
            / c_soma
            * (
                g_soma * (EL - V_out_st)
                + g_soma * DeltaT * exp_approx((V_out_st - VT) / DeltaT)
                + I_in
            )
        )

        self.set_this_cycle(V_out, V_out_st)

        self.set_this_cycle(
            V_out_exp,
            g_soma * DeltaT * exp_approx((V_out_st - VT) / DeltaT),
        )
        self.set_this_cycle(V_out_lin, V_out_st)
        self.set_this_cycle(V_out_I, I_in)
        self.set_this_cycle(digital_sel_out, digital_sel)

        self.set_next_cycle(
            V_out_st,
            if_(
                digital_sel,
                V_out_st + dt_eq,
                float(Vr_reg),
            ),
        )

        self.set_this_cycle(
            V_out_I_mult,
            if_(
                digital_sel,
                dt_eq,
                float(Vr_reg),
            ),
        )


def main():

    print("Running model generator...")

    # parse command line arguments
    parser = ArgumentParser()
    parser.add_argument("-o", "--output", type=str)
    parser.add_argument("--dt", type=float)
    args = parser.parse_args()

    # create the model
    model = NeuronModel(dt=args.dt, output=args.output)

    # determine the output filename
    filename = os.path.join(get_full_path(args.output), f"{model.module_name}.sv")
    print("Model will be written to: " + filename)

    # generate the model
    model.compile_to_file(VerilogGenerator(), filename)


if __name__ == "__main__":
    main()
