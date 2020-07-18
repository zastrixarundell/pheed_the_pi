# PheedThePi
An Elixir Phoenix webserver for getting a livestream from a RaspberryPi camera module + Python controls of a servo motor using erlport. 

![PTP image](https://raw.githubusercontent.com/zastrixarundell/pheed_the_pi/master/assets/static/images/banner.png "Pheed The Pi")

## Note
This has not yet been tested on a real pi since the Python code was added.

## Basic server look
Here is the look when the server is used in development:

![PTP screenshot](https://raw.githubusercontent.com/zastrixarundell/pheed_the_pi/master/assets/static/images/screenshot.png "Pheed The Pi screenshot")

## Starting the server

### Pre Requirements
Disregarding which environment you are running in, you have to do:
* `cd assets && npm install`

### Development
To run the server in development on a normal computer you just need to do:
* `mix phx.server`

Afterwards you will connect to the server on `localhost:4000`. And will be prompted to login. You will use the following default credentials if none custom are set:

* username: `username`
* password: `passw0rd`

Once you have logged in the camera will run in fake mode with a 720p stream. If you have the image that means that the stream is correctly working and it should work on a Raspberry Pi without any issues. 

#### Notes

This won't use the real `RPi` because it can not be loaded on a non-ARM system. That's why there is a mock `RPi` module present and is deleted on the start of the application under production. This fake module will give you some prints of the state of the `GPIO` and `PWM`.

The `erlport` module in `python/erlport` is as well fake just so that it can  as BEAM will provide it nad is deleted when you start the application. 

### Production
To run the server on a Raspberry Pi you'll have to do more stuff than on production:

* `mix phx.gen.secret`
* `export SECRET_KEY_BASE=(RESULT OF PREVIOUS COMMAND)`
* `MIX_ENV=prod mix phx.server`

You will use the following default credentials if none custom are set:

* username: `username`
* password: `passw0rd`

## Configuring the server
The server itself isn't created to be too much highly configurable as on a real production-grade server as it is created in mind to be used locally, but you can have custom variables set:

* `PHEED_THE_PI_USERNAME` - a variable for the username during login prompt.
* `PHEED_THE_PI_PASSWORD` - a variable for the password during login prompot.

## Just some fun
![Serb ball](https://raw.githubusercontent.com/zastrixarundell/pheed_the_pi/master/assets/static/images/image.png "Serb ball")