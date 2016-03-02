#!/usr/bin/env bash
# ==============================================================================
# Init Themes!
# ==============================================================================

function initTheme {
  [[ -z $THEME_DIR ]] && local THEME_DIR=$(dirname $(readlink -f $0))
  local GITKEEP=${THEME_DIR}/hexo-theme-next/layout/_scripts/bootstrap/.gitkeep
  local LANGDIR=${THEME_DIR}/hexo-theme-next/languages

  if [[ -w $GITKEEP ]]
  then
    rm -f $GITKEEP
  fi

  if [[ -d $LANGDIR ]]
  then
    find $LANGDIR -name '*.yml' -type f | \
      xargs -I {} grep -LP 'joinus:' {} | \
      xargs -I {} sed -i 's/menu:/menu:\n  joinus: Join US/' {}
  fi

  return $?
}

initTheme

