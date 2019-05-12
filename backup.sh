#!/bin/sh
suffix=$(date +"%m-%d-%Y-%H-%M")
filename="quillpad_production_backup_".$suffix
su -c "pg_dump quillpad_production > ".$filename -s /bin/sh postgres

if [ $? -eq 0 ]
then
  echo "Backup file created -".$filename
else
  echo "Backup failed"
fi