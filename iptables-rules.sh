*filter
:INPUT ACCEPT [0:0]  # Default input chain
:FORWARD ACCEPT [0:0] # Default forward chain
:OUTPUT ACCEPT [0:0] # Default output chain
:IN_PRIVATE - [0:0] # Input from cloud network
:IN_PUBLIC - [0:0] # Input from the public interface
:IN_SERVICENET - [0:0] # Input from servicenet
-A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
-A INPUT -p icmp -j ACCEPT
-A INPUT -i lo -j ACCEPT
-A INPUT -i eth0 -j IN_PUBLIC
-A INPUT -i eth1 -j IN_SERVICENET
-A INPUT -i eth2 -j IN_PRIVATE
-A INPUT -j REJECT --reject-with icmp-host-prohibited
-A FORWARD -j REJECT --reject-with icmp-host-prohibited
-A IN_PRIVATE -j ACCEPT
-A IN_PUBLIC -p tcp -m tcp --dport 22 -j ACCEPT
-A IN_SERVICENET -p tcp -m tcp --dport 22 -j ACCEPT
-A IN_SERVICENET -p tcp -m tcp --dport 80 -j ACCEPT
COMMIT