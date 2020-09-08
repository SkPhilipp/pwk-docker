FROM kalilinux/kali-rolling:latest

RUN apt update
RUN apt install -y locate
RUN apt install -y apache2
RUN apt install -y iputils-ping
RUN apt install -y python
RUN apt install -y python3
RUN apt install -y curl
RUN apt install -y wget
RUN apt install -y ncat
RUN apt install -y tcpdump
RUN apt install -y theharvester
RUN apt install -y whois
RUN apt install -y recon-ng
RUN apt install -y dnsrecon
RUN apt install -y nmap
RUN apt install -y vim
RUN apt install -y openvpn
RUN apt install -y enum4linux
RUN apt install -y nbtscan
RUN apt install -y snmp
RUN apt install -y openvas
RUN export DEBIAN_FRONTEND=noninteractive && apt install -y iptables
RUN apt install -y git
RUN apt install -y net-tools
RUN apt install -y expect
RUN git clone --depth=1 https://github.com/scipag/vulscan /usr/share/nmap/scripts/vulscan && rm -rf /usr/share/nmap/scripts/vulscan/.git
RUN git clone --depth=1 https://github.com/vulnersCom/nmap-vulners /usr/share/nmap/scripts/vulners && rm -rf /usr/share/nmap/scripts/vulners/.git
RUN apt install -y metasploit-framework
RUN apt install -y exploitdb
RUN apt install -y hydra hydra-gtk
RUN apt install -y ncrack
RUN apt install -y seclists

# ?
# RUN apt install -y wireshark
# this depends on systemctl and lsof
# RUN openvas-setup
# RUN openvasmd --user=admin --new-password=CEU50LCmVpyPFnEQMqZFYfh2XYN75YnN1FDjvIgG

WORKDIR /root/
RUN updatedb

