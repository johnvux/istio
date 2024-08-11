kind create cluster -n kind
kubectl cluster-info --context kind-kind

helm repo add istio https://istio-release.storage.googleapis.com/charts
helm repo update

kubectl create namespace istio-system

helm install istio-base istio/base -n istio-system --set defaultRevision=default
helm install istiod istio/istiod -n istio-system --wait

kubectl label namespace default istio-injection=enabled

# Start application
kubectl apply -f .\bookinfo.yaml

# Expose application to internet
kubectl apply -f .\bookinfo-gateway.yaml


<TBD>
https://istio.io/latest/docs/concepts/traffic-management/
