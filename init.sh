#!/usr/bin/env bash
# ==============================================================================
# Init It!
# ==============================================================================

NPM_CMD=''
C_DIR=$(dirname $(readlink -f $0))
MY_DIR=${C_DIR}/my
THEME_DIR=${C_DIR}/themes
BUILD_SH=${C_DIR}/build.sh
PACKAGE_JSON=${C_DIR}/package.json
GITMODULES=${C_DIR}/.gitmodules

cd $C_DIR

if [[ -d $C_DIR/.deploy_git ]]
then
  echo "warn: it seems this repo has been initialized, do nothing."
  exit 0
fi

if ! type git >/dev/null 2>&1
then
  echo "failed: git is needed but not found, quit."
  exit 1
else
  env git clone -b master https://github.com/slackwarecn/slackwarecn.github.io.git ./.deploy_git
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
  exit 1
fi

if ! type hexo >/dev/null 2>&1
then
  echo "failed: hexo is needed but not found. quit."
  exit 1
fi

if [[ -r $GITMODULES && -d ${C_DIR}/.git ]]
then
  env git submodule update --init --recursive
fi

if [[ -r $PACKAGE_JSON ]]
then
  env $NPM_CMD install
fi

if [[ -r $BUILD_SH ]]
then
  source $BUILD_SH
fi

if [[ -r ${THEME_DIR}/init.sh ]]
then
  source ${THEME_DIR}/init.sh
fi

