Role Name
=========

Ansible role to deploy Webmin web-based linux administration utility, running as a 
systemd service.

Webmin service will be available on https://hostip:10000.

Default login will be the userid and password of the installer user.

You may get a browser warning about Webmin's default self-sign SSL certificate.


Requirements
------------

- Installation requires sudo privileges.
- Systemd for services control.
- Firewalld for firewall control (if required).
- Python for Ansible provisioning (note that some minimal distributions do not include python out of the box).

Role Variables
--------------

- `install_utilities`: false.  Set to True to install various utility packages used by Webmin management functions (wget, git, ntpdate, sntp, smartmontools).
Note that some minimal distributions do not support all these tools out of the box and may require interactive installation.

- `firewalld_enable`: false.  Set to True to open port 10000 via firewalld (assumes firewalld is running).

- `uninstall_webmin` : false.  Set to true to uninstall Webmin.

Dependencies
------------

None.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

```yaml

    - name: Provision webmin role
      hosts: all
      become: true
      become_user: root
      
      vars:
         firewalld_enable: true
         install_utilities: true

      roles:
      - semuadmin.webmin
```
     
License
-------

BSD

Author Information
------------------

semuadmin@noreply.user.github.com
