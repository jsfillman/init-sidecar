FROM bitnami/minideb:latest

# Install Base Packages
RUN \
 install_packages \
    	ansible \
	bash \
	curl \
	dnsutils \
    	git \
	less \ 
	lsof \
	mongo-tools \
	net-tools \
	netcat \
	p7zip-full \
	screen \
	ssh \
	tzdata \
	unzip \
	vim-tiny \
    	wget

# Install wait-for-it.sh for dependency mapping
RUN \
 cd /usr/local/bin; \
 wget -q https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh; \
 wget -q https://raw.githubusercontent.com/kbase-infra/w8s4/main/w8s4; \
 chmod +x /usr/local/bin/wait-for-it.sh /usr/local/bin/w8s4

# Install minio mc admin utility
RUN \
 cd /usr/local/bin; \
 wget https://dl.min.io/client/mc/release/linux-amd64/mc; \
 chmod +x mc

# Install Mongo
RUN \
 mkdir -p /data/db/tmp && cd /data/db/tmp/; \
 wget -q https://repo.mongodb.org/apt/debian/dists/buster/mongodb-org/4.4/main/binary-amd64/mongodb-org-shell_4.4.4_amd64.deb; \
 wget -q https://repo.mongodb.org/apt/debian/dists/buster/mongodb-org/4.4/main/binary-amd64/mongodb-org-server_4.4.4_amd64.deb; \
 apt install /data/db/tmp/mongodb-org-shell_4.4.4_amd64.deb; \
 apt install /data/db/tmp/mongodb-org-server_4.4.4_amd64.deb; \
 rm /data/db/tmp/*.deb
