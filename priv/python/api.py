from erlport.erlang import set_message_handler, cast
from erlport.erlterms import Atom
from servo.manager import Manager
from servo.directions import Direction

message_handler = None #reference to the elixir process to send result to
manager = Manager()

def cast_message(pid, message):
    cast(pid, (Atom(b'python'), message))

def register_handler(pid):
    #save message handler pid
    global message_handler
    message_handler = pid
    manager.calculate_directions()


def handle_message(message):
    message = message.decode("utf-8")
    print("Received message from Elixir: " + message) 
    cast_message(message_handler, 'Here you go: ' + message)

set_message_handler(handle_message)

def message(message):
    message = message.decode("utf-8") 
    print('Hey, python has gotten the message: ' + message)
    return 'test'

def set_direction(button, pressed):
    button = button.decode("utf-8")
    
    if button == "left":
        if pressed:
            manager.set_horizontal(Direction.LEFT)
        else:
            manager.set_horizontal(Direction.NONE)
    elif button == "right":
        if pressed:
            manager.set_horizontal(Direction.RIGHT)
        else:
            manager.set_horizontal(Direction.NONE)
    elif button == "up":
        if pressed:
            manager.set_horizontal(Direction.UP)
        else:
            manager.set_horizontal(Direction.NONE)
    else:
        if pressed:
            manager.set_horizontal(Direction.DOWN)
        else:
            manager.set_horizontal(Direction.NONE)
