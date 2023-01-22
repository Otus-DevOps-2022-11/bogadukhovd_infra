#!/bin/sh
sudo mv /tmp/app.service /etc/systemd/system/reddit.service
cd /opt
sudo apt-get install -y git
sudo chmod -R 0777 /opt
git clone -b monolith https://github.com/express42/reddit.git
cd reddit && bundle install
sudo systemctl daemon-reload && sudo systemctl start reddit && sudo systemctl enable reddit
