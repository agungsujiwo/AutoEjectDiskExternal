#!/bin/bash
#Create by Agung sujiwo 22/01/2025
#Function to eject a specific disk

#Fuction eject disk.
eject_disk() {
    local disk=$1
    echo "Ejecting $disk..."
    diskutil eject "$disk" >/dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "Successfully ejected $disk."
    else
        echo "Failed to eject $disk. You might need admin privileges."
    fi
}

# Main loop to monitor USB drives every 5 Seconds
while true; do
    # Get a list of all external disks (exclude internal drives)
    connected_disks=$(diskutil list | grep external | awk '{print $1}')
    
    if [ ! -z "$connected_disks" ]; then
        echo "Detected external disk(s):"
        echo "$connected_disks"
        
        # Eject each detected external disk
        for disk in $connected_disks; do
            eject_disk "$disk"
        done
    fi

    # Sleep for 5 seconds before re-checking
    sleep 5
done
