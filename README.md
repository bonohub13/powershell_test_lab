# Powershell Test Lab\n<i>A docker container to test out powershell and have fun!</i>

## Prerequisites
Install these following programs to use this
- docker (docker-rootless might be better...)
    - [how to install docker-rootless](https://docs.docker.com/engine/security/rootless)
- docker-compose
    - [how to install docker-compose](https://docs.docker.com/compose/install)

- - -

## How to use
1. Run ```init_env.sh``` script to pass your UID and GID to the Dockerfile
```./init_run.sh```
2. Run ```docker-compose build``` to build the docker image
3. Run ```docker-compose up -d``` to start the docker container
4. Run ```docker exec -it powershell-test-lab pwsh``` to enter the container with TTY
5. Have fun!

## Notice!
- Make sure to write the powershell scripts inside the ```/home/user/scripts``` directory if you want to keep the scripts!
    - The scripts directory inside the docker container is linked with the ```scripts``` directory under ```powershell-test-lab```
- The docker image is using Archlinux as a base and it has yay (AUR helper) installed to make it easier for anyone to customize
