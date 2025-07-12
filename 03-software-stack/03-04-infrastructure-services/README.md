---
title: 03.04 - Инфраструктурные сервисы
---

**Назначение:** Базовые инфраструктурные компоненты и сервисы поддержки

## 03\.04.01 - Traefik (reverse proxy)

**Назначение:** Автоматический reverse proxy и SSL терминация

```yaml
Traefik 3.0:
  Развертывание: Оба сервера
  Статус: ✅ АКТИВЕН на втором сервере, ⏳ планируется на первом
  
  Функции:
    - Автоматическое обнаружение Docker сервисов
    - Let's Encrypt SSL сертификаты
    - Load balancing между инстансами
    - HTTP to HTTPS редиректы
    
  Домены управления:
    - traefik1.tapbot.kz (первый сервер - планируется)
    - traefik2.tapbot.kz (второй сервер - ✅ активен)
```

### Конфигурация Traefik:

```yaml
# docker-compose.yml
traefik:
  image: traefik:v3.0
  command:
    - "--api.dashboard=true"
    - "--providers.docker=true"
    - "--entrypoints.web.address=:80"
    - "--entrypoints.websecure.address=:443"
    - "--certificatesresolvers.letsencrypt.acme.tlschallenge=true"
    - "--certificatesresolvers.letsencrypt.acme.email=admin@tapbot.kz"
  labels:
    - "traefik.http.routers.dashboard.rule=Host(`traefik2.tapbot.kz`)"
    - "traefik.http.routers.dashboard.tls.certresolver=letsencrypt"
```

### Маршrutизация сервисов:

```yaml
Активные маршруты (второй сервер):
  - dir.tapbot.kz → Directus:80
  - pg.tapbot.kz → PGAdmin:80
  - traefik2.tapbot.kz → Traefik Dashboard:8080
  - logs2.tapbot.kz → Dozzle:8080
  - portainer2.tapbot.kz → Portainer:9000

Планируемые маршруты (первый сервер):
  - n8n.tapbot.kz → n8n:5678
  - redis1.tapbot.kz → Redis Commander:8081
  - traefik1.tapbot.kz → Traefik Dashboard:8080
```

## 03\.04.02 - Docker (контейнеризация)

**Назначение:** Стандарт контейнеризации для всех сервисов проекта

### Принципы контейнеризации:

-  **Docker Compose** - оркестрация multi-container приложений

-  **Named volumes** - персистентное хранение данных

-  **Custom networks** - изоляция трафика

-  **Environment variables** - конфигурация без хардкода

### Сетевая архитектура Docker:

```yaml
Networks:
  traefik-network:
    driver: bridge
    external: true
    назначение: Внешний трафик через Traefik
    
  database-network:
    driver: bridge
    internal: true
    назначение: Изолированная сеть для БД
    
  redis-network:
    driver: bridge
    internal: true
    назначение: Redis кластер коммуникация
```

### Стандарты Docker Compose:

```yaml
# Пример сервиса
service_name:
  image: official/image:version
  container_name: descriptive-name
  restart: unless-stopped
  environment:
    - ENV_VAR=${ENV_VAR}
  volumes:
    - service_data:/data
  networks:
    - appropriate-network
  labels:
    - "traefik.enable=true"
    - "traefik.http.routers.service.rule=Host(`service.tapbot.kz`)"
```

## 03\.04.03 - Система логирования

### Централизованное логирование через Dozzle:

```yaml
Dozzle:
  Назначение: Веб-интерфейс для просмотра Docker логов
  Сервер: Второй сервер (178.236.17.186)
  Домен: logs2.tapbot.kz
  Безопасность: BasicAuth защита для студентов
  Статус: ✅ АКТИВЕН
```

### Функции системы логирования:

-  **Real-time логи** всех Docker контейнеров

-  **Поиск и фильтрация** по логам с regex поддержкой

-  **Multi-container мониторинг** - все сервисы в одном интерфейсе

-  **Color coding** - различные уровни логов (ERROR, WARN, INFO, DEBUG)

### Конфигурация логирования Docker:

```yaml
# Настройки логирования для всех сервисов
logging:
  driver: "json-file"
  options:
    max-size: "10m"
    max-file: "3"
    compress: "true"
```

### Уровни логирования:

```yaml
Application logs:
  - ERROR: Критические ошибки приложений
  - WARN: Предупреждения и потенциальные проблемы
  - INFO: Информационные сообщения о работе
  - DEBUG: Детальная отладочная информация

System logs:
  - Docker daemon events
  - Container lifecycle events
  - Network connectivity issues
  - Volume mount problems
```

## 03\.04.04 - Метрики и алерты

### Планируемая система мониторинга:

```yaml
Мониторинг стек (в разработке):
  Netdata:
    назначение: Real-time системные метрики
    установка: Оба сервера
    метрики: CPU, RAM, Disk, Network
    
  Prometheus:
    назначение: Сбор метрик приложений
    установка: Первый сервер
    retention: 30 дней
    
  Grafana:
    назначение: Дашборды и визуализация
    домен: grafana.tapbot.kz (планируется)
    интеграция: Prometheus + Netdata
    
  Alertmanager:
    назначение: Уведомления о проблемах
    каналы: Email, Telegram, SMS
```

### Ключевые метрики для мониторинга:

```yaml
Системные метрики:
  - CPU usage по серверам (>80% = alert)
  - Memory usage (>85% = alert)
  - Disk space (>90% = critical)
  - Network I/O и latency
  - Docker container health

Приложенческие метрики:
  - PostgreSQL connections и query performance
  - n8n workflow execution times
  - Directus API response times
  - External API rate limits usage

Бизнес метрики:
  - Telegram bot message volumes
  - User registration rates
  - Booking conversion rates
  - Geographic distribution пользователей
```

### Конфигурация алертов:

```yaml
Alert rules:
  high_cpu:
    condition: cpu_usage > 80% for 5min
    severity: warning
    channels: [telegram, email]
    
  service_down:
    condition: container_status != running
    severity: critical
    channels: [telegram, sms, email]
    
  database_connections:
    condition: postgres_connections > 80
    severity: warning
    channels: [email]
    
  api_errors:
    condition: error_rate > 5% for 1min
    severity: critical
    channels: [telegram, email]
```

### Планируемые дашборды Grafana:

-  **Infrastructure Overview** - общие метрики серверов

-  **Application Performance** - метрики приложений и API

-  **Business Analytics** - пользовательские и бизнес метрики

-  **Security Dashboard** - события безопасности и атаки

---

**Связанные разделы:**

-  **Архитектурные принципы:** [03-01-architecture](./../03-01-architecture/README) - принципы проектирования

-  **Серверная инфраструктура:** [02-infrastructure/02-01-servers](./../../02-infrastructure/02-01-servers/README) - физические серверы

-  **Сетевая архитектура:** [04-network-architecture/04-02-ports](./../../04-network-architecture/04-02-ports/README) - порты и сети

-  **Операционное развертывание:** [06-operations/06-02-deployment](./../../06-operations/06-02-deployment/README) - процедуры развертывания

-  **Мониторинг операций:** [06-operations/06-03-monitoring](./../../06-operations/06-03-monitoring/README) - детальный мониторинг