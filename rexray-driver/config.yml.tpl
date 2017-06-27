rexray:
  modules:
    default-docker:
      {{- if bool (getenv "REXRAY_SERVER_MODE")}}
      disabled: true
      {{- else}}
      type: docker
      host: unix:///var/run/docker/plugins/rexray-{{.Env.REXRAY_PROVIDER}}.sock
      libstorage:
        service: {{.Env.REXRAY_PROVIDER}}
        integration:
          volume:
            operations:
              mount:
                path: /var/lib/rancher/volumes
              create:
                default:
                  size: {{.Env.REXRAY_DEFAULT_VOLUME_SIZE}}
      {{- end}}
libstorage:
  {{- if bool (getenv "REXRAY_SERVER_MODE")}}
  host: tcp://127.0.0.1:7979
  embedded: true
  client:
    type: controller
  server:
    endpoints:
      public:
        address: tcp://:7979
    services:
      {{.Env.REXRAY_PROVIDER}}:
        driver: {{.Env.REXRAY_PROVIDER}}
  {{- else}}
  host: tcp://rexray:7979
  embedded: false
  service: {{.Env.REXRAY_PROVIDER}}
  integration:
    volume:
      operations:
        mount:
          path: /var/lib/rancher/volumes
  {{- end}}
