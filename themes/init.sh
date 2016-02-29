#!/usr/bin/env bash
# ==============================================================================
# Init Themes!
# ==============================================================================

function initTheme {
  [[ -z $THEME_DIR ]] && local THEME_DIR=$(dirname $(readlink -f $0))
  local GITKEEP=${THEME_DIR}/hexo-theme-next/layout/_scripts/bootstrap/.gitkeep

  if [[ -w $GITKEEP ]]
  then
    rm -f $GITKEEP
  fi

  return $?
}

initTheme

