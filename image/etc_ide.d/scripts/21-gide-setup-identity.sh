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

# not obligatory files or directories, copy them:
copy_file "${ide_identity}/.local/share/MonoDevelop-5.0" "${ide_home}/.local/share" "false"
copy_file "${ide_identity}/.local/share/recently-used.xbel" "${ide_home}/.local/share" "true"
copy_file "${ide_identity}/.mono" "${ide_home}" "false"
copy_file "${ide_identity}/.config/MonoDevelop" "${ide_home}/.config" "false"
copy_file "${ide_identity}/.config/MonoDevelop-5.0" "${ide_home}/.config" "false"
copy_file "${ide_identity}/.config/NuGet" "${ide_home}/.config" "false"
copy_file "${ide_identity}/.config/gtk-2.0" "${ide_home}/.config" "false"
copy_file "${ide_identity}/.config/stetic" "${ide_home}/.config" "false"
copy_file "${ide_identity}/.config/xbuild" "${ide_home}/.config" "false"
