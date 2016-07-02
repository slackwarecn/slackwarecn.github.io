#!/usr/bin/env bash
# ==============================================================================
# Clone It!
# ==============================================================================

function doClone ()
{
  local C_DIR=$(dirname $(readlink -f $0))
  local GIT_DIR="${C_DIR}/.deploy_git"
  local CONFIG_YML="${C_DIR}/_config.yml"
  local REG_URL='https?://(([\w\d\.-]+\.\w{2,6})|(\d{1,3}(\.\d{1,3}){3}))(:\d{1,4})*(/[\w\d\&%\./-~-]*)?'
  local REG_BRANCH='(?<=^branch:)[\w]+'
  local DEFAULT_BRANCH='master'
  local DEPLOY_INFO=''
  local REPOSITORY=''
  local BRANCH=''

  cd $C_DIR

  if ! type git >/dev/null 2>&1
  then
    echo "failed: git is needed but not found, quit."
    return 1
  else
    if [[ ! -d $GIT_DIR ]]
    then
      rm -f $GIT_DIR

      DEPLOY_INFO=$(grep -P -A 3 '^deploy:$' $CONFIG_YML)
      REPOSITORY=$(echo $DEPLOY_INFO | grep -oP $REG_URL)
      BRANCH=$(echo $DEPLOY_INFO | sed 's/[[:space:]]//g' | grep -oP $REG_BRANCH)

      if [[ -z $REPOSITORY ]]
      then
        return 1
      fi

      if [[ -z $BRANCH ]]
      then
        BRANCH=$DEFAULT_BRANCH
      fi

      git clone -b $BRANCH $REPOSITORY $(basename $GIT_DIR)
    fi
  fi

  return $?
}

doClone

if [[ 0 -ne $? ]]
then
  exit $?
fi

