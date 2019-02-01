#!/bin/bash

# For python3 / Fedora 29 OS
#python3 -m venv azure

# For python3 / Fedora 28 OS
python3 -m virtualenv azure

source azure/bin/activate

pip install 'ansible[azure]'

source ~/.azure/credentials.ENV
