---
title: Архитектура системы tapbot.kz
---

Техническая архитектура инфраструктуры автоматизации бизнес-процессов.

## 🏗️ Обзор системы

### Серверная архитектура

-  **Первый сервер (93.189.229.59)**: n8n + Redis + автоматизация

-  **Второй сервер (178.236.17.186)**: PostgreSQL + Directus + Qdrant

### Основные компоненты

-  **n8n**: Платформа автоматизации workflows

-  **Directus**: Headless CMS для управления контентом

-  **PostgreSQL**: Основная база данных

-  **Redis**: Кэширование и очереди сообщений

-  **Qdrant**: Векторная база данных для AI поиска

## 📋 Документы архитектуры

-  [`overview.md`](./overview) - Общий обзор системы

-  [`network-topology.md`](./network-topology) - Сетевая архитектура

-  [`data-flow.md`](./data-flow) - Потоки данных между компонентами

-  [`integration-patterns.md`](./integration-patterns) - Паттерны интеграции

-  [`scalability-plans.md`](./scalability-plans) - Планы масштабирования

## 🔗 Схемы интеграций

### API взаимодействие

```
n8n (1-й сервер) ←→ Directus API (2-й сервер)
     ↓                      ↓
Redis Cache ←→ PostgreSQL + Qdrant
```

### Веб-интерфейсы

-  **Production**: https://tapbot.kz

-  **API**: https://api.tapbot.kz

-  **CMS**: https://dir.tapbot.kz

-  **Workflows**: https://n8n.tapbot.kz

## 🛡️ Принципы безопасности

1. **Изоляция сетей** - PostgreSQL в приватной сети

2. **SSL везде** - все соединения зашифрованы

3. **BasicAuth** - защита административных интерфейсов

4. **Файрвол** - UFW + fail2ban на всех серверах

---

Подробная техническая документация находится в базе знаний Claude.ai