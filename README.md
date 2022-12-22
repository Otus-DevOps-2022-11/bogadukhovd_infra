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

## HW-05:
yc compute instance create \
  --name reddit-app-auto-deploy \
  --hostname reddit-app-auto-deploy \
  --memory=4 \
  --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB \
  --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
  --metadata-from-file user-data=metadata.yaml \
  --metadata serial-port-enable=1

testapp_IP = 51.250.3.91

testapp_port = 9292
