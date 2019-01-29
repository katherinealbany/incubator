kubectl create -f - <<EOF
kind: ServiceAccount
apiVersion: v1
metadata:
  name: gitlab
  namespace: gitlab
EOF

kubectl create -f - <<EOF
kind: ClusterRoleBinding
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: gitlab
  namespace: gitlab
roleRef:
  kind: ClusterRole
  name: cluster-admin
  apiGroup: rbac.authorization.k8s.io
subjects:
  - name: gitlab
    kind: ServiceAccount
    namespace: gitlab
EOF


kubectl cluster-info | grep 'Kubernetes master' | awk '/http/ {print $NF}'

kubectl get secrets -n gitlab

kubectl get secret -n gitlab gitlab-token-XXXXX -o jsonpath="{['data']['ca\.crt']}" | base64 --decode
kubectl get secret -n gitlab gitlab-token-XXXXX -o jsonpath="{['data']['token']}" | base64 --decode
