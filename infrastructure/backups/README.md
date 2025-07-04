---
order: 1
title: Backup скрипты серверов tapbot.kz
---

**Дата создания:** 4 июля 2025

**Статус:** ✅ Реализовано и протестировано

## 📂 Структура

### server1/ (93.189.229.59)

-  [`001-daily-backup.sh`](http://001-daily-backup.sh) - Ежедневный backup первого сервера

-  **Включает:** системные конфигурации, Docker volumes

-  **Размер backup:** \~94KB (системные конфигурации)

### server2/ (178.236.17.186)

-  [`001-daily-backup.sh`](http://001-daily-backup.sh) - Ежедневный backup второго сервера

-  **Включает:** PostgreSQL база данных, системные конфигурации, Docker volumes

-  **Размер backup:** \~125KB конфигурации + \~8KB база данных

## 🚀 Развертывание

### Копирование на серверы:

```
# Первый сервер
scp server1/001-daily-backup.sh root@93.189.229.59:/opt/backups/scripts/
ssh root@93.189.229.59 "chmod +x /opt/backups/scripts/001-daily-backup.sh"

# Второй сервер  
scp server2/001-daily-backup.sh root@178.236.17.186:/opt/backups/scripts/
ssh root@178.236.17.186 "chmod +x /opt/backups/scripts/001-daily-backup.sh"
```

### Автоматизация (crontab):

```
# Добавить на каждый сервер:
30 2 * * * /opt/backups/scripts/001-daily-backup.sh
```

## ✅ Статус реализации

-  \[x\] **Структура /opt/backups/** создана на обоих серверах

-  \[x\] **Скрипты backup** протестированы и работают

-  \[x\] **PostgreSQL backup** настроен (второй сервер)

-  \[x\] **Системные конфигурации** архивируются

-  \[ \] **Автоматизация crontab** (планируется)

-  \[ \] **Мониторинг backup операций** (планируется)

## 🔗 Связанные документы

-  См. `docs/guides/operations/`[`backup-procedures.md`](http://backup-procedures.md) - детальная документация

-  См. `docs/architecture/`[`servers.md`](http://servers.md) - архитектура серверов