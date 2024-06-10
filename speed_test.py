import time
from anasymod.analysis import Analysis
import matplotlib.pyplot as plt

# Flag to control the plotting loop
plotting = True


ana = Analysis("./neuron_mv")
ana.set_target("fpga")
# ana.build()  # build bitstream
#ctrl = ana.launch(debug=True)  # program FPGA

#v_out = ctrl.probe("v_out_probe")
y = []
#time this 

ana.emulate()


# Prepare the plot
plt.plot(y)
plt.show()


