kubectl apply --record=true --wait=true --filename=- <<EOF
kind: ServiceAccount
apiVersion: v1
metadata:
  name: gitlab.com
  namespace: kube-system
EOF

kubectl apply --record=true --wait=true --filename=- <<EOF
kind: ClusterRoleBinding
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: gitlab.com
  namespace: kube-system
roleRef:
  kind: ClusterRole
  name: cluster-admin
  apiGroup: rbac.authorization.k8s.io
subjects:
  - name: gitlab.com
    kind: ServiceAccount
    namespace: kube-system
EOF
