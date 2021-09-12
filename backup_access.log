#!/bin/bash
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
cp access.log access.log.backup && echo > access.log
sed -i '/127.0.0.1\|192.168.0.100/d' access.log.backup
sed -i -E 's/[a-zA-Z0-9]{32}[0-3][0-9][01][1-9][1,2][0-9][0-9][0-9].*@.* /***** /g' access.log.backup
tar -czf access.log_$TIMESTAMP.tar access.log.backup
find -name "access*.tar" -cmin +150 | xargs rm -f
