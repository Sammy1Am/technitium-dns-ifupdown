This repository generates [a package](https://github.com/Sammy1Am/technitium-dns-net/pkgs/container/technitium-dns-net) that represents a light wrapper over the official `technitium/dns-server:latest` container image to provide ifupdown configuration abilities.

Essentially I wanted to run Technitium DNS in an Incus LXC container. This worked fine using the official image, except in order for my DNS to be:

a) accessible via a static IP<br/>
b) have IPv6 connectivity to the Internet

I wanted to connect Technicium using a macvlan network.  *However*, the default image doesn't contain any sort of network configuration infrastructue because generally Docker provides this via its own DHCP services.  This wrapper:

- Adds the ifupdown package
- Replaces the Technicium entrypoint with a script that first calls `ifup -a` and *then* calls the default Technitium entry point.

You can specify interface configuration options by mounting a [network configuration](https://wiki.debian.org/NetworkConfiguration) file to the container's `/etc/network/interfaces.d/` directory. E.g. if you wanted to assign a static IP address.


## Caveats

- Because I've hardcoded the original entrypoint into the script, there's no way to change the configuration directory for Technicium without editing the script (possibly a customized script could be bound over the top of the existing one).
- This repo doesn't automatically build with new versions of the Technitium image; I'm happy to manually trigger a build for anyone if you let me know there's been an update.
- There's **GOT** to be a better way to automatically execute network setup inside an OCI container, but for the life of me I couldn't figure out how to do it without adding big, heavy packages like `cloud-init`.
