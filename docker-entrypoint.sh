#!/bin/sh

set -e

echo $SSH_KEY > /root/.ssh/id_rsa
export ANSIBLE_FORCE_COLOR=True
export ANSIBLE_SSH_PIPELINING=1

if [ -f /additional-requirements.yml ]; then
    echo "Installing additional requirements ..."
    ansible-galaxy install /requirements.yml
fi

exec "$@"
