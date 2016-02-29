#!/usr/bin/env bash
# ==============================================================================
# Deploy It!
# ==============================================================================

C_DIR=$(dirname $(readlink -f $0))
GENERATE_SH=$C_DIR/generate.sh

if [[ -r $GENERATE_SH ]]
then
  source $GENERATE_SH
fi

env hexo deploy

