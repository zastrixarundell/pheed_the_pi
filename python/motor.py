from directions import Direction
from time import sleep
import RPi.GPIO as GPIO

# What is the angle step between each recursion
STEP = 5

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
        self.duty = 0

    def move(self, direction):
        # Return if it should not be moving
        if direction == Direction.NONE:
            if self.duty != 0:
                GPIO.output(self.pin, True)
                self.pwm.ChangeDutyCycle(0)
                GPIO.output(self.pin, False)
            return

        # Increment the angle by STEP or decrement by STEP depending on the Enum
        if direction.value > 0:
            self.angle += STEP
        else:
            self.angle -= STEP

        # Cap the values to +/- 90 degrees
        if self.angle < -90:
            self.angle = -90
        elif self.angle > 90:
            self.angle = 90
        pass

        print('Angle: ' + str(self.angle))
        # Generate the PWM
        self.duty = (float(self.angle) + 90.0) / 18.0 + 2.0
        print('Duty cycle is: ' + str(self.duty))
        # Set it give output
        GPIO.output(self.pin, True)
        self.pwm.ChangeDutyCycle(self.duty)
        GPIO.output(self.pin, False)    
        sleep(0.1)    
        self.pwm.ChangeDutyCycle(0)
        self.duty = 0

