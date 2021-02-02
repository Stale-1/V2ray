#!/bin/bash

clear
  echo "Enter the link of your SSL Key"
  echo "Do not include https://api.cl1p.net/"
  echo ""
  echo "For Example, the link of your Key is"
  echo "https://cl1p.net/key"
  echo "Only copy the values after the /"
  echo "So you will paste only the word 'key'"
  echo "rather than the whole link"
  echo ""
  echo ""
  echo -e "Enter your response \c"
  read -r n
  case $n in
         $n) sed -i "s/stale_key/$n/g" /root/v2ray.sh && clear
             cd /root && ./domain.sh;;
  esac
