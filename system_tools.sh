#!/bin/bash
# Enhanced script functionality and debugged issues with assistance from ChatGPT
echo "Enter Password"
read -s password # Use -s to hide the input
if [[ $password == "0659" ]]; then # Check password
    echo "Password correct" # Confirm correct password
else
    echo "Incorrect"
    exit 1  # Exit if incorrect
fi
while true; do # primary loop
    echo -e "Please make a selection:" && echo -e
    echo -e "System Tools"
    echo "1. Update Linux"
    echo "2. Upgrade Linux"
    echo "3. View Memory Status" && echo -e
    echo -e "Network Tools"
    echo "4. View Available Networks"
    echo "5. Active Network Details" 
    echo "6. Connection Speedtest" 
    echo "7. Captive Portal for Public Wifi"
    echo "8. Devices on Active Network"
    echo -e "9. Exit"
read answer # Save Input
    # If/Else (secondary) loop from input
    if [[ $answer == 1 ]]; then # Update
        sudo apt update
    elif [[ $answer == 2 ]]; then # Upgrade
        sudo apt upgrade
    elif [[ $answer == 3 ]]; then # Memory Report
        free -h && sudo fdisk -l
    elif [[ $answer == 4 ]]; then # View Networks
        nmcli dev wifi list
    elif [[ $answer == 5 ]]; then # Connection Details
        ifconfig && ip ad
    elif [[ $answer == 6 ]]; then # Internet Speedtest
        speedtest-cli
    elif [[ $answer == 7 ]]; then # Force Captive Portal Login
        xdg-open http://nmcheck.gnome.org
    elif [[ $answer == 8 ]]; then # Run NMAP Command from current IP
        ip_address=$(hostname -I | awk '{print $1}') #get host details
        network_range=$(echo $ip_address| sed 's/\.[0-9]*$/\.0\/24/') #obtain network range
        sudo nmap -sn $network_range #run nmap on range
    elif [[ $answer == 9 ]]; then # BREAK from Loop
        echo "Exiting Program..."
        break
    else # else for incorrect
        echo "Incorrect Option"   
    fi # Close if/else loop (secondary)
done # Close while true loop (primary)
# End of Program
