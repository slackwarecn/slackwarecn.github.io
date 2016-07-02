#!/usr/bin/env bash
# ==============================================================================
# Push It!
# ==============================================================================
# Here branch is "source" to me
# {
BRANCH='source'
# }

function doPush ()
{
  local C_DIR=$(dirname $(readlink -f $0))
  local T_DIR=$(pwd)
  local G_DIR="${C_DIR}/.git"
  local G_CONF="${G_DIR}/config"
  local G_FLAGS="--porcelain --ignore-submodules=dirty"
  local G_STATUS=''
  local remote=''

  cd $C_DIR

  if [[ ! -r $G_CONF ]]
  then
    echo "Not a git repository, quit." >&2
    cd $T_DIR
    return 1
  fi

  remote=( $(grep -oP '(?<=\[remote\h")\w+(?="\])' $G_CONF) )
  remote=${remote[0]}

  if [[ -z $remote ]]
  then
    remote='origin'
  fi

  G_STATUS=$(git status ${G_FLAGS} 2>/dev/null | tail -n 1 )
  if [[ -n $G_STATUS ]]
  then
    echo "Repo is dirty, do noting." >&2
    cd $T_DIR
    return 1
  fi

  git push $remote $BRANCH
  cd $T_DIR

  return 0
}

doPush

if [[ 0 -ne $? ]]
then
  exit $?
fi

