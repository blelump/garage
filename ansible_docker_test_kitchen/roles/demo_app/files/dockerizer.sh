#!/bin/bash

username=${1:-kitchen}
password=${1:-kitchen}
homedir=${1:-/home/kitchen}

sed -e "s/_USERNAME_/$username/g" -e "s|_HOMEDIR_|$homedir|g" -e "s/_PASSWORD_/$password/g" env.dockerfile > Dockerfile

