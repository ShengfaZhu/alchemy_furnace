#!/bin/bash
docker build -t alchemy_furnace:1.0 -f Dockerfile --build-arg userid=$(id -u) --build-arg groupid=$(id -g) .
