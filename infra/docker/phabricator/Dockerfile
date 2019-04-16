FROM bitnami/phabricator:2019
RUN apt-get update
RUN apt-get install openssh-server -y
RUN apt-get install vim -y
RUN useradd -m -d /home/phabricator -s /bin/bash -p NP git
RUN /opt/bitnami/phabricator/bin/config set diffusion.ssh-port 2222
RUN mkdir -p /opt/bitnami/sshd/
COPY phabricator-ssh-hook.sh /opt/bitnami/phabricator-ssh-hook.sh
RUN chmod 755 /opt/bitnami/phabricator-ssh-hook.sh
COPY sshd_config.phabricator /etc/ssh/sshd_config.phabricator
RUN mkdir -p /run/sshd
RUN ln -s /opt/bitnami/php/bin/php /usr/bin/php
COPY app-entrypoint.sh /app-entrypoint.sh
RUN chmod 755 /app-entrypoint.sh
