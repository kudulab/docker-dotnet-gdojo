#!/bin/bash -e

###########################################################################
# This file ensures files are mapped from ide_identity into ide_home.
# Fails if any required secret or configuration file is missing.
###########################################################################

# not obligatory directory, copy it
if [ -d "${ide_identity}/.local/share" ]; then
  mkdir "${ide_home}/.local"
  chown ide:ide "${ide_home}/.local"
  echo "Copying ${ide_identity}/.local/share into ${ide_home}/.local"
  cp -r "${ide_identity}/.local/share" "${ide_home}/.local"
fi
# not obligatory directory, copy it
if [ -d "${ide_identity}/.mono" ]; then
  echo "Copying ${ide_identity}/.mono into ${ide_home}/"
  cp -r "${ide_identity}/.mono" "${ide_home}"
fi
# not obligatory directory, copy it
if [ -d "${ide_identity}/.config" ]; then
  echo "Copying ${ide_identity}/.config into ${ide_home}/"
  cp -r "${ide_identity}/.config" "${ide_home}"
fi
