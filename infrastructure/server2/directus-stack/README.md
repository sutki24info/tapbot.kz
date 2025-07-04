---
title: Directus Stack - Основная конфигурация
---

Полная конфигурация Docker Compose для второго сервера.

## Файлы

-  `docker-compose.yml` - Основная конфигурация (6 сервисов)

-  `.env.template` - Шаблон переменных окружения

-  `postgres_custom.conf` - Оптимизированная конфигурация PostgreSQL

## Установка

1. Скопировать шаблон:

```bash
cp .env.template .env
```

1. Заполнить все пароли в .env файле

2. Проверить конфигурацию:

```bash
docker compose config
```

1. Запустить стек:

```bash
docker compose up -d
```

## Сервисы в стеке

1. **Traefik** - Reverse proxy + SSL

2. **PostgreSQL** - База данных

3. **Directus** - Headless CMS

4. **PGAdmin** - Управление БД

5. **Portainer** - Управление Docker

6. **Dozzle** - Просмотр логов

## Команды управления

```bash
# Статус сервисов
docker compose ps

# Логи
docker compose logs -f directus

# Перезапуск сервиса
docker compose restart directus

# Остановка стека
docker compose down

# Обновление образов
docker compose pull && docker compose up -d
```

## Безопасность

-  Все пароли в .env файле

-  SSL автоматически через Let's Encrypt

-  BasicAuth на административных интерфейсах

-  PostgreSQL в изолированной сети