---
title: Конфигурации второго сервера
---

**Сервер:** 178\.236.17.186\
**Назначение:** PostgreSQL + Directus + Qdrant Data Stack\
**Последнее обновление:** 6 июля 2025

## 📋 Файлы конфигураций

### 🔧 Backup скрипты:

-  **001-daily-backup.sh** - Ежедневное резервное копирование

   -  Размер: \~1.8 KB

   -  Backup PostgreSQL баз данных

   -  Сохранение Directus конфигураций

### 🗄️ База данных:

-  **postgres_custom.conf** - Кастомные настройки PostgreSQL

   -  Размер: \~825 байт

   -  Оптимизация производительности

   -  Настройки безопасности

## 🎯 Планируемые конфигурации:

-  **docker-compose.yml** - Docker стек PostgreSQL + Directus + Qdrant

-  **.env.template** - Шаблон переменных окружения

-  **directus.config.js** - Настройки Directus CMS

-  **qdrant.config.yaml** - Конфигурация векторной базы