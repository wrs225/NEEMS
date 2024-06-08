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
        dt=1e-3 * ms,
        C_m=1 * uF / cm**2,
        R_ax=6 * 1e3 * ohm * cm,
        GL=1e-3 * nS / (um**2),
        Einh=-75 * mV,
        Eexc=0 * mV,
        EL=-70.6 * mV,
        VT=-50.4 * mV,
        DeltaT=2 * mV,
        output="neuron/build",
    ):

        Vcut = VT + 6 * DeltaT
        tauw_reg, a_reg, b_reg, Vr_reg = (
            144 * ms,
            0.5 * nS,
            0.0805 * nA,
            -70.6 * mV,
        )  # Regular spiking (Pyramidal cell)
        tauw_fs, a_fs, b_fs, Vr_fs = (
            144 * ms,
            0.05 * nS,
            0 * nA,
            -70.6 * mV,
        )  # Fast spiking (Basket cell)
        # call the super constructor

        # soma is a sphere
        soma_radius = 15 * um
        g_soma = GL * 4 * np.pi * soma_radius**2
        C_soma = C_m * 4 * np.pi * soma_radius**2

        print(g_soma)
        print(C_soma)
        super().__init__(name, dt=dt)

        I_in = self.add_analog_input("I_in")
        V_out_st = self.add_analog_state("V_out_st", init=-70.6, range_=100)
        V_out = self.add_analog_output("V_out")
        self.set_this_cycle(V_out, V_out_st)

        # expfunc = lambda x: np.exp((x - float(VT)) / float(DeltaT))
        expfunc = lambda x: np.exp(x)
        f = self.make_function(
            expfunc,
            domain=[-100, 0],
            dir=output,
            numel=10000,
        )
        exp = self.set_from_sync_func("exp", f, V_out_st)

        digital_sel = self.add_digital_state("digital_sel")

        self.set_this_cycle(digital_sel, V_out_st <= float(VT * 1000))
        digital_sel_out = self.add_digital_output("digital_sel_out")
        self.set_this_cycle(digital_sel_out, digital_sel)

        self.set_next_cycle(
            V_out_st,
            if_(
                digital_sel,
                V_out_st
                + float(dt)
                * (
                    float(g_soma * 1000) * (float(EL * 1000) - V_out_st)
                    + float(g_soma * 1000)
                    * float(DeltaT * 1000)
                    * ((V_out_st - float(VT * 1000)) / float(DeltaT * 1000))
                    * ((V_out_st - float(VT * 1000)) / float(DeltaT * 1000))
                    + I_in * 1000
                )
                * (1 / float(C_soma * 1000)),
                float(Vr_fs * 1000),
            ),
        )
        # define differential equations.

        # Make outputs for each different contribution to the derivative
        V_out_exp = self.add_analog_output("V_out_exp")
        V_out_lin = self.add_analog_output("V_out_lin")
        V_out_I = self.add_analog_output("V_out_I")
        V_out_I_mult = self.add_analog_output("V_out_I_mult")
        dv_out = self.add_analog_output("dv_out")

        self.set_this_cycle(V_out_exp, exp)
        self.set_this_cycle(V_out_lin, V_out_st)
        self.set_this_cycle(V_out_I, I_in)
        self.set_this_cycle(
            V_out_I_mult,
            if_(
                digital_sel,
                float(dt)
                * (
                    float(g_soma * 1000) * (float(EL * 1000) - V_out_st)
                    + float(g_soma * 1000)
                    * float(DeltaT * 1000)
                    * ((V_out_st - float(VT * 1000)) / float(DeltaT * 1000))
                    * ((V_out_st - float(VT * 1000)) / float(DeltaT * 1000))
                    + I_in * 1000
                )
                * (1 / float(C_soma * 1000)),
                float(Vr_fs * 1000),
            ),
        )
        self.set_this_cycle(dv_out, exp)


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
