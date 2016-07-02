#!/usr/bin/env bash
# ==============================================================================
# Generate It!
# ==============================================================================

function doGenerate ()
{
  local C_DIR=$(dirname $(readlink -f $0))
  local BUILD_SH="${C_DIR}/build.sh"

  if [[ -r $BUILD_SH ]]
  then
    source $BUILD_SH
  fi

  hexo clean
  hexo generate

  return $?
}

doGenerate

if [[ 0 -ne $? ]]
then
  exit $?
fi

