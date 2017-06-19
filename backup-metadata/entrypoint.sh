#!/bin/sh

# Database list to backup. Format: HOST:DATABASE
DATABASES="
mongo-deployments:deployment_service
mongo-device-adm:deviceadm
mongo-device-auth:deviceauth
mongo-inventory:inventory
mongo-useradm:useradm
"

# Generate backup plan for each database
for DATABASE in $DATABASES; do
    export BACKUP_HOST=`echo $DATABASE | sed 's,:.*,,g'`
    export BACKUP_DATABASE=`echo $DATABASE | sed 's,.*:,,g'`

    PLAN_ID=`echo $BACKUP_HOST | sed -e 's,mongo-,,g' -e 's,-,,g'`

    gomplate \
        -f /usr/local/etc/backup-plan.yml.tpl \
        -o /config/$PLAN_ID.yml

    echo "Generated backup plan for $DATABASE"
done
