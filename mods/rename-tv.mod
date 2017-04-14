mod_title="tv-rename"
mod_author="imnx.au"
mod_author_email="imnx.au@outlook.com"
mod_description="description goes here."

printf "[$(basename $0)]: loading module \'${mod_title}\' by \'${mod_author}\' (email: ${mod_author_email}).\n"
echo ${mod_title} >> ./.modlist.tmp

function tv-rename () {
  
  i="0"
  read -p "Series Title: " sTitle
  sTitle=`echo ${sTitle} | tr ' ' .`
  sTitle=`echo ${sTitle} | tr '[:upper:]' '[:lower:]'`
  read -p "Season #: " sInt
  sInt=`echo ${sInt} | printf '%02d' ${sInt}`
  sTags="hdtv.xvid.[imnx]"

  function checkSuccess () {
    if [[ ! ${task0} ]]; then
      return 1
    else
      return 0
    fi
  }

  while read -r line; do
    tmpFile="${line}"
    i=$(($i+1))
    eInt=`printf '%02d' ${i}`
    task0=`mv "${tmpFile}" "${sTitle}.s${sInt}e${eInt}.${sTags}.${tmpFile:(-3)}"`
  done < <(ls -1 | sort -u)

}
