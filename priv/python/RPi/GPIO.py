from RPi.pwm import PWMKlass

BOARD = 1
OUT = 1
IN = 2

def setmode(a):
    print('Setmode to: ' + str(a))

def setup(a, b):
    print('Pin ' + str(a) + ' output: '  + str(b == 1))

def output(a, b):
    print('Pin ' + str(a) + ' output: ' + str(b == 1))

def cleanup():
    print('Start cleanup')

def setwarnings(flag):
    print('Set flag: ' + str(flag))

def PWM(pin, clock):
    return PWMKlass(pin, clock)