#!/bin/bash
pg_dumpall -f /tmp/backup.sql.dump
/backup/s3upload.rb
