#!/usr/bin/env bash
# bash script used to backup the world. 
MINECRAFT_SERVERDIR="/home/willyspinner/minecraft_server"
BACKUP_INDICATOR_FILE="${MINECRAFT_SERVERDIR}/backup_is_enabled"
BACKUP_DIR="${MINECRAFT_SERVERDIR}/backup_folder"
FILENAME="$(date --rfc-3339=seconds)-backup.tar.gz"

# check if backup activated
if [ ! -e "$BACKUP_INDICATOR_FILE" ]; then
    echo "0" > "$BACKUP_INDICATOR_FILE"
fi

if [ $(cat "$BACKUP_INDICATOR_FILE") -eq 1 ]; then
    if [ ! -d "$MINECRAFT_SERVERDIR" ]; then
        echo "ERROR: ${MINECRAFT_SERVERDIR} doesn't exist"
    else
        if [ ! -e "$BACKUP_DIR" ]; then
            mkdir "$BACKUP_DIR"
        fi
        tar -zcvf "${MINECRAFT_SERVERDIR}/${FILENAME}" "${MINECRAFT_SERVERDIR}/world/"
        mv "${MINECRAFT_SERVERDIR}/${FILENAME}" "${BACKUP_DIR}"
    fi
else
    echo "(NOTE: was about to backup but $BACKUP_INDICATOR_FILE is '0'. Set it to 1 to enable)"
fi
