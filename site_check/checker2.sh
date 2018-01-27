#! /bin/bash
    
bases=( pictures picture image images )

for base in ${bases[@]}
do
  for adr in ${base}{a..z}{a..z}{a..z}.com 
  do
      echo "Checking $adr"
      r=$(dig soa $adr | grep ^$adr | wc -l)
      #echo $r
      if ((r!=0)); then
          echo "Found $adr"
      fi
  done;
done;