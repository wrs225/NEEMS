import matplotlib.pyplot as plt
from matplotlib.widgets import Button
from anasymod.analysis import Analysis

# Flag to control the plotting loop
plotting = True


def stop(event):
    global plotting
    plotting = False


ana = Analysis("./neuron_mv")
ana.set_target("fpga")
# ana.build()  # build bitstream
ctrl = ana.launch(debug=True)  # program FPGA
ctrl.stall_emu()
ctrl.set_reset(1)
ctrl.set_reset(0)

# Prepare the plot
plt.ion()
fig, ax = plt.subplots()
plt.subplots_adjust(bottom=0.2)
x, y = [], []

# Add a button for stopping the plot
button_ax = plt.axes([0.8, 0.025, 0.2, 0.06])
button = Button(button_ax, "Stop", color="red", hovercolor="green")
button.on_clicked(stop)

while plotting:
    v_out = ctrl.get_param("v_out_probe")
    t = ctrl.get_emu_time()
    ctrl.sleep_emu(1e-4)

    # Add data to lists and update plot
    x.append(t)
    y.append(v_out)
    ax.plot(x, y, color="b")
    plt.draw()
    plt.pause(1e-5)

# Keep the plot open at the end
plt.ioff()
plt.show(block=False)
