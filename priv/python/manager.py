import time, threading
from directions import Direction
from motor import Servo
import RPi.GPIO as GPIO

class Manager:

    def __init__(self):        
        GPIO.setmode(GPIO.BOARD)
        self.horizontal_direction = Direction.NONE
        self.vertical_drection = Direction.NONE
        self.horizontal_servo = Servo(12)
        self.vertical_servo = Servo(7)

    def calculate_directions(self):
        self.vertical_servo.move(self.vertical_drection)
        self.horizontal_servo.move(self.horizontal_direction)
        # Repeat this method every 0.01 seconds but in a new thread
        threading.Timer(0.05, self.calculate_directions).start()

    def set_horizontal(self, direction):
        print('Set horizontal to: ' + str(direction))
        self.horizontal_direction = direction

    def set_vertical(self, direction):
        print('Set vertical to: ' + str(direction))
        self.vertical_drection = direction