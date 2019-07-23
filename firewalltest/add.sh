#!/bin/bash
#
# iptables example configuration script
#
# Flush all current rules from iptables
#
#  iptables -F
#
# Allow SSH connections on tcp port 22
# This is essential when working on remote servers via SSH to prevent locking yourself out of the system
#
 iptables -A INPUT -i br+ -p tcp --dport 6901 -j ACCEPT
#
# Set default policies for INPUT, FORWARD and OUTPUT chains
#
iptables -I INPUT -i br+ -j DROP
iptables -I OUTPUT -o br+ -j DROP
iptables -I FORWARD -i br+ -j DROP
#
# Set access for localhost
#
# iptables -A INPUT -i lo -j ACCEPT
#
# Accept packets belonging to established and related connections
#
iptables -A INPUT -i br+ -m state --state ESTABLISHED,RELATED -j ACCEPT
