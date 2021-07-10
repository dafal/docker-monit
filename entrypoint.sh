#!/bin/sh

cp /etc/monitrc /etc/monitrc.root
chown root:root /etc/monitrc.root
chmod 600 /etc/monitrc.root
exec monit -Ivc /etc/monitrc.root