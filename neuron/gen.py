import os.path
from argparse import ArgumentParser

from msdsl import *
from anasymod import get_full_path

from brian2.units import ms, um, pA, nS, uS, ohm, cm, mV, uF, mvolt, pF, nA
import numpy as np


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
        super().__init__(name, dt=dt)

        I_in = self.add_analog_input("I_in")
        V_out = self.add_analog_output("V_out")

        expfunc = lambda x: np.exp((x - float(VT)) / float(DeltaT))
        f = self.make_function(expfunc, domain=[0, 1])
        exp = self.set_from_sync_func("exp", f, V_out)
        self.set_next_cycle(
            V_out,
            V_out
            + dt
            * (
                float(g_soma) * (float(EL) - V_out)
                + float(g_soma) * float(DeltaT) * exp
                + I_in
            )
            * (1 / float(C_soma)),
        )
        # define differential equations.


def main():
    print("Running model generator...")

    # parse command line arguments
    parser = ArgumentParser()
    parser.add_argument("-o", "--output", type=str)
    parser.add_argument("--dt", type=float)
    args = parser.parse_args()

    # create the model
    model = NeuronModel(dt=args.dt)

    # determine the output filename
    filename = os.path.join(get_full_path(args.output), f"{model.module_name}.sv")
    print("Model will be written to: " + filename)

    # generate the model
    model.compile_to_file(VerilogGenerator(), filename)


if __name__ == "__main__":
    main()
