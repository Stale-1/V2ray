#!/bin/bash

clear
  echo "Enter your server hostname or domain"
  echo ""
  echo -e "Enter your response \c"
  read -r n
  case $n in
         $n) sed -i "s/stale_domain/$n/g" /root/v2ray.sh && clear
             cd /root && ./uuid.sh;;
  esac
