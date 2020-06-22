# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    setup.sh                                           :+:    :+:             #
#                                                      +:+                     #
#    By: novan-ve <novan-ve@student.codam.nl>         +#+                      #
#                                                    +#+                       #
#    Created: 2020/05/05 15:04:46 by novan-ve      #+#    #+#                  #
#    Updated: 2020/06/22 12:47:28 by novan-ve      ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

spinner() {
printf '[ .. ]'
wait $!
if [ $? -ne 0 ]; then
    printf "$(tput setaf 1)\b\b\b\b\b\b[ FAIL ]$(tput sgr0)\n"
else
    printf "$(tput setaf 2)\b\b\b\b\b\b[ OK ]$(tput sgr0)\n"
fi
}

which -s brew
if [[ $? != 0 ]] ; then
    printf "Intalling brew...\n"
    rm -rf $HOME/.brew && git clone --depth=1 https://github.com/Homebrew/brew $HOME/.brew && export PATH=$HOME/.brew/bin:$PATH && brew update && echo "export PATH=$HOME/.brew/bin:$PATH" >> ~/.zshrc &> /dev/null
	echo "Brew installed, please restart your terminal and run setup.sh again"
	exit
else
	printf "Updating brew...\n"
    brew update &> /dev/null
fi

printf "Linking docker to goinfre"
rm -rf ~/Library/Containers/com.docker.docker &> /dev/null
mkdir -p /goinfre/$USER/docker &> /dev/null
ln -s /goinfre/$USER/docker ~/Library/Containers/com.docker.docker &> /dev/null

printf "Starting up docker...\n"
until docker &> /dev/null
do
	&> /dev/null
done

printf "Linking minikube and docker to goinfre"
export MINIKUBE_HOME=/goinfre/$USER/
rm -rf /goinfre/$USER/.minikube &> /dev/null
mkdir -p /goinfre/$USER/.minikube &> /dev/null
ln -s /goinfre/$USER/.minikube ~/.minikube &> /dev/null

if minikube &> /dev/null
then
	printf "Checking minikube for update...\n"
	brew upgrade minikube &> /dev/null
else
	printf "Installing minikube\n"
	brew install minikube &> /dev/null
fi

printf  "Starting Minikube\t\t"
minikube delete &> /dev/null && minikube start --vm-driver=virtualbox &> /dev/null & spinner

printf "Setting Port range\t\t"
minikube ssh "sudo sed '39i\    - --service-node-port-range=0-33000' /etc/kubernetes/manifests/kube-apiserver.yaml > /tmp/tmp && sudo rm /etc/kubernetes/manifests/kube-apiserver.yaml && sudo mv /tmp/tmp /etc/kubernetes/manifests/kube-apiserver.yaml && sudo mkdir /mnt/data" & spinner

printf "Enabling ingress\t\t"
minikube addons enable ingress &> /dev/null & spinner

printf "Enabling dashboard\t\t"
minikube addons enable dashboard &> /dev/null & spinner

pkill -9 -f "kubectl proxy" && sleep 1 > /dev/null 2>&1

server_ip=$(minikube ip)
printf "Setting IPs\t\t\t"
rm -rf srcs/ftps/Dockerfile srcs/mysql/grafana.sql srcs/telegraf/telegraf.conf srcs/wordpress/start.sh && \
cp srcs/ftps/src srcs/ftps/Dockerfile && \
cp srcs/mysql/src.sql srcs/mysql/grafana.sql && \
cp srcs/telegraf/src.conf srcs/telegraf/telegraf.conf && \
cp srcs/wordpress/src.sh srcs/wordpress/start.sh && \
sed -i '' "s/MINIKUBE_IP/$server_ip/g" srcs/ftps/Dockerfile && \
sed -i '' "s/MINIKUBE_IP/$server_ip/g" srcs/mysql/grafana.sql && \
sed -i '' "s/MINIKUBE_IP/$server_ip/g" srcs/telegraf/telegraf.conf && \
sed -i '' "s/MINIKUBE_IP/$server_ip/g" srcs/wordpress/start.sh & spinner

eval $(minikube docker-env)

printf "Building nginx image\t\t"
docker build -t nginximg:1.0 srcs/nginx &> /dev/null & spinner

printf "Deploying nginx\t\t\t"
kubectl apply -f srcs/yaml/nginx.yaml &> /dev/null & spinner

printf "Deploying Ingress\t\t[ .. ]"
until kubectl apply -f srcs/yaml/ingress.yaml &> /dev/null
do
	:
done
printf "$(tput setaf 2)\b\b\b\b\b\b[ OK ]$(tput sgr0)\n"
printf "Building MySQL image\t\t"
docker build -t mysqlimg:1.0 srcs/mysql &> /dev/null & spinner

printf "Deploying MySQL\t\t\t"
kubectl apply -f srcs/yaml/mysql.yaml &> /dev/null & spinner

printf "Building ftps image\t\t"
docker build -t ftpsimg:1.0 srcs/ftps &> /dev/null & spinner

printf "Deploying ftps\t\t\t"
kubectl apply -f srcs/yaml/ftps.yaml &> /dev/null & spinner

printf "Building InfluxDB image\t\t"
docker build -t influxdbimg:1.0 srcs/influxDB &> /dev/null & spinner

printf "Deploying InfluxDB\t\t"
kubectl apply -f srcs/yaml/influxDB.yaml &> /dev/null & spinner

printf "Building phpMyAdmin image\t"
docker build -t phpmyadminimg:1.0 srcs/phpmyadmin &> /dev/null & spinner

printf "Deploying phpMyAdmin\t\t"
kubectl apply -f srcs/yaml/phpmyadmin.yaml &> /dev/null & spinner

printf "Building Wordpress image\t"
docker build -t wordpressimg:1.0 srcs/wordpress &> /dev/null & spinner

printf "Deploying Wordpress\t\t"
kubectl apply -f srcs/yaml/wordpress.yaml &> /dev/null & spinner

printf "Building Telegraf image\t\t"
docker build -t telegrafimg:1.0 srcs/telegraf &> /dev/null & spinner

printf "Deploying Telegraf\t\t"
kubectl apply -f srcs/yaml/telegraf.yaml &> /dev/null & spinner

printf "Building Grafana image\t\t"
docker build -t grafanaimg:1.0 srcs/grafana &> /dev/null & spinner

printf "Deploying Grafana\t\t"
kubectl apply -f srcs/yaml/grafana.yaml &> /dev/null & spinner

printf "Deploying dashboard"
kubectl apply -f srcs/yaml/dashboard.yaml > /dev/null 2>&1
((kubectl proxy &) && sleep 1) > /dev/null 2>&1
kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep admin-user | awk '{print $1}') | grep token:

printf "\n$(tput setaf 2)Finished!$(tput sgr0)\n"
