#! /bin/bash




do_query () # name
{
    dig "$1" +noquestion +nostat +noanswer +noauthority 2> /dev/null
}

get_answers_number () # name
{
    local res=$(do_query "$1")
    res=${res##*ANSWER: }
    echo "${res%%,*}"
}

bases=( picture pictures image images)
for base in ${bases[@]}
do
  for adr in ${base}{a..z}{a..z}{a..z}.com ${base}{a..z}{a..z}{a..z}.com
  do
      echo "Checking $adr"
      r=$(dig soa $adr | grep ^$adr | wc -l)
      #echo $r
      if ((r!=0)); then
          echo "Found $adr"
      fi
  done;
done;