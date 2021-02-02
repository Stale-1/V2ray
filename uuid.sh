#!/bin/bash

clear
  echo "Enter the generated UUID"
  echo ""
  echo -e "Enter your response \c"
  read -r n
  case $n in
         $n) sed -i "s/stale_uuid/$n/g" /root/v2ray.sh && clear
             cd /root && ./v2ray.sh;;
  esac
