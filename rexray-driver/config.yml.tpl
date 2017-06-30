rexray:
  modules:
    default-docker:
      type: docker
      host: unix:///var/run/docker/plugins/rexray-{{.Env.REXRAY_PROVIDER}}.sock
      libstorage:
        service: {{.Env.REXRAY_PROVIDER}}
        integration:
          volume:
            operations:
              mount:
                path: /var/lib/rancher/volumes
                preempt: true
              unmount:
                ignoreUsedCount: true
              create:
                default:
                  size: {{.Env.REXRAY_DEFAULT_VOLUME_SIZE}}
libstorage:
  service: {{.Env.REXRAY_PROVIDER}}
