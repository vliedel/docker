#!/bin/bash

docker build -t dobots/aim_base - < aim-base-img.txt
docker build -t dobots/aim_zmq - < aim-zmq-img.txt
docker build -t dobots/aim_dodedodo - < aim-dodedodo-img.txt
