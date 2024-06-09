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
        g_soma = 1  # S
        c_soma = 1  # F
        EL = -70.6  # mV
        VT = -50.4  # mV

        DeltaT = 2.0  # mV

        Vcut = VT + 6 * DeltaT  # mV

        def exp_approx(x):
            # Use integer arithmetic to avoid division by variables
            term1 = x
            term2 = (x * x) / 2
            term3 = (x * x * x) / 6
            term4 = (x * x * x * x) / 24

            # Sum the terms to approximate e^x
            result = 1 + term1 + term2 #+term3 + term4
            return result

        super().__init__(name, dt=dt)

        I_in = self.add_analog_input("I_in")

        V_out_st = self.add_analog_state("V_out_st", init=5, range_=10)
        V_out = self.add_analog_output("V_out")

        V_out_exp = self.add_analog_output("V_out_exp")
        V_out_lin = self.add_analog_output("V_out_lin")
        V_out_I = self.add_analog_output("V_out_I")
        V_out_I_mult = self.add_analog_output("V_out_I_mult")
        dv_out = self.add_analog_output("dv_out")
        digital_sel_out = self.add_digital_output("digital_sel_out")

        digital_sel = self.add_digital_state("digital_sel")

        self.set_this_cycle(digital_sel, V_out_st <= Vcut)

        self.set_this_cycle(V_out,V_out_st)

        self.set_next_cycle(
            V_out_st,
                5.0,

        )

        self.set_this_cycle(
            V_out_I_mult,

                5.0,

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
