#!/bin/sh

set -eo pipefail

# To work, tlp-stat must be sudoable without password :
# In /etc/sudoers
# user ALL=(ALL) NOPASSWD: /usr/bin/tlp-stat

battery=$(sudo tlp-stat -b | tail -2 | head -n 1 | tr -d -c "[:digit:],.")

echo "$battery"
