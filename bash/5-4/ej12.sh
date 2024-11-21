#!/bin/bash

# IFS=: - set field delimiter to :
# read all 7 fields into 7 vars from /etc/passwd 
# pi:x:1000:1000:,,,:/home/pi:/bin/bash

while IFS=: read -r user enpass uid gid desc home shell; do
    # only display if UID >= 500
    if [ $uid -ge 500 ]; then
        echo $user tiene su home en $home y su shell en $shell
    fi 
done < /etc/passwd 
