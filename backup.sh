#!/bin/bash
echo "`date` ~~~~~~~~~~~ STARTING BACKUP ~~~~~~~~~~~~"
echo "`date` deleting old backup"
rm -f /tmp/backup.sql.dump.bz2
echo "`date` reating postgres dump"
pg_dumpall | bzip2 > /tmp/backup.sql.dump.bz2
echo "`date` uploading to S3"
/backup/s3upload.rb
echo "`date` done!"
