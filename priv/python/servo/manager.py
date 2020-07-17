import time, threading
from directions import Direction
from motor import Servo
import RPi.GPIO as GPIO

GPIO.setmode(GPIO.BOARD)

horizontal_direction = Direction.NONE
vertical_drection = Direction.NONE

horizontal_servo = Servo(12)
vertical_servo = Servo(7)

def calculate_directions():
    vertical_servo.move(vertical_drection)
    horizontal_servo.move(horizontal_direction)
    threading.Timer(0.01, calculate_directions).start()

def start_manager():
    calculate_directions()