from directions import Direction
from time import sleep
import RPi.GPIO as GPIO

# What is the angle step between each recursion
STEP = 0.1

class Servo: 
    def __init__(self, pin):
        self.pin = pin
        self.angle = 0
        # Set the pin to output mode
        GPIO.setup(pin, GPIO.OUT)
        # Set the PWM to 50MHz
        self.pwm = GPIO.PWM(pin, 50)
        # Set the duty cycle to 0
        self.pwm.start(0)

    def move(self, direction):
        # Return if it should not be moving
        if direction == Direction.NONE:
            GPIO.output(self.pin, True)
            self.pwm.ChangeDutyCycle(0)
            GPIO.output(self.pin, False)
            return

        # Increment the angle by STEP or decrement by STEP depending on the Enum
        self.angle += STEP if direction.value > 0 else -STEP

        # Cap the values to +/- 90 degrees
        if self.angle < -90:
            self.angle = -90
        elif self.angle > 90:
            self.angle = 90
        pass

        # Generate the PWM
        duty = (self.angle + 90) / 18 + 2
        print('Duty cycle is: ' + str(duty))
        # Set it give output
        GPIO.output(self.pin, True)
        self.pwm.ChangeDutyCycle(duty)
        GPIO.output(self.pin, False)        
