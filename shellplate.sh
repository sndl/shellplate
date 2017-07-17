#!/bin/sh

function show_help {
  echo "usage: ./shellplate.sh file1 file2 file3" 
}

if [ -z "$1" ]
then
  show_help
fi

for tpl in "$@"
do
  if [ ! -f "$tpl" ] 
  then
    echo "ERROR: File does not exist: $tpl"
    exit 1
  fi

  for env_var in $(env)
  do
    pattern="s#__${env_var%=*}__#${env_var##*=}#g"
    sed -i -e "$pattern" $tpl
  done

  grep '__.*__' $tpl
  if [ "$?" == 0 ]
  then
    echo "ERROR: Not all variables are set in $tpl"
    exit 1
  fi
done

exit 0
