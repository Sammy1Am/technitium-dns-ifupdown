FROM technitium/dns-server:latest
USER root
RUN apt-get update && apt-get install -y ifupdown && apt-get clean -y && rm -rf /var/lib/apt/lists/*

# Copy script to override entry point
COPY entrypoint.sh /opt/entrypoint.sh
RUN ["chmod", "+x", "/opt/entrypoint.sh"]
ENTRYPOINT ["/opt/entrypoint.sh"]
