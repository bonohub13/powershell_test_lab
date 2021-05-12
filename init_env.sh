#!/usr/bin/sh

UNAME=user
UID=`id -u`
GID=`id -g`

# checking if .env file already exists
if [ -f ./.env ]; then
    rm .env
fi

# adding environment variables for docker-compose.yml
echo "UNAME=$UNAME\nUID=$UID\nGID=$GID" | tee .env

echo "done!"
