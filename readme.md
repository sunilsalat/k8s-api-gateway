**\*\*\*\*** INGRESS-NGINX \***\*\*\*\***
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/cloud/deploy.yaml
kubectl delete -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/cloud/deploy.yaml

helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update
helm install ingress-nginx ingress-nginx/ingress-nginx --namespace ingress-nginx --create-namespace

helm uninstall ingress-nginx -n ingress-nginx
kubectl delete ns ingress-nginx

**\*\*\*\*** KONG \***\*\*\*\***
helm repo add kong https://charts.konghq.com
helm repo update
helm install kong kong/kong -n kong --create-namespace

helm uninstall kong -n kong
kubectl delete ns kong
kubectl create ns kong

**\*\*\*\*** LONGHORN \***\*\*\*\***
kubectl apply -f https://raw.githubusercontent.com/longhorn/longhorn/v1.7.1/deploy/longhorn.yaml

kubectl delete -n longhorn-system all --all
kubectl delete ns longhorn-system
kubectl delete storageclass longhorn

# LOCAL PATH

kubectl apply -f https://raw.githubusercontent.com/rancher/local-path-provisioner/v0.0.24/deploy/local-path-storage.yaml

# INFLUX DB

helm repo add influxdata https://helm.influxdata.com/
helm repo update
helm install inflx influxdata/influxdb2 -n influx --create-namespace
