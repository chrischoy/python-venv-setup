#!/bin/sh

set -e

SERVER=$1
ENVNAME=$2
# HOME=/cvgl/u/chrischoy/

# Check the number of argument
if [ "$#" -eq 2 ]; then
  ENV_ROOT=${HOME}/.pyv/${SERVER}/${ENVNAME}
  PYTHON_ROOT=${HOME}/.pyv/${SERVER}/python3/
  mkdir -p ${PYTHON_ROOT}

  # Python3
  wget https://www.python.org/ftp/python/3.6.1/Python-3.6.1.tgz -O ${PYTHON_ROOT}
  cd ${PYTHON_ROOT}
  ./configure --prefix=${PYTHON_ROOT}
  make -j8
  make install

  # Virtual environment setup
  export OLD_PATH=$PATH
  export PATH=${PYTHON_ROOT}/bin:/usr/local/cuda/bin:$PATH
  python3.6 -m venv ${ENV_ROOT}

  cd ${HOME}
  . ./activate ${SERVER} ${ENVNAME}

  # Install custom libraries
  pip3.6 install ipython
else
  echo "Please put the server name and the environment name, you put ${#}" >&2
fi
