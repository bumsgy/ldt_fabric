#!/bin/bash

docker-compose -f docker-config/docker-compose.yaml down

docker-compose -f docker-config/docker-compose.yaml up -d
