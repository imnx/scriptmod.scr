#!/bin/bash
printf "========================================================================================n"
printf " ScriptMOD(tm) v1.0 \n"
printf " A modular script containing my most used scripts. \n" 
printf "========================================================================================\n"
printf "\n"
printf "[$(basename $0)]: clearing modlist tmp...\n"
rm -r ./.modlist.tmp; touch ./.modlist.tmp
printf "[$(basename $0)]: gathering mods.\n"
for mod in ./mods/*.mod; do
  source ${mod}
done
printf "[$(basename $0)]: modules installed... \n\n"
cat .modlist.tmp
printf "\n"
printf "[$(basename $0)]: done gathering mods.\n"
read -p "Which ScriptMOD would you like to call?: " modSelect
printf "[$(basename $0)]: calling ScriptMOD \'${modSelect}\'. \n"
`echo ${modSelect}` $@
