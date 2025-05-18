#!/bin/bash

# Make sure network is up
/usr/sbin/ifup -a

# Use entrypoint from upstream container
/usr/bin/dotnet /opt/technitium/dns/DnsServerApp.dll /etc/dns
