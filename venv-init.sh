#!/bin/sh

set -e

SERVER=$1
ENVNAME=$2
# Directory that contains the venvs
# PYV_ROOT=/cvgl/u/chrischoy
PYV_ROOT=${HOME}

# Check the number of argument
if [ "$#" -eq 2 ]; then
  ENV_ROOT=${PYV_ROOT}/.pyv/${SERVER}/${ENVNAME}
  mkdir -p ${ENV_ROOT}
  virtualenv ${ENV_ROOT}

  . ./activate ${SERVER} ${ENVNAME}

  # Upgrade pip
  wget https://bootstrap.pypa.io/get-pip.py -O ${ENV_ROOT}
  python ${ENV_ROOT}/get-pip.py

  # Install custom libraries
  pip install ipython
else
  echo "Please put the server name and the environment name, you put ${#}" >&2
fi
