#!/bin/bash

set -x

# Fix locale issue
echo "LANG=en_US.utf-8
LC_ALL=en_US.utf-8">>/etc/environment

# Update packages
yum update -y

# Install GCC, Make, Git, Yum Utils, and Wget
yum install -y gcc make git yum-utils wget

# Install Nodejs and Yarn
curl -sL https://rpm.nodesource.com/setup_14.x | sudo bash -
yum install -y nodejs
npm install -g yarn

# Install Docker
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install -y docker-ce docker-ce-cli containerd.io

# Install Minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-latest.x86_64.rpm
rpm -Uvh minikube-latest.x86_64.rpm

# Install kubectl
sudo tee /etc/yum.repos.d/kubernetes.repo<<EOF
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF
yum install -y kubectl

# Install Cloud Foundry CLI
wget -O /etc/yum.repos.d/cloudfoundry-cli.repo https://packages.cloudfoundry.org/fedora/cloudfoundry-cli.repo
yum install -y cf8-cli

# Install GoLang
wget https://go.dev/dl/go1.17.6.linux-amd64.tar.gz
tar -C /usr/local -xzf go1.17.6.linux-amd64.tar.gz


