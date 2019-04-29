#!/bin/bash -e

###########################################################################
# This file ensures files are mapped from dojo_identity into dojo_home.
# Fails if any required secret or configuration file is missing.
###########################################################################

chown -R dojo:dojo /home/dojo/.local/share/MonoDevelop
chown -R dojo:dojo /home/dojo/.config/MonoDevelop/7.0/
