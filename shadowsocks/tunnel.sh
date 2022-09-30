CreateTunnel() {
BIWhite='\033[5;97m'
White='\033[1;97m'
NC='\033[0m' # No Color
#sleep for 10 seconds to allow the networking stack to start before executing at reboot
##This command is usefull when you add this script to crontab like: @reboot ~/tunnel.sh >> ~/tunnel.log 2>&1
sleep 10

#run the port forwarding command as user tunnel
#su tunnel –c ‘/usr/bin/ssh -4 -f -N tunnel@192.168.31.5 –L 8007:192.168.31.5:8007’
ssh -4 -f -N -o GatewayPorts=true  -L <iran server port>:0.0.0.0:<foreingn server port> <user>@<foreign server public ip address>

#check if the tunnel is up and echo Tunnel status
if [ $? -eq 0 ]; then
    echo -e "${White}SSH Tunnel has been created successfully!${NC}"
else
    echo -e "${BIWhite}An error occurred creating a tunnel to hostb RC was $? ${NC}"
fi
}

CreateTunnel