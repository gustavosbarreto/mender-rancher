# Mender Rancher

Rancher template for Mender platform

## Install

In Rancher's UI, go to **Admin/Settings** and add a new custom catalog:

| Name   | URL                                                   | Branch |
| ------ | ----------------------------------------------------- | ------ |
| Mender | https://github.com/gustavosbarreto/mender-rancher.git | master |

### Optional Dependencies

**strongly recommended for production**

If you want to persist Mender's database data, you need to setup a REX-Ray
volume plugin for Docker.
