#!/bin/sh
echo Building react:build 
docker build -t react:build . -f Dockerfile.build 

docker create --name extract react:build

docker cp extract:/app/build ./app 


echo Building react:latest

docker build --no-cache -t react:latest . -f Dockerfile.main

echo  Deleting extract container
docker rm -f extract 
