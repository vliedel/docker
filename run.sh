#!/bin/bash

declare -a targets=("aim-base" "aim-zmq" "aim-nodejs" "aim-yarp" "aim-ros" "aim-dodedodo" "inertia")

if [ $# -lt 1 ] ; then
        echo "Usage: $0 target"
        echo "targets: ${targets[@]}"
        exit
fi



if [ "$1" == "aim-base" ] ; then
	echo "run $1"
	sudo docker run -e AIM_WORKSPACE=/aim_workspace -i -t dobots/aim_base bash
fi

if [ "$1" == "aim-nodejs" ] ; then
	echo "run $1"
	sudo docker run -e AIM_WORKSPACE=/aim_workspace -i -t dobots/aim_nodejs bash
fi

if [ "$1" == "aim-zmq" ] ; then
	echo "run $1"
	sudo docker run -e AIM_WORKSPACE=/aim_workspace -i -t dobots/aim_zmq bash
fi

if [ "$1" == "aim-dodedodo" ] ; then
	echo "run $1"
	sudo docker run -e XMPP_NAMESERVER_USERNAME=$DODEDODO_USERNAME -e XMPP_NAMESERVER_PASSWORD=$DODEDODO_PASSWORD -e XMPP_NAMESERVER_RESOURCE=$DODEDODO_RESOURCE -e AIM_WORKSPACE=/aim_workspace -i --privileged -v /dev/rfxcom:/dev/rfxcom -t dobots/aim_dodedodo bash
fi


if [ "$1" == "inertia" ] ; then
	echo "run $1"
	sudo docker run -p 49160:8090 -d dobots/inertia_java
fi
