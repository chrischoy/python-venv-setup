#!/bin/sh

set -e

SERVER=$1
ENVNAME=$2


# Check the number of argument
if [ "$#" -eq 2 ]; then
  ENV_ROOT=/cvgl/u/chrischoy/.pyv/${SERVER}/${ENVNAME}
  PYTHON_ROOT=/cvgl/u/chrischoy/.pyv/${SERVER}/python3/
  mkdir -p ${PYTHON_ROOT}

  # Python3
  cd /cvgl/u/chrischoy/packages/Python-3.6.1/
  ./configure --prefix=${PYTHON_ROOT}
  make -j8
  make install

  # Virtual environment setup
  export OLD_PATH=$PATH
  export PATH=${PYTHON_ROOT}/bin:/usr/local/cuda/bin:$PATH
  python3.6 -m venv ${ENV_ROOT}

  . ./activate ${SERVER} ${ENVNAME}

  # Install custom libraries
  pip3.6 install ipython
else
  echo "Please put the server name and the environment name, you put ${#}" >&2
fi
