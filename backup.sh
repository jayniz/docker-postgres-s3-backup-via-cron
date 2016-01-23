#!/bin/bash
rm -f /tmp/backup.sql.dump.bz2
pg_dumpall | bzip2 > /tmp/backup.sql.dump.bz2
/backup/s3upload.rb
