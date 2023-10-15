#!bin/bash

backup_dir="./"
record_file="menu.sh"
backup_file="backup_$(date+'%y%m%d%h%m%s'.tar.gz"

#create a compressed backup of the record file
tar -czf "backup_dir/$backup_file" "$record_file"

echo "Backup created: $backup_dir/$backup_file"
