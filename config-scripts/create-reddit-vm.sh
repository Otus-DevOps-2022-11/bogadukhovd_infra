#!/bin/bash
yc compute instance create \
  --name reddit-from-image \
  --hostname reddit-full \
  --memory=2 \
  --create-boot-disk image-id="fd8h7inppu7vsd3ijo2r",size=10GB \
  --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
  --metadata serial-port-enable=1
  --zone ru-central1-a \
  --ssh-key ~/.ssh/otusinfra.pub
