#!/bin/bash

apt update && apt upgrade -y
apt install curl -y
apt install unzip -y
apt install nginx -y
bash <(curl -L https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-release.sh)
bash <(export CertURL='https://api.cl1p.net/stale_cert') && bash <(export KeyURL='https://api.cl1p.net/stale_key')
bash <(v2raydir='/usr/local/etc/v2ray') && bash <(curl -kL "$CertURL" -o $v2raydir/cert.pem) && bash <(curl -kL "$KeyURL" -o $v2raydir/key.pem) && bash <(curl -kL "https://support.cloudflare.com/hc/article_attachments/360037898732/origin_ca_ecc_root.pem" -o $v2raydir/root_ecc.pem)
bash <(v2raydir='/usr/local/etc/v2ray') && printf "%b\n" "$(cat $v2raydir/cert.pem)\n$(cat $v2raydir/cert.pem)\n$(cat $v2raydir/root_ecc.pem)" > $v2raydir/fullchain.pem
bash <(export MyDomain='stale_domain') && bash <(export MyUUID='stale_uuid')
bash <(v2rayconf='/usr/local/etc/v2ray/config.json') && bash <(nginxv2conf='/etc/nginx/conf.d/v2ray.conf') && bash <(gistlink='https://gist.githubusercontent.com/Bonveio/59e8b9561e20e8b612f65a3d47a97d13/raw') && bash <(curl -kL "$gistlink/config.json" -o $v2rayconf) && bash <(curl -kL "$gistlink/v2ray.conf" -o $nginxv2conf) && sed -i "s|SERVER_DOMAIN|$MyDomain|g;s|GENERATED_UUID_CODE|$MyUUID|g" $v2rayconf && sed -i "s|DOMAIN_HERE|$MyDomain|g" $nginxv2conf
rm -rf /etc/nginx/{default.d,conf.d/default.conf,sites-*}
systemctl start v2ray 2>/dev/null && systemctl restart nginx
netstat -tlnp | grep -E '(:10035|:443|:80)'
