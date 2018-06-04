#!/usr/bin/bash

# This script kills the ssh-agent
# It is meant to be placed in ~/.config/plasma-workspace/shutdown/
#       ^ Above location works for Plasma sessions on shutdown
ssh-agent -k
