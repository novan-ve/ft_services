# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Dockerfile                                         :+:    :+:             #
#                                                      +:+                     #
#    By: novan-ve <novan-ve@student.codam.nl>         +#+                      #
#                                                    +#+                       #
#    Created: 2020/04/25 12:26:05 by novan-ve      #+#    #+#                  #
#    Updated: 2020/06/23 17:03:16 by novan-ve      ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

FROM alpine

RUN apk add --update openrc openssh nginx && \
	mkdir /run/nginx && \
	[ -z "$SSH_USER" ] && SSH_USER=ssh-admin && \
	[ -z "$SSH_PASSWORD"] && SSH_PASSWORD=sshwachtwoord && \
	adduser -D "$SSH_USER" && \
	echo "$SSH_USER:$SSH_PASSWORD" | chpasswd && \
	ssh-keygen -A && \
	openrc && \
	touch /run/openrc/softlevel && \
	rc-update add sshd

COPY nginx.conf /etc/nginx/nginx.conf
COPY ./tls.crt /etc/nginx/tls.crt
COPY ./tls.key /etc/nginx/tls.key

CMD while true; do if [[ ! -f /var/run/sshd.pid ]]; then /etc/init.d/sshd restart; elif [[ ! -f /var/run/nginx/nginx.pid ]]; then /etc/init.d/nginx restart; fi done

EXPOSE 22 80 443
