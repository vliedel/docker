#!/bin/bash

# TODO: use a makefile instead?

declare -a targets=("aim-base" "aim-zmq" "aim-nodejs" "aim-yarp" "aim-ros" "aim-dodedodo" "inertia")

if [ $# -lt 1 ] ; then
	echo "Usage: $0 target..."
	echo "targets: all ${targets[@]}"
	exit
fi

if [ "$1" == "all" ] ; then
	build=(${targets[@]})
else
	build=($@)
fi


for i in "${build[@]}"
do
	if [ "$i" == "aim-base" ] ; then
		echo "build $i"
		sudo docker build -t dobots/aim_base - < aim-base-img.txt
	fi

	if [ "$i" == "aim-nodejs" ] ; then
		echo "build $i (requires: aim-base)"
		sudo docker build -t dobots/aim_nodejs - < aim-nodejs-img.txt
	fi

	if [ "$i" == "aim-zmq" ] ; then
		echo "build $i (requires: aim-base)"
		sudo docker build -t dobots/aim_zmq - < aim-zmq-img.txt
	fi

	if [ "$i" == "aim-dodedodo" ] ; then
		echo "build $i (requires: aim-zmq)"
		sudo docker build -t dobots/aim_dodedodo - < aim-dodedodo-img.txt
	fi


	if [ "$i" == "inertia" ] ; then
		echo "build inertia (requires: aim-nodejs)"
		sudo docker build -t dobots/inertia - < inertia-img.txt
		sudo docker build -t dobots/inertia_java - < inertia-java-img.txt
	fi
done


