#!/bin/bash
xdotool mousemove  1700 500
xdotool click 1
function FPGA()
{
for ((j = 0; j <= 55; j++))
do
	for ((i = 1; i <= 3; i++))
	do
		xdotool mousemove  1700 500
		xdotool click 1
		xdotool type 'SETMATRIX OUT'$i ' DISABLE'
		xdotool key Return
		sleep 1
		xdotool type 'SETMATRIX OUT'$i ' ADC1'
		xdotool key Return
		sleep 5
	done
done
}
FPGA