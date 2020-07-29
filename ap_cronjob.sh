sleep 3
OUTPUT=$(iwconfig wlan0 | grep -c ESSID)
CHECKAP=$(ifconfig wlan0 | grep -c 192.168.87.87)
if [ $OUTPUT = "0" ]
then
    echo "Not associated to home AP, starting local AP"
    logger "Home AP not found, starting local AP"
    sudo sh /home/pi/ap/startAP.sh
else
    
    logger "Home AP found, not starting local AP"
    if  [ $CHECKAP = "1" ]
    then
        echo "Found AP Running in Client MODE, Closing AP"
        sudo sh /home/pi/ap/closeAP.sh
    else
        echo "Associated to home AP, no action taken"
    fi
fi