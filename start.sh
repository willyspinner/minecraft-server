#!/usr/bin/env bash
for FILE in banned-ips.json ops.json banned-players.json usercache.json whitelist.json; do
    if [ ! -e $FILE ]; then
        echo '[]' > $FILE
    fi
done
java -Xms3G -Xmx3G -jar server.jar




