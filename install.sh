#!/bin/sh

case ${1} in
  helm)
    printf "\nRemoving old ${1} binary...\n\n"
    rm -f /usr/local/bin/helm
    printf "Downloading ${1} ${2} binary...\n\n"
    curl -LO https://get.helm.sh/helm-v${2}-linux-amd64.tar.gz
    printf "\nInstalling ${1} ${2} binary...\n\n"
    tar xf helm-v${2}-linux-amd64.tar.gz
    mv linux-amd64/helm /usr/local/bin/helm
    chmod +x /usr/local/bin/helm
    rm -rf linux-amd64 helm-v${2}-linux-amd64.tar.gz
    printf "DONE!\n\n"
    ;;
  k3s)
    printf "\nRemoving old ${1} binary...\n\n"
    rm -f /usr/local/bin/k3s
    printf "Downloading ${1} ${2} binary...\n\n"
    curl -L https://github.com/rancher/k3s/releases/download/v${2}%2Bk3s1/k3s -o /usr/local/bin/k3s
    chmod +x /usr/local/bin/k3s
    printf "\nDONE!\n\n"
    ;;
  kubectl)
    printf "\nRemoving old ${1} binary...\n\n"
    rm -f /usr/local/bin/kubectl
    printf "Downloading latest ${1} binary...\n\n"
    curl -L https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl
    chmod +x /usr/local/bin/kubectl
    printf "\nDONE!\n\n"
    ;;
  rancher)
    printf "\nRemoving old ${1} binary...\n\n"
    rm -f /usr/local/bin/rancher
    printf "Downloading ${1} ${2} binary...\n\n"
    curl -LO https://github.com/rancher/cli/releases/download/v${2}/rancher-linux-amd64-v${2}.tar.gz
    printf "\nInstalling ${1} ${2} binary...\n\n"
    tar xf rancher-linux-amd64-v${2}.tar.gz
    mv rancher-v${2}/rancher /usr/local/bin/rancher
    chmod +x /usr/local/bin/rancher
    rm -rf rancher-linux-amd64-v${2}.tar.gz rancher-v${2}
    printf "DONE!\n\n"
    ;;
  rke)
    printf "\nRemoving old ${1} binary...\n\n"
    rm -f /usr/local/bin/rke
    printf "Downloading ${1} ${2} binary...\n\n"
    curl -L https://github.com/rancher/rke/releases/download/v${2}/rke_linux-amd64 -o /usr/local/bin/rke
    chmod +x /usr/local/bin/rke
    printf "\nDONE!\n\n"
    ;;
  vault)
    printf "\nRemoving old ${1} binary...\n\n"
    rm -f /usr/local/bin/vault
    printf "Downloading ${1} ${2} binary...\n\n"
    curl -LO https://releases.hashicorp.com/vault/${2}/vault_${2}_linux_amd64.zip
    printf "\nInstalling ${1} ${2} binary...\n\n"
    unzip -q vault_${2}_linux_amd64.zip
    mv vault /usr/local/bin/vault
    chmod +x /usr/local/bin/vault
    rm -f vault_${2}_linux_amd64.zip
    printf "DONE!\n\n"
    ;;
esac