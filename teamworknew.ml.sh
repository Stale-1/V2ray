#!/bin/bash

apt update && apt upgrade -y -f
apt install curl unzip nginx-full net-tools -y
bash <(curl -L https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-release.sh)
export CertURL='https://api.cl1p.net/teamworknew.ml-cert' && export KeyURL='https://api.cl1p.net/teamworknew.ml-key'
v2raydir='/usr/local/etc/v2ray' && curl -kL "$CertURL" -o $v2raydir/cert.pem && curl -kL "$KeyURL" -o $v2raydir/key.pem && curl -kL "https://support.cloudflare.com/hc/article_attachments/360037898732/origin_ca_ecc_root.pem" -o $v2raydir/root_ecc.pem
v2raydir='/usr/local/etc/v2ray' && printf "%b\n" "$(cat $v2raydir/cert.pem)\n$(cat $v2raydir/cert.pem)\n$(cat $v2raydir/root_ecc.pem)" > $v2raydir/fullchain.pem
export MyDomain='stale_domain' && export MyUUID='stale_uuid'
v2rayconf='/usr/local/etc/v2ray/config.json' && nginxv2conf='/etc/nginx/conf.d/v2ray.conf' && gistlink='https://gist.githubusercontent.com/Bonveio/59e8b9561e20e8b612f65a3d47a97d13/raw' && curl -kL "$gistlink/config.json" -o $v2rayconf && curl -kL "$gistlink/v2ray.conf" -o $nginxv2conf && sed -i "s|SERVER_DOMAIN|$MyDomain|g;s|GENERATED_UUID_CODE|$MyUUID|g" $v2rayconf && sed -i "s|DOMAIN_HERE|$MyDomain|g" $nginxv2conf
rm -rf /etc/nginx/{default.d,conf.d/default.conf,sites-*}
systemctl start v2ray 2>/dev/null && systemctl restart nginx
netstat -tlnp | grep -E '(:10035|:443|:80)'
