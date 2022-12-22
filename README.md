# bogadukhovd_infra
bogadukhovd Infra repository


## HW-04:
1) ProxyJump(https://www.redhat.com/sysadmin/ssh-proxy-bastion-proxyjump):
   ```bash
   ssh -i ~/.ssh/otusinfra -A -J otusinfra@51.250.95.151 otusinfra@10.128.0.27
   ```
2) Доп. задание: в ~/.ssh/config добавить:
    ```bash
    ### The Bastion Host
    Host bastion-host
    HostName 51.250.95.151
    User otusinfra
    IdentityFile ~/.ssh/otusinfra
    ForwardAgent yes

    ### The Remote Host
    Host someinternalhost
    User otusinfra
    HostName 10.128.0.27
    ProxyJump bastion-host
    ```

bastion_IP = 158.160.34.54
someinternalhost_IP = 10.128.0.27
