import ok
import time

dev = ok.FrontPanel()
 
 
dev.OpenBySerial("")
dev.LoadDefaultPLLConfiguration()
error = dev.ConfigureFPGA("11.bit")
# It’s a good idea to check for errors here!!
print("Error code: ", error)

dev.SetWireInValue(0x12, 0x1)
dev.UpdateWireIns()

time.sleep(1)

dev.SetWireInValue(0x12, 0x0)
dev.UpdateWireIns()

dev.SetWireInValue(0x00, 0x01)
dev.UpdateWireIns()

dev.SetWireInValue(0x01, 0x01)
dev.UpdateWireIns()

dev.SetWireInValue(0x02, 0x00)
dev.UpdateWireIns()

dev.SetWireInValue(0x03, 0x01)
dev.UpdateWireIns()

dev.SetWireInValue(0x04, 0x01)
dev.UpdateWireIns()

dev.SetWireInValue(0x05, 0x32)
dev.UpdateWireIns()

dev.SetWireInValue(0x06, 0x32)
dev.UpdateWireIns()

dev.SetWireInValue(0x07, 0x32)
dev.UpdateWireIns()

dev.SetWireInValue(0x08, 0x2)
dev.UpdateWireIns()

dev.SetWireInValue(0x09, 0x34)
dev.UpdateWireIns()


dev.SetWireInValue(0x0A, 0x30)
dev.UpdateWireIns()

dev.SetWireInValue(0x0B, 0x4)
dev.UpdateWireIns()

dev.SetWireInValue(0x0C, 0x64)
dev.UpdateWireIns()

dev.SetWireInValue(0x0D, 0x64)
dev.UpdateWireIns()

dev.SetWireInValue(0x0E, 0x0A)
dev.UpdateWireIns()

dev.SetWireInValue(0x0F, 0x5A)
dev.UpdateWireIns()

dev.SetWireInValue(0x10, 0x32)
dev.UpdateWireIns()

dev.SetWireInValue(0x11, 0x32)
dev.UpdateWireIns()

