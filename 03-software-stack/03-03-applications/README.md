---
title: 03.03 - Приложения
---

**Назначение:** Основные приложения и сервисы проекта

## 03\.03.01 - Directus (CMS/API платформа)

**Назначение:** Headless CMS и административная панель для управления контентом

```yaml
Directus 10.5.0:
  Сервер: Второй сервер (178.236.17.186)
  Домен: dir.tapbot.kz
  Ресурсы: ~20% CPU, ~600MB RAM
  Интеграция: PostgreSQL backend
  Статус: ✅ АКТИВЕН В ПРОДАКШЕНЕ
```

### Функциональность:

-  **Управление контентом ботов** - тексты сообщений, настройки поведения

-  **RESTful + GraphQL API** - интеграция с n8n workflow

-  **Административные панели** - интерфейсы для команды

-  **Права доступа и роли** - безопасное делегирование команде

-  **Медиа-библиотека** - изображения для ботов и веб-интерфейсов

### Схема данных в Directus:

```yaml
Collections:
  bot_messages:
    - message_key: string (уникальный ключ)
    - message_text: text (текст сообщения)
    - bot_type: enum (taxi, apartments)
    - language: enum (ru, kz, en)
    
  bot_settings:
    - setting_key: string
    - setting_value: json
    - bot_type: enum
    - is_active: boolean
    
  user_profiles:
    - telegram_id: integer
    - first_name: string
    - phone: string
    - preferences: json
```

### API endpoints:

```http
GET /items/bot_messages - получить сообщения бота
POST /items/user_profiles - создать профиль пользователя
PUT /items/bot_settings/123 - обновить настройки
```

## 03\.03.02 - n8n (платформа автоматизации)

**Назначение:** Low-code оркестрация бизнес-процессов и workflow

```yaml
n8n 1.93.0:
  Текущий статус: Планируется на первом сервере  
  Будущий домен: n8n.tapbot.kz
  Ресурсы: ~15% CPU, ~500MB RAM
  Персистентность: n8n_data volume
  Статус: ⏳ В ПЛАНАХ
```

### Ключевые workflow:

-  **Обработка сообщений Telegram** - парсинг команд и ответы пользователям

-  **AI интеграции** - OpenAI/Anthropic для генерации ответов

-  **Геокодинг и маршруты** - интеграция с картографическими API

-  **Email и SMS уведомления** - автоматические уведомления

-  **Синхронизация данных** - между Directus, PostgreSQL и внешними API

### Примеры workflow:

```yaml
Telegram Bot Workflow:
  Trigger: Webhook (Telegram Bot API)
  Steps:
    1. Parse incoming message
    2. Get user profile from Directus
    3. Determine intent (AI analysis)
    4. Execute business logic
    5. Generate response (AI if needed)
    6. Send reply via Telegram API
    7. Log interaction to PostgreSQL

Booking Workflow:
  Trigger: Manual/API call
  Steps:
    1. Validate booking data
    2. Check availability
    3. Create booking record
    4. Send SMS confirmation
    5. Schedule reminder emails
    6. Update analytics
```

## 03\.03.03 - Интеграции и API

### Внешние API интеграции:

**Основные интеграции:**

-  **Telegram Bot API** - основной канал взаимодействия с пользователями

-  **OpenAI GPT-4** - генерация AI ответов для ботов

-  **2GIS/Яндекс.Карты API** - геолокация и построение маршрутов

-  **SMS.ru/SMSC.ru** - SMS уведомления пользователям

-  **Email провайдеры** - автоматические письма подтверждения

**Конфигурация интеграций:**

```yaml
External APIs:
  telegram:
    base_url: "https://api.telegram.org/bot"
    rate_limit: 30 req/sec
    webhook_url: "https://n8n.tapbot.kz/webhook/telegram"
    
  openai:
    model: "gpt-4-turbo-preview"
    max_tokens: 1000
    temperature: 0.7
    rate_limit: 100 req/min
    
  sms_ru:
    api_id: "${SMS_RU_API_ID}"
    from: "tapbot.kz"
    rate_limit: 60 req/min
```

### Внутренние API:

**Архитектура внутренних API:**

-  **Directus REST API** - CRUD операции с данными

-  **PostgreSQL direct connections** - высокопроизводительные запросы

-  **Redis pub/sub** - реал-тайм уведомления между сервисами

-  **Qdrant HTTP API** - векторный поиск и рекомендации

## 03\.03.04 - Мониторинг приложений

### Уровни мониторинга:

**Application level:**

```yaml
Метрики приложений:
  - n8n workflow execution times
  - Directus API response times
  - Error rates и exceptions
  - Memory usage и CPU utilization
```

**Integration level:**

```yaml
Метрики интеграций:
  - External API response times
  - API rate limit usage
  - Webhook delivery success rates
  - Failed integration attempts
```

**User level:**

```yaml
Пользовательские метрики:
  - Bot conversation volumes
  - User engagement rates
  - Booking conversion rates
  - Geographic usage patterns
```

### Инструменты мониторинга:

-  **Netdata** - real-time системные метрики

-  **Prometheus + Grafana** - сбор и визуализация метрик приложений

-  **Directus logs** - встроенное логирование CMS операций

-  **n8n execution logs** - детальные логи workflow выполнения

---

**Связанные разделы:**

-  **Базы данных:** [03-02-databases](./../03-02-databases/README.md) - хранение данных приложений

-  **Инфраструктурные сервисы:** [03-04-infrastructure-services](./../03-04-infrastructure-services/README.md) - Docker и Traefik

-  **AI интеграции:** [07-development/07-02-ai-integration](./../../07-development/07-02-ai-integration/README.md) - детали AI workflow

-  **Мониторинг операций:** [06-operations/06-03-monitoring](./../../06-operations/06-03-monitoring/README.md) - операционный мониторинг