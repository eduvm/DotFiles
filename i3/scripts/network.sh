#!/usr/bin/env bash

################################
# Shows ip address of a given interface
#
# @param {String} interface: The network interface to check
################################

full=""
status=0

interface="${BLOCK_INSTANCE:-"wlp5s0"}"
netPath=/sys/class/net
interfacePath=`echo $netPath/$interface`

# Expand wildcard interfaces
interface=${interfacePath#$netPath/}

state="$(cat $interfacePath/operstate)"

if [ "$state" == "up" ]; then
	ipaddr="$(ip addr show $interface | perl -n -e'/inet (.+)\// && print $1')"
	ipaddr="${ipaddr:-0.0.0.0}"
else
	ipaddr="down"
	status=33
fi

full="$ipaddr"

echo $full
