FROM alpine:3.6

VOLUME /config

# Every day at 00:00h
ENV BACKUP_TIME "0 0 * * *"
# Number of backups to keep locally
ENV BACKUP_RETENTION 1
# Backup operation timeout in minutes
ENV BACKUP_TIMEOUT 60
# S3 bucket to upload data to
ENV BACKUP_S3_BUCKET ""
# Defaults to AWS S3. You can override this with your own Minio server address
ENV BACKUP_S3_URI "https://s3.amazonaws.com"
# S3 access key
ENV BACKUP_S3_ACCESS_KEY ""
# S3 secret key
ENV BACKUP_S3_SECRET_KEY ""

ADD entrypoint.sh /entrypoint.sh
ADD backup-plan.yml.tpl /usr/local/etc/backup-plan.yml.tpl

ADD https://github.com/hairyhenderson/gomplate/releases/download/v1.9.0/gomplate_linux-amd64 /usr/bin/gomplate
RUN chmod +x /usr/bin/gomplate

ENTRYPOINT ["/entrypoint.sh"]
