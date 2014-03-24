IPADDR="192.168.5.92 5000"

function SETFORMAT
{
	R[1]="640x480P60" 
	R[2]="1280x720P60" 
	R[3]="1280x720P50" 
	R[4]="1920x1080P60" 
	R[5]="1920x1080P50" 
	R[6]="720x480P60" 
	R[7]="720x576P50"
	R[8]= "1440x576P50"
	for ((j = 500; j <= 40000; j = j+999))
	do
		for item in ${R[*]}
		do
			# xrandr --output VGA-0 --mode 1920x1080P50
			sleep 4
			echo "SETFORMAT "$item | ./test $IPADDR
			sleep 5
			echo "SETBITRATE "$j | ./test $IPADDR
		done
	done
}

SETFORMAT