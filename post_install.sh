#!/bin/bash

# provision an apache web server on the ec2 instance

# sudo dnf update -y
# sudo amazon-linux-extras install nginx1 -y
# sudo systemctl enable nginx
# sudo systemctl start nginx


sudo dnf update
sudo dnf install -y nginx
sudo systemctl start nginx.service
sudo systemctl status nginx.service
sudo systemctl enable nginx.service

