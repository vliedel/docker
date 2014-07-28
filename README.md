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

If you need to expose one of the block-devices to your docker, you will need to virtualize it too. For example, for the [RFXcomModule](https://github.com/mrquincle/aim_modules/tree/master/RFXcomModule) you require a RFXcom device:
```bash
--privileged -v /dev/rfxcom:/dev/rfxcom 
```

You can see a full docker command in `run.sh`. Note that `sudo` is used. As explained in [this askubuntu](http://askubuntu.com/questions/477551/how-can-i-use-docker-without-sudo) answer, it is possible to give non-root access to docker by creating a Unix group `docker`. However, summarized the docker group is root-equivalent. Only when Linux namespaces are improved root privileges for running a container will not be required anymore (see [docker doc](https://docs.docker.com/articles/security/#docker-daemon-attack-surface)). Note, that this is only about running the docker yourself. The programs within the docker are of course not root.

Now you started you docker, you can see the environmental variables that came through by typing `env`.

Then you can start the dodedodo nameserver:
```bash
 dodedodo
```

If you now go to the [Dodedodo website](http://www.dodedodo.com) you can drop a module on the docker and press start. You will see it will get this command, download the source code, compile it, and run it! It is really nice to see! :-)

And use the Dodedodo website to manage the modules running in your container.
Note that many modules will not run, since many libraries are missing (to keep the image size small).
