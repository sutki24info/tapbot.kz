---
title: Процедуры резервного копирования
---

## Процедуры резервного копирования

**Дата создания:** 4 июля 2025\
**Статус:** ✅ Реализовано\
**Для команды:** Руководство по backup системе tapbot.kz

## 🎯 Обзор системы backup

Автоматизированная система резервного копирования обоих серверов с ежедневным архивированием критически важных данных.

### Что архивируется:

-  **Системные конфигурации** (fail2ban, UFW, sudoers, webmin)

-  **Docker volumes** (данные контейнеров)

-  **PostgreSQL база данных** (только второй сервер)

-  **Логи операций** backup

## 🏗️ Архитектура backup

### Структура на серверах:

```
/opt/backups/
├── daily/              # Ежедневные backup
│   ├── docker-volumes/ # Docker данные
│   ├── configs/        # Системные конфигурации
│   └── databases/      # PostgreSQL backup (второй сервер)
├── weekly/             # Еженедельные backup (планируется)
├── monthly/            # Ежемесячные backup (планируется)
├── scripts/            # Скрипты автоматизации
│   ├── 001-daily-backup.sh
│   └── restore/        # Скрипты восстановления
├── logs/               # Логи операций
└── temp/               # Временные файлы
```

## 📊 Результаты тестирования

### Первый сервер (93.189.229.59):

-  **Системные конфигурации:** 93 KB

-  **Docker volumes:** 809 bytes (пустые папки)

-  **Время выполнения:** \< 1 секунды

-  **Статус:** ✅ Работает

### Второй сервер (178.236.17.186):

-  **Системные конфигурации:** 125 KB (включая webmin)

-  **PostgreSQL база:** 7\.7 KB (сжатая)

-  **Docker volumes:** готов к архивированию

-  **Время выполнения:** 1 секунда

-  **Статус:** ✅ Работает

## 🔧 Ручное выполнение backup

### Команды для выполнения:

```bash
# Первый сервер
ssh root@93.189.229.59
/opt/backups/scripts/001-daily-backup.sh

# Второй сервер
ssh root@178.236.17.186
/opt/backups/scripts/001-daily-backup.sh
```

### Проверка результатов:

```bash
# Просмотр backup файлов
ls -la /opt/backups/daily/

# Чтение логов
cat /opt/backups/logs/daily-$(date +%Y%m%d).log

# Проверка размеров
du -sh /opt/backups/daily/*
```

## ⚙️ Автоматизация (планируется)

### Настройка crontab:

```bash
# Ежедневный backup в 02:30
30 2 * * * /opt/backups/scripts/001-daily-backup.sh

# Очистка старых файлов (7 дней)
0 3 * * 0 find /opt/backups/daily -name "*.tar.gz" -mtime +7 -delete
0 3 * * 0 find /opt/backups/daily -name "*.sql.gz" -mtime +7 -delete
```

## 🛠️ Процедуры восстановления

### Восстановление системных конфигураций:

```bash
# Распаковка backup
cd /opt/backups/daily/configs/
tar -xzf system-configs-YYYYMMDD_HHMMSS.tar.gz

# Восстановление конкретных конфигураций
cp -r system-YYYYMMDD_HHMMSS/fail2ban/* /etc/fail2ban/
cp -r system-YYYYMMDD_HHMMSS/ufw/* /etc/ufw/
systemctl restart fail2ban ufw
```

### Восстановление PostgreSQL:

```bash
# Восстановление из backup
cd /opt/backups/daily/databases/
gunzip directus-YYYYMMDD_HHMMSS.sql.gz
docker exec -i postgres_db psql -U directus_user directus < directus-YYYYMMDD_HHMMSS.sql
```

## 🚨 Мониторинг и алерты

### Проверка статуса backup:

```bash
# Скрипт проверки (создается)
/opt/backups/scripts/check-backup-status.sh
```

### Признаки проблем:

-  **Отсутствие лог файла** за текущую дату

-  **Неполные backup файлы** (размер 0 байт)

-  **Ошибки в логах** backup операций

-  **Переполнение диска** в /opt/backups/

## 🔗 Файлы и ссылки

### Исходные скрипты:

-  `infrastructure/backups/server1/001-daily-backup.sh`

-  `infrastructure/backups/server2/001-daily-backup.sh`

-  `infrastructure/backups/README.md`

### Связанная документация:

-  [Архитектура серверов](../architecture/servers)

-  [Процедуры безопасности](../security/procedures)

-  [Мониторинг инфраструктуры](./monitoring)

---

**Важно:** Backup система протестирована и готова к продакшену. Следующий этап - настройка автоматизации через crontab и создание скриптов мониторинга.