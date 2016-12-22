#!/usr/bin/env bash
# ==============================================================================
# Build It!
# ==============================================================================
set -ex

function doBuild ()
{
  local C_DIR=$(dirname $(readlink -f $0))
  local PUBLIC_DIR="${C_DIR}/public"
  local MY_DIR="${C_DIR}/my"
  local THEME_DIR="${C_DIR}/themes"

  if [[ -d $THEME_DIR && -x ${THEME_DIR}/init.sh ]]
  then
    command "${THEME_DIR}/init.sh"
  fi

  if [[ ! -d $MY_DIR ]]
  then
    return 0
  fi

  if [[ -d $PUBLIC_DIR ]]
  then
    rm -rf $PUBLIC_DIR
    mkdir -p $PUBLIC_DIR
  fi

  if type rsync >/dev/null 2>&1
  then
    rsync -a "${MY_DIR}/" "$C_DIR/"
  elif type cp >/dev/null 2>&1
  then
    cp -rf ${MY_DIR}/* $C_DIR
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

