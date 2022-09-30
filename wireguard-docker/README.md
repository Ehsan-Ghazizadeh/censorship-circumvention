# <h2> This Guide describes how to run wireguard server on docker </h2>

1. - Use docker-install.sh to install docker on server, after installation got completed logout and login again,
     in order to new priviledges take effect.
   - Run command: `"id <username>"`
     replace `<username>` with your username the output is something like this:<br />
     `linux#: id ubuntu`<br />
     `uid=1000(ubuntu) gid=1000(ubuntu) groups=1000(ubuntu)`

   - Copy the uid (1000 in above command) and replace it in docker-compose PUID and GUID.

2. Replace server_url in docker-compose file with public ip address of server or with corresponding FQDN of yours.

3. Run: `"docker-compose up -d"`

4. Make sure udp port 51820 is allowed on firewall with command: `"sudo ufw allow 51820/udp"`
