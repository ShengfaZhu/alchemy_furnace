#!/bin/bash
docker build -t alchemy_furnace:vim -f Dockerfile --build-arg userid=$(id -u) --build-arg groupid=$(id -g) .
