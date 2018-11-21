#!/bin/bash -x

###################################################################################################

helm delete --purge monitoring

###################################################################################################

kubectl delete --wait=true namespace monitoring

###################################################################################################

kubectl delete --wait=true --namespace kube-system service monitoring-prometheus-oper-kubelet
kubectl delete --wait=true --namespace kube-system service monitoring-prometheus-oper-kube-dns

###################################################################################################

exit 0

###################################################################################################
