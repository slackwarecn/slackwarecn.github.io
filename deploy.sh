#!/usr/bin/env bash
# ==============================================================================
# Deploy It!
# ==============================================================================
set -ex

function doDeploy ()
{
  local C_DIR=$(dirname $(readlink -f $0))
  local GENERATE_SH="${C_DIR}/generate.sh"
  local CLONE_SH="${C_DIR}/clone.sh"

  if [[ -r $GENERATE_SH ]]
  then
    command $GENERATE_SH
  fi

  if [[ -r $CLONE_SH ]]
  then
    command $CLONE_SH
  fi

  hexo deploy

  return $?
}

doDeploy

if [[ 0 -ne $? ]]
then
  exit $?
fi

