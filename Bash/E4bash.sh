#! /bin/bash
function OS_Detect {
	if type -t wevtutil &> /dev/null
	then
		OS=MSWin
	elif type -t scutil &> /dev/null
	then
		OS=MacOS
	else
		OS=Linux
	fi
}
function Host_up() {
	ping -c 1 $1 > /dev/null 2>&1
	[ $? -eq 0 ] && echo "Node with IP:$i is up"
	host=$i
	firstport=10
	lastport=500
	function portscan {
	for ((counter=$firstport; counter<=$lastport; counter++))
	do
		(echo >/dev/tcp/$host/$counter) > /dev/null 2>&1 && echo "$i $counter open"
	done
	}
	portscan
}
for i in 192.168.0.{1..99}
do
	Host_up $i & disown
done

OS_Detect
echo $OS