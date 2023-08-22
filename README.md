# Using Build Pattern and Multi-stage Builds with Docker

Note: for better experince use this file in raw mode


Legacy Method:

runnig sh bash.sh will create the application and its dependency. after that the script will provide the nginx based imaged container 
and add the application source from react:build image into a new container "react:latest"
then script will delete the extract container( from react:build image).
as you can see the size of final images "react:latest" is almost as same as its base image wichi is ngins:latest

masoud@Msd-PC:~$ docker images | grep  -E 'nginx|react'
react                             latest      7109ee5c416c   15 minutes ago   187MB
react                             build       4ded83895b90   15 minutes ago   316MB
nginx                             latest      eea7b3dcba7e   6 days ago       187MB

in addition this process has some overhead on managing multiple Dockerfiles

Docker Multi-stage Method:
you can do all the actions in the bash.sh by a multi-stage docker file.
masoud@Msd-PC:~/Public/dockerMultiStageSample/nextStage$ docker build  -t react-ms:latest . -f Dockerfile.ms

masoud@Msd-PC:~$ docker images | grep  -E 'nginx|react'
react-ms                          latest      7109ee5c416c   23 minutes ago   187MB
react                             latest      7109ee5c416c   23 minutes ago   187MB
react                             build       4ded83895b90   23 minutes ago   316MB
nginx                             latest      eea7b3dcba7e   6 days ago       187MB


