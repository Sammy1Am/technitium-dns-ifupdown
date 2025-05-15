FROM technitium/dns-server:latest
USER root
RUN apt-get update && apt-get install -y iproute2 && apt-get clean -y && rm -rf /var/lib/apt/lists/*
