import time
from anasymod.analysis import Analysis
import matplotlib.pyplot as plt

# Flag to control the plotting loop
plotting = True


ana = Analysis("./neuron_mv")
ana.set_target("fpga")
# ana.build()  # build bitstream
ctrl = ana.launch(debug=True)  # program FPGA
ctrl.stall_emu()
ctrl.set_reset(1)
ctrl.set_reset(0)
v_out = ctrl.probe("v_out_probe")
y = []
#time this 
start = time.time()

while ctrl.get_emu_time() < 50e-3:
    
    ctrl.sleep_emu(50e-3)
    y.append(v_out)

end = time.time()
print("Time elapsed: ", end-start)

# Prepare the plot
plt.plot(y)
plt.show()


