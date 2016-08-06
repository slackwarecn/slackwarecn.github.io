#!/usr/bin/env bash
# ==============================================================================
# Build It!
# ==============================================================================
set -e

function doBuild ()
{
  local C_DIR=$(dirname $(readlink -f $0))
  local MY_DIR="${C_DIR}/my"
  local THEME_DIR="${C_DIR}/themes"

  if [[ -d $THEME_DIR && -x ${THEME_DIR}/init.sh ]]
  then
    source "${THEME_DIR}/init.sh"
  fi

  if [[ ! -d $MY_DIR ]]
  then
    return 0
  fi

  if type rsync >/dev/null 2>&1
  then
    rsync -aP "${MY_DIR}/" "$C_DIR/"
  elif type cp >/dev/null 2>&1
  then
    cp -rvf ${MY_DIR}/* $C_DIR
  else
    return 1
  fi

  return $?
}

doBuild

if [[ 0 -ne $? ]]
then
  exit $?
fi

