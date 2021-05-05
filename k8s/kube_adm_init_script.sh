# ./kube_adm_init_script.sh

#! /usr/bin/env bash

set -e

kubeadm init \
  --image-repository registry.cn-hangzhou.aliyuncs.com/google_containers \
  --apiserver-advertise-address $1 \
  --control-plane-endpoint $1 \
  --pod-network-cidr $2

# Copy k8s config to home dir, to make kubectl work.

mkdir -p $HOME/.kube && \
cp -i /etc/kubernetes/admin.conf $HOME/.kube/config && \
chown $(id -u):$(id -g) $HOME/.kube/config