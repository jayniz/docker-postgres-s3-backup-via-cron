#!/bin/bash

# Collect environment variables set by docker
env | egrep '^AWS|^PG|^BACKUP' | sort > /tmp/backup-cron
cat /etc/cron.d/backup-cron >> /tmp/backup-cron
mv /tmp/backup-cron /etc/cron.d/backup-cron

cron  && tail -f /var/log/cron.log
