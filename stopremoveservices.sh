#!/bin/bash

services=('httpd.service' 'vsftpd.service' 'postfix.service' 'squid.service' 'mariadb.service' 'named.service' 'dhcpd.service' 'smb.service' 'docker.service' )

for svc in ${services[@]} ; do
        echo -n $svc
        addr="/usr/lib/systemd/system/$svc"
        if [[ -f $addr ]] 2>> ./$0.err ; then
                $(systemctl stop $svc) 2>&1 >> ./$0.err
                echo " stopped"
                rpm=$(rpm -qf $addr 2>> ./$0.err )
                $(yum remove $rpm -q -y 2>&1 >> ./$0.err )
                echo "$svc uninstalled"
        else
                echo " not found"
        fi
done
