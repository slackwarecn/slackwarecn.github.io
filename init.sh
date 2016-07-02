#!/usr/bin/env bash
# ==============================================================================
# Init It!
# ==============================================================================

function doInit ()
{
  local NPM_CMD=''
  local C_DIR=$(dirname $(readlink -f $0))
  local MY_DIR="${C_DIR}/my"
  local THEME_DIR="${C_DIR}/themes"
  local BUILD_SH="${C_DIR}/build.sh"
  local CLONE_SH="${C_DIR}/clone.sh"
  local PACKAGE_JSON="${C_DIR}/package.json"
  local GITMODULES="${C_DIR}/.gitmodules"
  local DEPLOY_GIT="${C_DIR}/deploy_git"

  cd $C_DIR

  if [[ -d $DEPLOY_GIT && -d $GITMODULES ]]
  then
    echo "warn: it seems this repo has been initialized, do nothing."
    return 0
  fi

  if type cnpm >/dev/null 2>&1
  then
    # See https://github.com/cnpm/cnpm
    NPM_CMD=cnpm
  elif type npm >/dev/null 2>&1
  then
    NPM_CMD=npm
  else
    echo "failed: npm or cnpm is needed but not found, quit."
    return 1
  fi

  if ! type hexo >/dev/null 2>&1
  then
    echo "failed: hexo is needed but not found. quit."
    return 1
  fi

  if [[ -r $CLONE_SH ]]
  then
    source $CLONE_SH
  fi

  if [[ -r $GITMODULES && -d ${C_DIR}/.git ]]
  then
    git submodule update --init --recursive
  fi

  if [[ -r $PACKAGE_JSON ]]
  then
    command $NPM_CMD install
  fi

  if [[ -r $BUILD_SH ]]
  then
    source $BUILD_SH
  fi

  if [[ -r ${THEME_DIR}/init.sh ]]
  then
    source ${THEME_DIR}/init.sh
  fi

  return $?
}

doInit

if [[ 0 -ne $? ]]
then
  exit $?
fi

