#/bin/bash
cd /root
wget -q https://raw.githubusercontent.com/Stale-1/V2ray/main/v2raymenu.sh -O /root/v2raymenu.sh && cd /root && chmod +x v2raymenu.sh
echo "function stale() {" >> .bashrc
echo "  /root/./v2raymenu.sh" >> .bashrc
echo "}" >> .bashrc
wget -q https://raw.githubusercontent.com/Stale-1/V2ray/main/try.sh -O /root/v2ray.sh && cd /root && chmod +x v2ray.sh
clear
echo "Enter the command stale to open menu"
echo "If it doesn't work, enter the command"
echo "Exit and try again"
