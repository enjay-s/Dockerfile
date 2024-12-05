#!/bin/bash

#systemctl daemon-reload
systemctl enable vncserver.service
systemctl start vncserver.service
systemctl status vncserver.service


#vncserver

#vncpasswd
#firewall-cmd --permanent --add-port=5901/tcp
#firewall-cmd --reload
#firewall-cmd --permanent --add-service vnc-server
#systemctl restart firewalld.service
#netstat -lnpt|grep Xvnc