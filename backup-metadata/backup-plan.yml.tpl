scheduler:
  cron: "{{.Env.BACKUP_TIME}}"
  retention: {{.Env.BACKUP_RETENTION}}
  timeout: {{.Env.BACKUP_TIMEOUT}}
target:
  host: "{{.Env.BACKUP_HOST}}"
  port: 27017
  database: "{{.Env.BACKUP_DATABASE}}"
s3:
  url: "{{.Env.BACKUP_S3_URI}}"
  bucket: "{{.Env.BACKUP_S3_BUCKET}}"
  accessKey: "{{.Env.BACKUP_S3_ACCESS_KEY}}"
  secretKey: "{{.Env.BACKUP_S3_SECRET_KEY}}"
  api: "S3v4"
