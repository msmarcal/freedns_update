#!/bin/bash

KEY="XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

CUR_ADDR=$(curl -s http://v6.ipv6-test.com/api/myip.php)

if [ -f "$TMPDIR/ipv6addr" ]; then
	OLD_ADDR=$(cat $TMPDIR/ipv6addr)
fi

if [ "$CUR_ADDR" != "$OLD_ADDR" ]; then
	curl -s "http://freedns.afraid.org/dynamic/update.php?$KEY&address=$CUR_ADDR" | logger -t ipupdate -i
fi

echo $CUR_ADDR > $TMPDIR/ipv6addr
