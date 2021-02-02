#!/bin/bash

clear
  echo "1) Install V2ray Vmess Protocol + Websocket + TLS"
  echo "2) Generate UUID"
  echo "3) V2ray Server Details"
  echo "0) Exit"
  echo ""
  echo ""
  echo -e "Enter your response \c"
  read -r answer
  case "$answer" in
    1) clear && cd /root && ./cert.sh
    2) curl -skL -w "\n" https://www.uuidgenerator.net/api/version4;;
    3) nano /root/v2rayserver;;
    0) clear && exit;;
  esac
