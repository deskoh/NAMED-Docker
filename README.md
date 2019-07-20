# NAMED Domain Name Server (DNS)

Runs a DNS server in a container.

1. Build named container from `alpine` base image.

   ```bash
   docker build . -t named
   ```

2. Run `docker-compose` with newly built image.

   ```bash
   docker-compose up
   ```

   OR

   ```bash
   # Disable SELinux if necessary
   # su -c "setenforce 0"
   docker run -d --name named -v $(pwd)/config:/etc/bind/ -v $(pwd)/log:/var/log/named/ -p 53:53/udp named

   # Windows
   docker run -d --name named -v ./config:/etc/bind -v ./log:/var/log/named -p 53:53/udp --restart=always named

   # Debug / Check config
   docker run --rm -it -v $(pwd)/config:/etc/bind/ -v $(pwd)/log:/ var/log/named/ bind /bin/ash
   $ named-checkconf
   ```

3. Verify DNS working

   ```bash
   # WINDOWS
   > nslookup example.com 127.0.0.1

   # LINUX
   $ dig @127.0.0.1 example.com
   ```
