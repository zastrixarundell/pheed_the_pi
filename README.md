# PheedThePi
A phoenix webserver for getting a livestream from a RaspberryPi camera module + controls of a servo. 

![PTP image](https://raw.githubusercontent.com/zastrixarundell/pheed_the_pi/master/assets/static/images/banner.png "Pheed The Pi")

## Basic server look:
Here is the look when the server is used in development:

![PTP screenshot](https://raw.githubusercontent.com/zastrixarundell/pheed_the_pi/master/assets/static/images/screenshot.png "Pheed The Pi screenshot")

## Starting the server:

### Pre Requirements:
Disregarding which environment you are running in, you have to do:
* `cd assets && npm install`

### Development:
To run the server in development on a normal computer you just need to do:
* `mix phx.server`

Afterwards you will connect to the server on `localhost:4000`. And will be prompted to login. You will use the following default credentials if none custom are set:

* username: `username`
* password: `passw0rd`

Once you have logged in the camera will run in fake mode with a 720p stream. If you have the image that means that the stream is correctly working and it should work on a Raspberry Pi without any issues. 

### Production:
To run the server on a Raspberry Pi you'll have to do more stuff than on production:

* `mix phx.gen.secret`
* `export SECRET_KEY_BASE=(RESULT OF PREVIOUS COMMAND)`
* `MIX_ENV=prod mix phx.server`

You will use the following default credentials if none custom are set:

* username: `username`
* password: `passw0rd`

## Configuring the server:
The server itself isn't created to be too much highly configurable as on a real production-grade server as it is created in mind to be used locally, but you can have custom variables set:

* `PHEED_THE_PI_USERNAME` - a variable for the username during login prompt.
* `PHEED_THE_PI_PASSWORD` - a variable for the password during login prompot.

## Just some fun:
![Serb ball](https://raw.githubusercontent.com/zastrixarundell/pheed_the_pi/master/assets/static/images/image.png "Serb ball")