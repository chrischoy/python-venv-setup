# Python Virtual Environment Setup

## Dealing with annoying old servers

If you are working on old servers with no `job scheduler` and want to
standardize python environment settings for all servers without sudo privilege,
you found the right repository.

This repository contains scripts that you might want to use when you set up
servers for the first time. This includes installation, activation and
deactivation of python virtual environments.


## Installation


```
cd ~
git clone https://github.com/chrischoy/python-venv-setup
cd python-venv-setup
ln -s activate $HOME/activate
ln -s deactivate $HOME/deactivate
# Make a virtual environment named $ENV_NAME that is specific for the current $SERVER_NAME
./venv-init.sh $SERVER_NAME $ENV_NAME
```

For python3

```
./venv3-init.sh $SERVER_NAME $ENV_NAME
```

The above script will compile python 3.6.1 from the source.

If you want to use other directory rather than `$HOME`, replace all $HOME with the directory when making symlinks in while installation, also uncomment the
`$HOME` variable in `activate`, `venv-init.sh`, and `venv3-init.sh` and replace it with the directory.


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

## Tips

If few servers have the same configuration, make a symbolic link to share all
the virtual environments.

```
ln -s ~/.pyv/$SOURCESERVER ~/.pyv/$TARGET_SERVER
```
