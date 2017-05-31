# Python Virtual Environment Setup

## Dealing with annoying old servers

If you are working on old servers with no `job scheduler` and want to
standardize python environment settings for all servers without sudo privilege,
you found the right repository.

This repository contains scripts that you might find useful when you set up
server environments for the first time. This includes installation, activation and
deactivation of python virtual environments.


## Setting up an virtual environment

The following script shows you how to run the script `venv-init.sh` to make an environment named `$ENV_NAME` on `$SERVER_NAME`.

```
# Your server
ssh $SERVER_NAME
# Replace all $HOME with the dir of your choice if you want to use another directory for all venv folders
cd $HOME
git clone https://github.com/chrischoy/python-venv-setup
cd python-venv-setup
# Make symlinks for activate, and deactivate scripts
ln -s activate $HOME/activate
ln -s deactivate $HOME/deactivate
# Make a virtual environment named $ENV_NAME that is specific for the current $SERVER_NAME
./venv-init.sh $SERVER_NAME $ENV_NAME
```

For python3, replace the last line with

```
./venv3-init.sh $SERVER_NAME $ENV_NAME
```

The above script will compile python 3.6.1 from the source.

If you want to use other directory rather than `$HOME`, replace all $HOME with the directory when making symlinks in while installation, also uncomment the
`$HOME` variable in `activate`, `venv-init.sh`, and `venv3-init.sh` and replace it with the directory.
Note that if you source the activation script with the change, it will update your environment variable `$HOME`. Rename it to something else when you do this.


## Usage

```
ssh $SERVER_NAME
# Choose the right server and the virtual environment you want to use
source activate $SERVER_NAME $ENV_NAME
```

When you are done using it, deactivate it

```
source deactivate
```

Note that the activation and deactivation simply modify the environment variables.


## Tips

If few servers have the same configuration, make a symbolic link to share all
the virtual environments.

```
ln -s ~/.pyv/$SOURCESERVER ~/.pyv/$TARGET_SERVER
```
