# Dealing with old servers: Python Virtual Environment Setup

If you are working on old servers with no job scheduler and want to standardize
python environment settings for all servers without sudo privilege, you found
the right repository.

This repository contains scripts that you might want to use when you set up
servers for the first time. This includes installation, activation and
deactivation of python virtual environments.


## Install

```
cd ~
git clone https://github.com/chrischoy/python-venv-setup
cd python-venv-setup
# Make a virtual environment named $ENV_NAME that is specific for the current $SERVER_NAME
./venv-init.sh $SERVER_NAME $ENV_NAME
```

If you want to use different path for the home directory, please uncomment the
`$HOME` variable in `activate`, `venv-init.sh`, and `venv3-init.sh`.


## Usage

```
source activate $SERVER $ENV_NAME
```

## Tips

If few servers have the same configuration, make a symbolic link to share all
the virtual environments.

```
ln -s ~/.pyv/$SOURCESERVER ~/.pyv/$TARGET_SERVER
```
