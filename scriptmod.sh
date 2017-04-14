#!/bin/bash

rm -r ./.modlist.tmp; touch ./.modlist.tmp

for mod in ./mods/*.mod; do
  source ${mod}
done

printf "[$(basename $0)]: modules installed... \n\n"
cat .modlist.tmp
printf "\n"
