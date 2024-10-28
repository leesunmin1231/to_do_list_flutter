#!/bin/bash

function generate_project_tree() {
  # Original from https://stackoverflow.com/a/35889620/11929317
  # This is a ported version for mac

  IGNORED="venv|update-readme.sh|README.md|*.g.dart"
  SED_FOR_MAC="gsed"

  if [[ "$OSTYPE" == "darwin"* ]]; then
    if command -v $SED_FOR_MAC >/dev/null; then
      SED=$SED_FOR_MAC
    else
      echo "$SED_FOR_MAC not installed!" && exit 1
    fi
  else
    SED="sed"
  fi

  {
    echo "### Flutter study docs"
    tree -f --noreport -I $IGNORED --charset ascii "docs" |  # "docs" 폴더 트리 출력
      $SED -e '1d' |                                         # Cut first line
      $SED -e 's/| \+/  /g' |                                # Remove duplicated '|'
      $SED -e 's/[|`]-\+/ */g' |                             # Replace '|--' with '*'
      $SED -e 's:\(* \)\(\(.*/\)\([^/]\+\)\):\1[\4](\2):g'   # Add link for contents

    echo -e "\n\n### To do list code"
    tree -f --noreport -I $IGNORED --charset ascii "lib" |  # "lib" 폴더 트리 출력
      $SED -e '1d' |                                        # Cut first line
      $SED -e 's/| \+/  /g' |                               # Remove duplicated '|'
      $SED -e 's/[|`]-\+/ */g' |                            # Replace '|--' with '*'
      $SED -e 's:\(* \)\(\(.*/\)\([^/]\+\)\):\1[\4](\2):g'  # Add link for contents
  }
}

function generate_readme() {
  readme="$1/README.md"
  readme_template="$1/templates/readme_template.md"

  perl -p0e 's/--PROJECT_TREE--/`cat`/se' "$readme_template" > "$readme"
}

cd "$(dirname "$0")" || exit 1
generate_project_tree . | generate_readme .