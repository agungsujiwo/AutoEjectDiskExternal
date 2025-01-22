#!/bin/bash
#Create by Agung sujiwo 22/1/2025



# Cari proses ejectDisk.sh kecuali proses grep
process_info=$(ps aux | grep "[A]utoEjectDiskExternal.sh")

if [ -n "$process_info" ]; then
    # Jika proses ditemukan, ambil kolom ke-11 sampai akhir
    script_command=$(echo "$process_info" | awk '{for (i=11; i<=NF; i++) printf $i " "; print ""}')
    echo "AutoEjectDiskExternal.sh aktif: $script_command"
else
    echo "AutoEjectDiskExternal.sh tidak aktif"
fi
