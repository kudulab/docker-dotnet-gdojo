#!/bin/bash -e

###########################################################################
# This file ensures files are mapped from ide_identity into ide_home.
# Fails if any required secret or configuration file is missing.
###########################################################################

function copy_file(){
  source="$1"
  destination="$2"
  is_file="$3"

  if [[ -z "$source" ]]; then
    echo "source not set when copying a file"
    exit 1
  fi
  if [[ -z "$destination" ]]; then
    echo "destination not set when copying a file"
    exit 1
  fi
  if [[ -z "$is_file" ]]; then
    echo "is_file not set when copying a file"
    exit 1
  fi

  if [[ "$is_file" == true && -f "${source}" ]] ||
     [[ "$is_file" == false && -d "${source}" ]]; then
    mkdir -p "${destination}"
    chown ide:ide "${destination}"
    echo "Copying ${source} into ${destination}"
    # this turns bash into debug mode for just 1 command, it uses subshell
    ( set -x; cp -r "${source}" "${destination}"; )
  else
    echo "${source} does not exist, won't copy"
  fi
}

chown -R ide:ide /home/ide/.local/share/MonoDevelop
chown -R ide:ide /home/ide/.config/MonoDevelop/7.0/
