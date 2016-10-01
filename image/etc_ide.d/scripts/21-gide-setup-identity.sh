#!/bin/bash -e

###########################################################################
# This file ensures files are mapped from ide_identity into ide_home.
# Fails if any required secret or configuration file is missing.
###########################################################################

# not obligatory directory, copy it
if [ -d "${ide_identity}/.local/share" ]; then
  mkdir "${ide_home}/.local"
  chown ide:ide "${ide_home}/.local"
  cp -r "${ide_identity}/.local/share" "${ide_home}/.local"
fi
# not obligatory directory, copy it
if [ -d "${ide_identity}/.mono" ]; then
  cp -r "${ide_identity}/.mono" "${ide_home}"
fi
