#!/usr/bin/env bash
# ==============================================================================
# Build It!
# ==============================================================================

C_DIR=$(dirname $(readlink -f $0))
MY_DIR=${C_DIR}/my

if [[ ! -d $MY_DIR ]]
then
  exit 0
fi

if type rsync >/dev/null 2>&1
then
  env rsync -aP ${MY_DIR}/ $C_DIR/
elif type cp >/dev/null 2>&1
then
  env cp -rvf ${MY_DIR}/* $C_DIR
else
  exit 1
fi

