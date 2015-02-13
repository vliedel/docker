#!/bin/bash

if [ "$1" == "all" ] ; then
	docker ps -a | awk '{print $1}' | xargs --no-run-if-empty docker rm
else
	docker ps -a | grep 'months ago' | awk '{print $1}' | xargs --no-run-if-empty docker rm
fi
