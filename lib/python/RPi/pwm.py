import time

class PWMKlass:
    def __init__(self, pin, clock):
        print('Starting PWM on pin ' + str(pin) + ' at: ' + str(clock) + 'Hz.')
        self.clock = clock
        self.cycle = 0
        self.pin = pin

    def start(self, duty_cycle):
        self.cycle = duty_cycle
        print('Set duty cycle on pin ' + str(self.pin) + ' to: ' + str(round(self.cycle, 2)))

    def ChangeDutyCycle(self, duty_cycle):
        self.start(duty_cycle)