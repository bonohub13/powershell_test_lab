#!/usr/bin/sh

uname=$USER
uid=`id -u`
gid=`id -g`

# checking if .env file already exists
if [ -f ./.env ]; then
    rm .env
fi

# adding environment variables for docker-compose.yml
echo -e "UNAME=$uname\nUID=$uid\nGID=$gid" | tee .env

echo "done!"
