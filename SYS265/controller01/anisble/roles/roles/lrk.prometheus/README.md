Ansible Role: Prometheus ([lrk.prometheus](https://galaxy.ansible.com/lrk/prometheus/))
=========
[![Build Status](https://travis-ci.org/lrk/ansible-role-prometheus.svg?branch=master)](https://travis-ci.org/lrk/ansible-role-prometheus)
[![Galaxy](https://img.shields.io/badge/galaxy-lrk.prometheus-blue.svg)](https://galaxy.ansible.com/lrk/prometheus)
![Ansible](https://img.shields.io/ansible/role/d/20579.svg)
![Ansible](https://img.shields.io/badge/dynamic/json.svg?label=min_ansible_version&url=https%3A%2F%2Fgalaxy.ansible.com%2Fapi%2Fv1%2Froles%2F20579%2F&query=$.min_ansible_version)
![Ansible](https://img.shields.io/ansible/quality/20579)

An Ansible Role that install [Prometheus](https://prometheus.io).


Supported OSes
--------------
- Centos 7

Requirements
------------

None

Role Variables
--------------

Available variables along with default values are listed below (see `defaults/main.yml`)
```yml
---
# defaults file for ansible-prometheus

# Prometheus variables

# Prometheus system user group
prometheus_group: prometheus
# Prometheus system user name
prometheus_user: prometheus

# Prometheus install path
prometheus_path_install: /opt/prometheus
# Prometheus configuration path
prometheus_path_config: /etc/prometheus
# Prometheus logs path
prometheus_path_log:  /var/log/prometheus
# Prometheus PID path
prometheus_path_pid:  /var/run/prometheus
# Prometheus Data path:
prometheus_path_data: /var/lib/prometheus
# Prometheus rules path:
prometheus_path_rules: "{{ prometheus_path_config}}/rules"
# Prometheus file sd config path:
prometheus_path_file_sd_config: "{{ prometheus_path_config}}/tgroups"

# Prometheus components to install
# Can be a mix of:
#   - prometheus
#   - node_exporter
#   - alertmanager
prometheus_components: []

# Set the jinja2 template file to use instead of the provided one. Path based on playbook_dir
prometheus_config_template: null

# Prometheus version
prometheus_version: 1.7.1

# Prometheus service name
prometheus_service_name: prometheus

# Address to bind on, default :9090
prometheus_listen_port: 9090
prometheus_listen_address: ':{{ prometheus_listen_port }}'

# Set the -web.external-url command line parameter. If defined, also set the -web.route-prefix command line parameter to /
# The URL under which Prometheus is externally reachable (for example, if Prometheus is served via a reverse proxy).
# Used for generating relative and absolute links back to Prometheus itself.
# If the URL has a path portion, it will be used to prefix all HTTP endpoints served by Prometheus.
# If omitted, relevant URL components will be derived automatically.
# If set, also set
prometheus_web_external_url: null

# URL of alert manager service
prometheus_alertmanager_url: null

#Parameters for prometheus.yml

# Scrape interval: default 15s
prometheus_scrape_interval: 15s
# Scrape timeout: default 10s
prometheus_scrape_timeout: 10s
# Evaluation interval: default 15s
prometheus_evaluation_interval: 15s

# Alert manager variables

# Alert manager version
alertmanager_version: 0.8.0

# Alert manager service name
alertmanager_service_name: alertmanager

# Alert manager template path
alertmanager_path_templates: "{{ prometheus_path_config }}/templates"
# Alert manager data path
alertmanager_path_data: /var/lib/alertmanager

# ResolveTimeout is the time after which an alert is declared resolved if it has not been updated. default: 5m
alertmanager_resolve_timeout: 5m

# The default SMTP From header field. default empty
alertmanager_smtp_from: null
# The default SMTP smarthost used for sending emails. default empty
alertmanager_smtp_smarthost: null
# SMTP authentication information. default empty
alertmanager_smtp_auth_username: null
alertmanager_smtp_auth_password: null
alertmanager_smtp_auth_secret: null
alertmanager_smtp_auth_identity: null
# The default SMTP TLS requirement. default: false
alertmanager_smtp_require_tls: false

# Slack API url. default empty
alertmanager_slack_api_url: null

# Node exporter variables
nodeexporter_version: 0.14.0
# Node exporter service name
nodeexporter_service_name: nodeexporter_{{ inventory_hostname_short }}
# Node exporter listen address
nodeexporter_listen_port: 9100
nodeexporter_listen_address: ":{{ nodeexporter_listen_port }}"
# Collectors enables, comma-separated list of collectors to use. (default "conntrack,diskstats,entropy,edac,filefd,filesystem,hwmon,infiniband,loadavg,mdadm,meminfo,netdev,netstat,sockstat,stat,textfile,time,uname,vmstat,wifi,zfs")
nodeexporter_collectors_enabled: "conntrack,diskstats,entropy,edac,filefd,filesystem,hwmon,infiniband,loadavg,mdadm,meminfo,netdev,netstat,sockstat,stat,textfile,time,uname,vmstat,wifi,zfs"
```

Dependencies
------------

None

Example Playbook
----------------

```
    - hosts: servers
      roles:
         - lrk.prometheus
```

 License
 -------

 Apache License Version 2.0

 References
 ----------

- [Prometheus.io](https://prometheus.io)

Author Information
------------------
This role was created by [Lrk](https://github.com/lrk).
