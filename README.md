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

The wording for the different variables is wrong (see below). So use `XMPP_NAMESERVER_USERNAME` instead of `DODEDODO_USERNAME` for now. 

The resource is currently used on the website. Start with `raspberrypi_` here to visualize it nice on it.

    export DODEDODO_RESOURCE=raspberypi_docker

Then, start the container by using:
```bash
sudo docker pull dobots/aim_dodedodo
sudo docker run -e XMPP_NAMESERVER_USERNAME=$DODEDODO_USERNAME -e XMPP_NAMESERVER_PASSWORD=$DODEDODO_PASSWORD -e XMPP_NAMESERVER_RESOURCE=$DODEDODO_RESOURCE -e AIM_WORKSPACE=/aim_workspace -i -t dobots/aim_dodedodo bash
```

You can see if the environmental variables came through by typing `env` in the docker.

Then you can start the dodedodo nameserver:
```bash
 dodedodo
```

If you now go to the [Dodedodo website](http://www.dodedodo.com) you can drop a module on the docker and press start. You will see it will get this command, download the source code, compile it, and run it! It is really nice to see! :-)

And use the Dodedodo website to manage the modules running in your container.
Note that many modules will not run, since many libraries are missing (to keep the image size small).
