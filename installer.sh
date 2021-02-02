#/bin/bash
clear
echo "Downloading Necessary Files"

cd /root
wget -q https://raw.githubusercontent.com/Stale-1/V2ray/main/v2raymenu.sh -O /root/v2raymenu.sh && cd /root && chmod +x v2raymenu.sh
echo "function stale() {" >> .bashrc
echo "  /root/./v2raymenu.sh" >> .bashrc
echo "}" >> .bashrc
wget -q https://raw.githubusercontent.com/Stale-1/V2ray/main/try.sh -O /root/v2ray.sh && cd /root && chmod +x v2ray.sh
wget -q https://raw.githubusercontent.com/Stale-1/V2ray/main/cert.sh -O /root/cert.sh && cd /root && chmod +x cert.sh
wget -q https://raw.githubusercontent.com/Stale-1/V2ray/main/domain.sh -O /root/domain.sh && cd /root && chmod +x domain.sh
wget -q https://raw.githubusercontent.com/Stale-1/V2ray/main/uuid.sh -O /root/uuid.sh && cd /root && chmod +x uuid.sh
wget -q https://raw.githubusercontent.com/Stale-1/V2ray/main/key.sh -O /root/key.sh && cd /root && chmod +x key.sh
wget -q https://raw.githubusercontent.com/Stale-1/V2ray/main/v2rayserver -O /root/v2rayserver
clear
echo ""
echo "Necessary Files have been downloaded"
echo ""
echo "Enter the command 'stale' to open menu"
echo "If it doesn't work, enter the command"
echo "'exit' and try again"
