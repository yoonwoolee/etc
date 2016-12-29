#! /bin/bash

if [ ! 1 -eq $# ]; then
	echo "error: input one argument, interface name to enable dhcp"
	exit 1
fi

INTERFACE_NAME=$1
ls /sys/class/net | grep $INTERFACE_NAME > /dev/null
if [ ! 0 -eq $? ]; then
	echo "error: interface is not founded"
	exit 1
fi

INTERFACESD_DIR="/etc/network/interfaces.d/"

NEW_INTERFACESD_FILENAME="${INTERFACESD_DIR}dhcp-${INTERFACE_NAME}.conf"

if [ ! -f $NEW_INTERFACESD_FILENAME ]; then
	echo $NEW_INTERFACESD_FILENAME
	echo "error: setting file doesn't exist"
	exit 1
fi

rm $NEW_INTERFACESD_FILENAME
echo "success: complete proccess"
exit 0
