#!/usr/bin/env bash
#  vim:ts=4:sts=4:sw=4:et
#
#  Author: Michael
#  Date: 2022-03-03 16:00:32
#

set -euxo pipefail
[ -n "${DEBUG:-}" ] && set -x

mkdir -pv /github

repo=nagios-plugins

apt-get update

apt-get install -y git make

if ! [ -d "/github/$repo" ]; then
    git clone "https://github.com/harisekhon/$repo" "/github/$repo"
    cd "/github/$repo"
    git submodule update --init --recursive
fi

cd "/github/$repo"

make python

make system-packages-remove

apt-get autoremove -y

apt-get clean

#EXT=py make deep-clean test

# run tests after autoremove to check that no important packages we need get removed
pushd pylib
make test deep-clean
popd

# leave git it's needed for Git-Python and check_git_branch_checkout.pl/py
# leave make, it's needed for quick updates
#apt-get purge -y make

apt-get autoremove -y

apt-get clean

bash-tools/check_docker_clean.sh

find . -name '*.pl' -exec rm -v {} \;

# basic test for missing dependencies again
tests/help.sh

rm -fr bash-tools lib pylib/bash-tools
