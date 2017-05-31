#!/bin/sh

set -e

SERVER=$1
ENVNAME=$2

# Check the number of argument
if [ "$#" -eq 2 ]; then
  ENV_ROOT=/cvgl/u/chrischoy/.pyv/${SERVER}/${ENVNAME}
  mkdir -p ${ENV_ROOT}
  virtualenv ${ENV_ROOT}

  . ./activate ${SERVER} ${ENVNAME}

  # Upgrade pip
  python .pyv/get-pip.py

  # Install custom libraries
  pip install ipython
else
  echo "Please put the server name and the environment name, you put ${#}" >&2
fi
