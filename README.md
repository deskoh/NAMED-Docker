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
   docker run -d --name named -v ./config:/etc/bind -v ./log:/var/log/named -p 53:53/udp --restart=always named
   ```

3. Verify DNS working

   ```bash
   # WINDOWS
   > nslookup example.com 127.0.0.1

   # LINUX
   $ dig @127.0.0.1 example.com
   ```
