#!/bin/bash
#  vim:ts=4:sts=4:sw=4:et
#
#  Author: Hari Sekhon
#  Date: 2022-01-16 12:24:37 +0000 (Sun, 16 Jan 2022)
#
#  https://github.com/HariSekhon/Dockerfiles
#
#  License: see accompanying Hari Sekhon LICENSE file
#
#  If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback to help steer this or other code I publish
#
#  https://www.linkedin.com/in/HariSekhon
#

set -euo pipefail
[ -n "${DEBUG:-}" ] && set -x

# trying to do -exec basename {} \; results in only the jython files being printed
find -L "$1" -maxdepth 1 -type f -iname '[A-Za-z]*.py' -o -type f -iname '[A-Za-z]*.jy' |
xargs -n1 basename |
sort
