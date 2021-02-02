#!/bin/bash

sleep 1
apt install curl unzip nginx-full net-tools -y
sleep 2
bash <(curl -L https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-release.sh)
sleep 2
export CertURL='https://api.cl1p.net/stale_cert' && export KeyURL='https://api.cl1p.net/stale_key'
sleep 2
v2raydir='/usr/local/etc/v2ray' && curl -kL "$CertURL" -o $v2raydir/cert.pem && curl -kL "$KeyURL" -o $v2raydir/key.pem && curl -kL "https://support.cloudflare.com/hc/article_attachments/360037898732/origin_ca_ecc_root.pem" -o $v2raydir/root_ecc.pem
sleep 2
v2raydir='/usr/local/etc/v2ray' && printf "%b\n" "$(cat $v2raydir/cert.pem)\n$(cat $v2raydir/cert.pem)\n$(cat $v2raydir/root_ecc.pem)" > $v2raydir/fullchain.pem
sleep 2
export MyDomain='stale_domain' && export MyUUID='stale_uuid'
sleep 2
v2rayconf='/usr/local/etc/v2ray/config.json' && nginxv2conf='/etc/nginx/conf.d/v2ray.conf' && gistlink='https://gist.githubusercontent.com/Bonveio/59e8b9561e20e8b612f65a3d47a97d13/raw' && curl -kL "$gistlink/config.json" -o $v2rayconf && curl -kL "$gistlink/v2ray.conf" -o $nginxv2conf && sed -i "s|SERVER_DOMAIN|$MyDomain|g;s|GENERATED_UUID_CODE|$MyUUID|g" $v2rayconf && sed -i "s|DOMAIN_HERE|$MyDomain|g" $nginxv2conf
sleep 2
rm -rf /etc/nginx/{default.d,conf.d/default.conf,sites-*}
sleep 2
systemctl start v2ray 2>/dev/null && systemctl restart nginx
sleep 2
netstat -tlnp | grep -E '(:10035|:443|:80)'
sleep 1
wget -q https://raw.githubusercontent.com/Stale-1/V2ray/main/script.sh -O /etc/profile.d/script.sh
cat /root/v2rayserver
