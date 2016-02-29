#!/usr/bin/env bash
# ==============================================================================
# Generate It!
# ==============================================================================

C_DIR=$(dirname $(readlink -f $0))
BUILD_SH=$C_DIR/build.sh

if [[ -r $BUILD_SH ]]
then
  source $BUILD_SH
fi

env hexo generate

