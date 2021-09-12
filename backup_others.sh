#!/bin/bash
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
for file in custom.log seo.log error.log chunga.log
do
cp $file $file.backup && echo > $file
sed -i '/127.0.0.1\|192.168.0.100/d' $file.backup
sed -i -E 's/[a-zA-Z0-9]{32}[0-3][0-9][01][1-9][1,2][0-9][0-9][0-9].*@.* /***** /g' $file.backup
tar -czf $file$TIMESTAMP.tar $file.backup
find -name "$file*.tar" -cmin +14400 | xargs rm -f
done
