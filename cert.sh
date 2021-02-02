#!/bin/bash

clear
  echo "Enter the link of your SSL Certificate"
  echo "Do not include https://api.cl1p.net/"
  echo ""
  echo "For Example, the link of your certificate is"
  echo "https://cl1p.net/cert"
  echo "Only copy the values after the /"
  echo "So you will paste only the word 'cert'"
  echo "rather than the whole link"
  echo ""
  echo ""
  echo -e "Enter your response \c"
  read -r n
  case $n in
         $n) sed -i "s/stale_cert/$n/g" /root/v2ray.sh && clear
             cd /root && ./key.sh;;
  esac
