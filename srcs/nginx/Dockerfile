# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Dockerfile                                         :+:    :+:             #
#                                                      +:+                     #
#    By: novan-ve <novan-ve@student.codam.nl>         +#+                      #
#                                                    +#+                       #
#    Created: 2020/04/25 12:26:05 by novan-ve      #+#    #+#                  #
#    Updated: 2020/06/05 09:18:10 by novan-ve      ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

FROM alpine

COPY start.sh /start.sh

RUN apk add --update openssh nginx && \
	mkdir /run/nginx && \
	chmod +x /start.sh && \
	[ -z "$SSH_USER" ] && SSH_USER=ssh-admin && \
	[ -z "$SSH_PASSWORD"] && SSH_PASSWORD=sshwachtwoord && \
	adduser -D "$SSH_USER" && \
	echo "$SSH_USER:$SSH_PASSWORD" | chpasswd && \
	ssh-keygen -A

COPY nginx.conf /etc/nginx/nginx.conf
COPY ./tls.crt /etc/nginx/tls.crt
COPY ./tls.key /etc/nginx/tls.key

CMD /start.sh

EXPOSE 22 80 443
