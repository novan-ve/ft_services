# kubectl run (NAME) --image=(IMAGE) --port=8080
# kubectl expose deployment (NAME) --target-port=8080 --type=Nodeport
# minikube service web --url

minikube start --vm-driver=virtualbox
# kubectl apply -f srcs/dashboard.yaml
# chmod +x srcs/setup-admin-user.sh
minikube addons enable ingress
eval $(minikube docker-env)
docker build -t nginx-img:1.0 srcs/nginx
kubectl apply -f srcs/nginx.yaml