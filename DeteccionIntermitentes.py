# Detección - By: alecoeto - mar oct 17 2023

import sensor, image, time, math, pyb, utime
from pyb import UART


rojo = (53, 91, 122, 45, 17, 74) #Threshold

sensor.reset()
sensor.set_pixformat(sensor.RGB565)
sensor.set_framesize(sensor.QVGA)
sensor.skip_frames(time = 2000)
sensor.set_auto_gain(False)
sensor.set_auto_whitebal(False)

clock = time.clock()
uart = UART(3, 9600, timeout_char=0) #Comunicación serial por medio de UART

#Funcion para detección de intermitentes y enviar resultados por UART
def detectar_luces():

    x = -1
    left = False
    right = False

    for blob in img.find_blobs([rojo], pixels_threshold=200, area_threshold=300, merge=True):
            img.draw_rectangle(blob.rect(), color=(255,255,0))
            img.draw_cross(blob.cx(), blob.cy(), color=(255,255,0))
            img.draw_keypoints([(blob.cx(), blob.cy(), int(math.degrees(blob.rotation())))], size=20)

            x = blob.cx()
            if x < 150:
                left = True

            if x > 170:
                right = True

    if left and right:
        print('3')
        uart.write('3')

    elif left:
        print('1')
        uart.write('1')

    elif right:
        print('2')
        uart.write('2')

    else:
        print('0')
        uart.write('0')


#Loop
while(True):
    clock.tick()
    img = sensor.snapshot()
    detectar_luces()




