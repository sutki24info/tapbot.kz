---
title: 03.02 - Базы данных
---

**Назначение:** Системы хранения и управления данными проекта

## 03\.02.01 - PostgreSQL (основная СУБД)

**Назначение:** Централизованное хранение всех бизнес-данных проекта

```yaml
PostgreSQL 15.3:
  Сервер: Второй сервер (178.236.17.186)
  Домен: pg.tapbot.kz (PGAdmin веб-интерфейс)
  Ресурсы: ~30% CPU, ~1.5GB RAM
  Персистентность: postgres_data volume
  Статус: ✅ АКТИВЕН В ПРОДАКШЕНЕ
```

### Схемы данных:

-  **Пользователи и профили** - данные пользователей Telegram ботов

-  **История диалогов** - контекст conversations для AI

-  **Заявки на такси** - бронирования поездок между городами

-  **Бронирования квартир** - система аренды суточного жилья

-  **Конфигурации workflow** - настройки n8n автоматизации

-  **Аналитика и метрики** - статистика использования системы

### Конфигурация производительности:

```sql
-- Основные параметры для стартапа
shared_buffers = 256MB
effective_cache_size = 1GB
work_mem = 4MB
maintenance_work_mem = 64MB
max_connections = 100
```

## 03\.02.02 - Redis (кэширование и очереди)

**Назначение:** Высокопроизводительное кэширование и управление очередями

```yaml
Redis 7.0:
  Текущий статус: Планируется на первом сервере
  Будущий домен: redis1.tapbot.kz (Redis Commander)
  Ресурсы: ~5% CPU, ~200MB RAM
  Персистентность: AOF + RDB
  Статус: ⏳ В ПЛАНАХ
```

### Сценарии использования:

-  **Кэширование API ответов** - OpenAI, геокодинг, внешние сервисы

-  **Сессии пользователей** - состояние Telegram ботов

-  **Очереди задач** - n8n workflow queues

-  **Временные данные** - промежуточные результаты обработки

-  **Rate limiting** - ограничение запросов к API

### Структуры данных:

```redis
# Примеры ключей Redis
user:telegram:123456 -> hash (профиль пользователя)
session:bot:taxi -> string (состояние диалога)
queue:ai:requests -> list (очередь запросов к AI)
cache:geocoding:almaty -> hash (кэш геокодинга)
rate:api:openai:user123 -> string (счетчик запросов)
```

## 03\.02.03 - Qdrant (векторная база данных)

**Назначение:** Семантический поиск и AI-powered рекомендации

```yaml
Qdrant 1.3.0:
  Текущий статус: Планируется на втором сервере
  Будущий домен: qdrant.tapbot.kz
  Ресурсы: ~15% CPU, ~800MB RAM
  Персистентность: qdrant_data volume
  Статус: ⏳ В ПЛАНАХ
```

### Применение в проекте:

-  **Векторный поиск по истории** - семантический поиск по переписке

-  **Рекомендации квартир** - поиск жилья по предпочтениям

-  **Анализ запросов пользователей** - понимание намерений

-  **AI embeddings** - улучшение качества ответов ботов

### Конфигурация коллекций:

```yaml
collections:
  conversations:
    vectors:
      size: 1536  # OpenAI embeddings
      distance: Cosine
    payload_schema:
      user_id: integer
      timestamp: datetime
      message_text: string
      intent: string
      
  apartments:
    vectors:
      size: 768   # Sentence transformers
      distance: Dot
    payload_schema:
      apartment_id: string
      location: geo
      price: float
      amenities: array
```

## 03\.02.04 - Стратегии backup и репликации

### Автоматическое резервное копирование:

**PostgreSQL backup:**

```bash
# Ежедневные полные backup
pg_dump -h localhost -U postgres -d tapbot_main > backup_$(date +%Y%m%d).sql

# WAL архивирование для point-in-time recovery
archive_mode = on
archive_command = 'cp %p /backup/wal/%f'
```

**Redis backup:**

```bash
# RDB snapshots каждые 6 часов
save 21600 1

# AOF для точности до секунды
appendonly yes
appendfsync everysec
```

**Qdrant backup:**

```bash
# Backup коллекций на внешнее хранилище
curl -X POST "http://qdrant:6333/collections/conversations/snapshots"
curl -X POST "http://qdrant:6333/collections/apartments/snapshots"
```

### Стратегия репликации:

-  **PostgreSQL:** Streaming replication для read replicas (при масштабировании)

-  **Redis:** Master-slave репликация для высокой доступности

-  **Qdrant:** Distributed deployment с репликацией коллекций

---