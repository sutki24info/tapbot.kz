#!/bin/bash
# Ежедневный backup второго сервера tapbot.kz (Database Server)
# Дата создания: 4 июля 2025
# Сервер: 178.236.17.186 (второй сервер - PostgreSQL, Directus)

LOG_FILE="/opt/backups/logs/daily-$(date +%Y%m%d).log"
BACKUP_DATE=$(date +%Y%m%d_%H%M%S)

echo "=== DAILY BACKUP START: $(date) ===" >> $LOG_FILE

# Backup Docker volumes
if [ -d "/opt/docker" ]; then
    echo "Backing up Docker volumes..." >> $LOG_FILE
    tar -czf "/opt/backups/daily/docker-volumes/docker-volumes-$BACKUP_DATE.tar.gz" \
        -C /opt/docker . 2>> $LOG_FILE
    echo "Docker volumes backup completed" >> $LOG_FILE
fi

# Backup PostgreSQL database
echo "Backing up PostgreSQL database..." >> $LOG_FILE
docker exec postgres_db pg_dump -U directus_user directus \
    > "/opt/backups/daily/databases/directus-$BACKUP_DATE.sql" 2>> $LOG_FILE
gzip "/opt/backups/daily/databases/directus-$BACKUP_DATE.sql"
echo "PostgreSQL backup completed" >> $LOG_FILE

# Backup системных конфигураций
echo "Backing up system configs..." >> $LOG_FILE
mkdir -p "/opt/backups/daily/configs/system-$BACKUP_DATE"
cp -r /etc/fail2ban "/opt/backups/daily/configs/system-$BACKUP_DATE/" 2>> $LOG_FILE
cp -r /etc/ufw "/opt/backups/daily/configs/system-$BACKUP_DATE/" 2>> $LOG_FILE
cp /etc/sudoers.d/* "/opt/backups/daily/configs/system-$BACKUP_DATE/" 2>> $LOG_FILE
cp -r /etc/webmin "/opt/backups/daily/configs/system-$BACKUP_DATE/" 2>> $LOG_FILE

# Создание архива конфигураций
tar -czf "/opt/backups/daily/configs/system-configs-$BACKUP_DATE.tar.gz" \
    -C "/opt/backups/daily/configs" "system-$BACKUP_DATE" 2>> $LOG_FILE
rm -rf "/opt/backups/daily/configs/system-$BACKUP_DATE"

echo "=== DAILY BACKUP END: $(date) ===" >> $LOG_FILE