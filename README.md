# Docker Postgres backup to Amazon S3 via cron

Configure the backup source and s3 target with these environment
variables:

```
AWS_REGION=eu-central-1
AWS_ACCESS_KEY_ID=
AWS_SECRET_ACCESS_KEY=
AWS_BUCKET_NAME=
BACKUP_NAME=
PGHOST=
PGPORT=
PGUSER=
PGPASSWORD=
```

# Thanks

Adapted from https://blog.danivovich.com/2015/07/23/postgres-backups-to-s3-with-docker-and-systemd/ and http://blog.oestrich.org/2015/01/pg-to-s3-backup-script/<Paste>
