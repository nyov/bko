#!/static/sh

case "$1" in
	renew|bound)
		ifconfig $interface $ip up

		if [ -n "$router" ] ; then
			for i in $router ; do
				route add -net 0.0.0.0 netmask 0.0.0.0 gw $i dev $interface
			done
		fi
		;;
	* )
		ifconfig $interface 0.0.0.0
		;;
esac

exit 0
