---
title: 03. - Программный стек проекта tapbot.kz
---

**Раздел:** 03 - Программный стек\
**Назначение:** Архитектура ПО, сервисы, интеграции

## 🎯 Обзор проекта

tapbot.kz - стартап-платформа для автоматизации бизнес-процессов через Telegram-ботов с искусственным интеллектом. Основные направления: междугороднее такси между городами Казахстана и сервис аренды суточных квартир.

## 📁 Разделы документации

### [03\.01 - Архитектурные принципы](./03-01-architecture/README.md)

Микросервисная архитектура, API-first подход, принципы безопасности и масштабирования

### [03\.02 - Базы данных](./03-02-databases/README.md)

PostgreSQL, Redis, Qdrant - основные системы хранения данных проекта

### [03\.03 - Приложения](./03-03-applications/README.md)

Directus CMS, n8n автоматизация, интеграции и мониторинг приложений

### [03\.04 - Инфраструктурные сервисы](./03-04-infrastructure-services/README.md)

Traefik, Docker, система логирования, метрики и алерты

## 🏗️ Архитектура серверов

### Принцип разделения ролей

```
Первый сервер (93.189.229.59) - "Frontend & Automation Hub"
├── n8n (workflow automation)          
├── Redis (кэширование, очереди)       
├── Traefik (reverse proxy + SSL)      
└── Основной сайт (tapbot.kz)

Второй сервер (178.236.17.186) - "Database & Content Hub"
├── PostgreSQL (реляционные данные)
├── Directus (headless CMS/API)
├── Qdrant (векторный поиск)
└── PGAdmin (управление БД)
```

## 🚀 Текущий статус реализации

### ✅ Готово к продакшену:

-  Второй сервер: PostgreSQL + Directus + PGAdmin

-  Безопасность: UFW + fail2ban + SSL

-  DNS архитектура: централизована через ps.kz

-  Все веб-интерфейсы защищены авторизацией

### ⏳ В разработке:

-  Первый сервер: n8n + Redis + Traefik

-  Второй сервер: Qdrant для векторного поиска

-  Полный мониторинг: Prometheus + Grafana

-  AI интеграции: OpenAI API через n8n

---

**Связанные разделы:**

-  **Инфраструктура:** [02-infrastructure](./../02-infrastructure/README.md) - серверы и ресурсы

-  **Сетевая архитектура:** [04-network-architecture](./../04-network-architecture/README.md) - DNS и порты

-  **Безопасность:** [05-security](./../05-security/README.md) - защита серверов и приложений

-  **Операции:** [06-operations](./../06-operations/README.md) - развертывание и мониторинг