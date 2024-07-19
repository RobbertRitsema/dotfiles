#!/usr/bin/zsh

#     shell helper functions
# most written by Nathaniel Maia
# some pilfered from around the web

function cheat () {
    curl cht.sh/$1
}

mkzip()
{
    zip -r ${PWD##*/}.zip $*
}

git-clean() {
  git fetch -p && for branch in $(git for-each-ref --format '%(refname) %(upstream:track)' refs/heads | awk '$2 == "[gone]" {sub("refs/heads/", "", $1); print $1}'); do git branch -D $branch; done
}
