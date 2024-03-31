#%% import and define
import time
from time import sleep
import board
import busio
import adafruit_mpr121
from touchwheel import TouchWheelPhysics, TouchWheelNavigationEvents
import usb_hid
from adafruit_hid.mouse import Mouse
i2c = busio.I2C(board.SCL, board.SDA)
mpr121 = adafruit_mpr121.MPR121(i2c)
mouse = Mouse(usb_hid.devices)
#%%
wheel_phy = TouchWheelPhysics(
    up=mpr121[1],
    down=mpr121[3],
    left=mpr121[5],
    right=mpr121[2],
    center=mpr121[4],
    # comment the following 2 lines to enter range measuring mode
    pad_max = [262, 296, 288, 279, 315] ,
    pad_min = [145, 165, 178, 157, 170] ,
    touch_high=False
)
navi_events = TouchWheelNavigationEvents(
    wheel_phy,
    N=10,  # number of dial per-cycle, increase N to speed up dial but decrease accuracy
)

#%% test
# print("startplot:", "x", "y")  # For data ploting
for i in range(100000):
    event = navi_events.get()
    raw = navi_events.phy
    # print(raw.x, raw.y)
    if raw.z > 0.8:
        mouse.move(
            x=int(raw.x * 8),
            y=-int(raw.y * 8),
        )
    if event:
        print(event)
        if event.val == 'center':
            if event.name == 'release':
                mouse.press(Mouse.LEFT_BUTTON)
                mouse.release(Mouse.LEFT_BUTTON)
            if event.name == 'long':
                mouse.press(Mouse.RIGHT_BUTTON)
                mouse.release(Mouse.RIGHT_BUTTON)

# for i in range(100000):
#     raw = wheel_phy.get()
#     if wheel_phy.z.now > 0.8:
#         mouse.move(
#             x=int(raw.x * 10),
#             y=-int(raw.y * 10),
#         )