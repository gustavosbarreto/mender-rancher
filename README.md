# Mender Rancher

Rancher template for Mender platform

![Mender platform graph](http://i.imgur.com/YzkJHrW.png)

## Install

In Rancher's UI, go to **Admin/Settings** and add a new custom catalog:

| Name   | URL                                                   | Branch |
| ------ | ----------------------------------------------------- | ------ |
| Mender | https://github.com/gustavosbarreto/mender-rancher.git | master |

## Templates

* **mender**: Mender Server for production environment
* **rexray-dobs**: Docker volume plugin for DigitalOcean Block Storage
* **mender-backup**: Backup Agent for Mender Server Stack

## Docker Images

* **api-gateway**:
Docker image based on Mender API Gateway without HTTPS support. We don't need SSL
on API Gateway because it is enabled on Rancher Load Balancer.

* **backup-metadata**:
Docker image used as sidekick container of Mender Backup Agent to provide
configuration for backup plans.

* **secrets-provider**:
Docker image used as sidekick container of Mender's Device Authentication and
Mender's User Administration services to provide the private keys as file.

* **rexray-driver**:
Docker image that runs on each host to provide a docker volume DigitalOcean
Block Storage.


