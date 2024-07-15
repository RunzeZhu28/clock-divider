import tkinter as tk
from tkinter import messagebox
import ok
import logging


logging.basicConfig(filename='fpga_config.log', level=logging.DEBUG, 
                    format='%(asctime)s - %(levelname)s - %(message)s')

def process_input(frequency, duty_cycle, delay):
    A = round(100000000 / frequency /1000000* 2) 
    B = round(A * duty_cycle)
    C = A - B
    if (delay == 0):
        D = round(A)
    else:
        D = round(A * delay)
    

    return B, C, D

def configure_fpga():
    devices = ok.FrontPanelDevices()
    dev = devices.Open()
    if dev is None:
        logging.error("No device found.")
        return None, -1
    error = dev.ConfigureFPGA('11.bit')
    if error != 0:
        logging.error(f"Failed to configure FPGA. Error code: {error}")
    return dev, error

# def send_to_fpga(dev, high_count, low_count, delay):
#     try:
#         dev.SetWireInValue(0x12, 0x1)
#         dev.UpdateWireIns()
#         dev.SetWireInValue(0x00, high_count)
#         dev.UpdateWireIns()
#         dev.SetWireInValue(0x01, low_count)
#         dev.UpdateWireIns()
#         dev.SetWireInValue(0x02, delay)
#         dev.UpdateWireIns()
#         dev.SetWireInValue(0x12, 0x0)
#         dev.UpdateWireIns()
#         logging.info("Values sent to FPGA successfully.")
#     except Exception as e:
#         logging.error(f"Error sending values to FPGA: {e}")
#         messagebox.showerror("Error", f"Failed to send values to FPGA: {e}")

def validate_inputs(frequency, duty_cycle, delay):
    if frequency <= 0:
        raise ValueError("Frequency must be positive.")
    if not (0 <= duty_cycle <= 1):
        raise ValueError("Duty cycle must be between 0 and 1.")
    if delay < 0:
        raise ValueError("Delay must be non-negative.")

def on_submit():
    try:
        frequency = float(entries_frequency[0].get())
        duty_cycle = float(entries_duty_cycle[0].get())
        delay = float(entries_delay[0].get())
        high_count_1, low_count_1, delay_1 = process_input(frequency, duty_cycle, delay)
        
        frequency = float(entries_frequency[1].get())
        duty_cycle = float(entries_duty_cycle[1].get())
        delay = float(entries_delay[1].get())
        high_count_2, low_count_2, delay_2 = process_input(frequency, duty_cycle, delay)

        frequency = float(entries_frequency[2].get())
        duty_cycle = float(entries_duty_cycle[2].get())
        delay = float(entries_delay[2].get())
        high_count_3, low_count_3, delay_3 = process_input(frequency, duty_cycle, delay)

        frequency = float(entries_frequency[3].get())
        duty_cycle = float(entries_duty_cycle[3].get())
        delay = float(entries_delay[3].get())
        high_count_4, low_count_4, delay_4 = process_input(frequency, duty_cycle, delay)

        frequency = float(entries_frequency[4].get())
        duty_cycle = float(entries_duty_cycle[4].get())
        delay = float(entries_delay[4].get())
        high_count_5, low_count_5, delay_5 = process_input(frequency, duty_cycle, delay)

        frequency = float(entries_frequency[5].get())
        duty_cycle = float(entries_duty_cycle[5].get())
        delay = float(entries_delay[5].get())
        high_count_6, low_count_6, delay_6 = process_input(frequency, duty_cycle, delay)

        dev, error = configure_fpga()
        if error == 0:
            try:
                dev.SetWireInValue(0x12, 0x1)
                dev.UpdateWireIns()
                dev.SetWireInValue(0x00, high_count_1)
                dev.UpdateWireIns()
                dev.SetWireInValue(0x01, low_count_1)
                dev.UpdateWireIns()
                dev.SetWireInValue(0x02, delay_1)
                dev.UpdateWireIns()
                dev.SetWireInValue(0x03, high_count_2)
                dev.UpdateWireIns()
                dev.SetWireInValue(0x04, low_count_2)
                dev.UpdateWireIns()
                dev.SetWireInValue(0x05, delay_2)
                dev.UpdateWireIns()
                dev.SetWireInValue(0x06, high_count_3)
                dev.UpdateWireIns()
                dev.SetWireInValue(0x07, low_count_3)
                dev.UpdateWireIns()
                dev.SetWireInValue(0x08, delay_3)
                dev.UpdateWireIns()
                dev.SetWireInValue(0x09, high_count_4)
                dev.UpdateWireIns()
                dev.SetWireInValue(0x0a, low_count_4)
                dev.UpdateWireIns()
                dev.SetWireInValue(0x0b, delay_4)
                dev.UpdateWireIns()
                dev.SetWireInValue(0x0c, high_count_5)
                dev.UpdateWireIns()
                dev.SetWireInValue(0x0d, low_count_5)
                dev.UpdateWireIns()
                dev.SetWireInValue(0x0e, delay_5)
                dev.UpdateWireIns()
                dev.SetWireInValue(0x0f, high_count_6)
                dev.UpdateWireIns()
                dev.SetWireInValue(0x10, low_count_6)
                dev.UpdateWireIns()
                dev.SetWireInValue(0x11, delay_6)
                dev.UpdateWireIns()
                dev.SetWireInValue(0x12, 0x0)
                dev.UpdateWireIns()
                logging.info("Values sent to FPGA successfully.")
            except Exception as e:
                logging.error(f"Error sending values to FPGA: {e}")
                messagebox.showerror("Error", f"Failed to send values to FPGA: {e}")

            messagebox.showinfo("Success", "FPGA configured successfully.")
        else:
            messagebox.showerror("Error", f"Failed to configure FPGA. Error code: {error}")
    except ValueError as ve:
        logging.warning(f"Invalid input: {ve}")
        messagebox.showerror("Invalid Input", str(ve))
    except Exception as e:
        logging.error(f"Unexpected error: {e}")
        messagebox.showerror("Error", f"An unexpected error occurred: {e}")

# Create the main window
root = tk.Tk()
root.title("FPGA Connector")
entries_frequency = []
entries_duty_cycle = []
entries_delay = []

for i in range(6):
    tk.Label(root, text=f"Clock {i+1} Frequency:(MHz)").grid(row=i*3, column=0, padx=10, pady=5)
    entry_frequency = tk.Entry(root)
    entry_frequency.grid(row=i*3, column=1, padx=10, pady=5)
    entries_frequency.append(entry_frequency)

    tk.Label(root, text=f"Clock {i+1} Duty Cycle:(decimal)").grid(row=i*3+1, column=0, padx=10, pady=5)
    entry_duty_cycle = tk.Entry(root)
    entry_duty_cycle.grid(row=i*3+1, column=1, padx=10, pady=5)
    entries_duty_cycle.append(entry_duty_cycle)

    tk.Label(root, text=f"Clock {i+1} Delay:(fraction phase shift)").grid(row=i*3+2, column=0, padx=10, pady=5)
    entry_delay = tk.Entry(root)
    entry_delay.grid(row=i*3+2, column=1, padx=10, pady=5)
    entries_delay.append(entry_delay)

# Create and place the submit button
submit_button = tk.Button(root, text="Submit", command=on_submit)
submit_button.grid(row=18, columnspan=2, pady=20)
# Start the GUI event loop
root.mainloop()
