#!/bin/bash

# For python3 / Fedora 28 OS
python3 -m virtualenv aws

source aws/bin/activate

pip install boto boto3 netaddr passlib

source ~/.aws/credentials.ENV
