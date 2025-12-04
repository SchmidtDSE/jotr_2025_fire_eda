#!/bin/bash

if [ -e "/workspaces/eureka_fire_eda/renv.lock" ]; then
    echo "renv.lock found, copying to /tmp/renv.lock"
    cp /workspaces/eureka_fire_eda/renv.lock /tmp/renv.lock
else
    echo "No renv.lock file found in /workspaces/eureka_fire_eda/"
fi

if [ -e "/workspaces/eureka_fire_eda/.Rprofile" ]; then
    echo ".Rprofile found, copying to /tmp/.Rprofile"
    cp /workspaces/eureka_fire_eda/.Rprofile /tmp/.Rprofile
else
    echo "No .Rprofile file found in /workspaces/eureka_fire_eda/"
fi

if [ -d "/workspaces/eureka_fire_eda/renv" ]; then
    echo "renv directory found, copying to /tmp/renv"
    cp -r /workspaces/eureka_fire_eda/renv /tmp/renv
else
    echo "No renv directory found in /workspaces/eureka_fire_eda/"
fi

