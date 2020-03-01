#!/bin/bash
# 下载全部当前版本的k8s所关联的镜像

images=(  
kube-apiserver:v1.17.0
kube-controller-manager:v1.17.0
kube-scheduler:v1.17.0
kube-proxy:v1.17.0
pause:3.1
etcd:3.4.3-0
coredns:1.6.5
)

for imageName in ${images[@]} ; do
    docker pull registry.cn-hangzhou.aliyuncs.com/google_containers/$imageName
    docker tag registry.cn-hangzhou.aliyuncs.com/google_containers/$imageName k8s.gcr.io/$imageName
    docker rmi registry.cn-hangzhou.aliyuncs.com/google_containers/$imageName
done

