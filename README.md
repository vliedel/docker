# Docker AIM images
With these [docker](http://www.docker.io) files, images can be made to run [AIM](http://dobots.github.io/aim) Modules. There are several images, so you can choose the one you like.

## Base image
This image has the AIM tools installed, enabling you to create, compile and run modules. You still have to install a middleware (like ROS, YARP or ZeroMQ) to connect the modules.

## ZMQ image
This image has ZeroMQ installed, including nameserver and connect program.

## Dodedodo image
This image has the dodedodo nameserver installed, enabling you to manage the modules via XMPP.
To use the dodedodo nameserver, it is easiest to create an account at the [Dodedodo website](http://www.dodedodo.com).
Fill in the username and password as environmental variables in the docker run command below.
Then, start the container by using:
```bash
 docker pull dobots/aim_dodedodo
 docker run -e XMPP_NAMESERVER_USERNAME=yourusername -e XMPP_NAMESERVER_PASSWORD=yourpassword -e XMPP_NAMESERVER_RESOURCE=raspberrypi_somename -e AIM_WORKSPACE=/aim_workspace -i -t dobots/aim_dodedodo bash
```

Then you can start the dodedodo nameserver:
```bash
 dodedodo
```

And use the Dodedodo website to manage the modules running in your container.
Note that many modules will not run, since many libraries are missing (to keep the image size small).
