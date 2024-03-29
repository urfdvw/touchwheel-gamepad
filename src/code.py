#%% import and define
import time
from time import sleep
import board
import busio
import adafruit_mpr121
from touchwheel import TouchWheelPhysics
i2c = busio.I2C(board.SCL, board.SDA)
mpr121 = adafruit_mpr121.MPR121(i2c)
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
#%% test

print("startplot:", "x", "y")  # For data ploting
for i in range(100000):
    sleep(0.01)
    raw = wheel_phy.get()
    print(raw.x, raw.y)