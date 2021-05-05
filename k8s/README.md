# k8s安装 

参考教程：https://zhuanlan.zhihu.com/p/361752908


**注意： __命令都是在上级目录执行，即根目录__**


- 1. 初始化服务器


参考官方文档：https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/#letting-iptables-see-bridged-traffic


```shell
ansible-playbook -i hosts.ini ./k8s/init-server.yaml -K
```

你可能还需要检查：https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/#check-required-ports


- 2. 安装 Docker、Kubelet、Kubeadm 以及 kubectl

参考官方文档：https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/#installing-kubeadm-kubelet-and-kubectl

```
 ansible-playbook -i hosts.ini -v ./k8s/install-dependencies.yaml -K
```
**注意： __我们将默认使用docker.io 而不是 docer.ce 如果有强迫症可以自行更换__**

- 3. 创建控制面板节点

