date

function FPGA()
# Function switches All FPGA I/O
{
	for ((i = 1; i <= 3; i++))
	do
		echo SETMATRIX OUT$i DISABLE | ./test 192.168.5.92 5000
		sleep 1
		echo SETMATRIX OUT$i HDMI3  | ./test 192.168.5.92 5000 # Source signal
		sleep 3
	done
}

function FPGA_ADC()
# Function switches All FPGA ADC I/O
{
	for ((i = 1; i <= 3; i++))
	do
		echo SETMATRIX OUT$i DISABLE  | ./test 192.168.5.92 5000
		sleep 1
		echo SETMATRIX OUT$i ADC4  | ./test 192.168.5.92 5000 # Source signal
		sleep 10
	done
}

function ChangeTiming()
# Function changes resolution
# Have to connected to the GefenToolBox
# via RS232 19200 8 None 1 None
# use MINICOM to connect in the Linux
# to the GefenToolBox
{
	xdotool mousemove  1400 900
	xdotool click 1
	R[1]="TIM001" # 640x480p60 (M3)
	R[2]="TIM024" # 720x480p60 (M4)
	R[3]="TIM026" # 1280x720p60 (M3)
	R[4]="TIM030" # 1920x1080p60 (M3)
	R[5]="TIM033" # 1280x720p50 (M3)
	R[6]="TIM035" # 1920x1080p50 (M3)
	for ((j = 1; j <= 2; j++))
	do
		for item in ${R[*]}
		do
			xdotool mousemove  1400 900
			xdotool click 1
			xdotool type $item
			echo $item
			sleep 3
			FPGA # Switches All FPGA I/O one by one
		done
	done
}

function ChangeTimingAnalog()
{
time=5
 #============works============================
  xrandr --output VGA-0 --mode 1280x720P50
  echo "output VGA1 --mode 1280x720P50 2 num $x"
  sleep $time
  FPGA_ADC
  xrandr --output VGA-0 --mode 1280x720P60
  echo "output VGA1 --mode 1280x720P60 3 num $x"
  sleep $time
  FPGA_ADC
  xrandr --output VGA-0 --mode 1920x1080P60
  echo "output VGA1 --mode 1920x1080P60 4 num $x"
  sleep $time
  FPGA_ADC
  xrandr --output VGA-0 --mode 1920x1080P50
  echo "output VGA1 --mode 1920x1080P50 5 num $x"
  sleep $time
  FPGA_ADC
  xrandr --output VGA-0 --mode 640x480P60
  echo "output VGA1 --mode 640x480P60 1 num $x"
  FPGA_ADC
  xrandr --output VGA-0 --mode 720x480P60
  echo "output VGA1 --mode 720x480P60 6 num $x"
  sleep $time
  FPGA_ADC
  xrandr --output VGA-0 --mode 720x576P50
  echo "output VGA1 --mode 720x480P50 7 num $x"
  sleep $time
  FPGA_ADC
  xrandr --output VGA-0 --mode 1280x720P50
  echo "output VGA1 --mode 720x480P50 7 num $x"
  sleep $time
  FPGA_ADC
  xrandr --output VGA-0 --mode 1280x720P60
  echo "output VGA1 --mode 720x480P50 7 num $x"
  sleep $time
  FPGA_ADC  
  xrandr --output VGA-0 --mode 1440x480P60
  echo "output VGA1 --mode 1440x480P60 8 num $x"
  sleep $time
  FPGA_ADC
  xrandr --output VGA-0 --mode 1440x576P50
  echo "output VGA1 --mode 1440x480P50 9 num $x"
  sleep $time
  FPGA_ADC
}

function OUTsDisable()
# Disabled All OUTs on the board
{
	for ((i = 1; i <= 3; i++))
	do
		echo SETMATRIX OUT$i DISABLE | ./test 192.168.5.92 5000
		echo $i
	done
}



# Main program
for ((k = 1; k <= 300; k++))
do
	OUTsDisable   # Disabled All OUTs
	# ChangeTiming  # Go!
	# OUTsDisable   # Disabled All OUTs
	ChangeTimingAnalog
	date
done
date
