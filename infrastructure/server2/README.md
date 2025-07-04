# Второй сервер tapbot.kz - PostgreSQL + Directus

**IP:** 178.236.17.186  
**Провайдер:** beget.com  
**Статус:** ✅ Полностью настроен и работает  
**Веб-интерфейсы:** 6 сервисов через HTTPS

## Структура папок

- `directus-stack/` - Основная конфигурация Docker Compose
- `traefik/` - Конфигурация reverse proxy
- `backups/` - Скрипты автоматического резервного копирования
- `scripts/` - Утилитарные скрипты управления
- `configs/` - Дополнительные конфигурации (НЕ для Git)

## Быстрый старт

1. Перейти в `directus-stack/`
2. Скопировать `.env.template` в `.env`
3. Заполнить все пароли и ключи
4. Запустить: `docker compose up -d`

## Активные сервисы

- **Directus CMS:** https://dir.tapbot.kz
- **PGAdmin:** https://pg.tapbot.kz  
- **Portainer:** https://docker2.tapbot.kz
- **Dozzle (логи):** https://logs2.tapbot.kz
- **Traefik Dashboard:** https://traefik2.tapbot.kz
- **PostgreSQL:** Внутренний доступ (порт 5432)

## Безопасность

- ✅ UFW файрвол активен (порты 22, 80, 443, 8442)
- ✅ fail2ban защита (4 активных jail)
- ✅ SSL сертификаты автоматические (Let's Encrypt)
- ✅ BasicAuth на административных интерфейсах
- ✅ Изолированная сеть для PostgreSQL

## Мониторинг ресурсов

- **RAM:** ~1.1GB / 3.8GB (29% использования)
- **CPU:** <2% нагрузка всех контейнеров
- **Диск:** ~5GB / 29GB (19% использования)

## Администрирование

См. соответствующие папки для:
- Backup процедур (`backups/`)
- Utility скриптов (`scripts/`)
- Мониторинга и логов

## Связанные документы

- [Программный стек проекта](../../docs/architecture/stack.md)
- [Безопасность серверов](../../docs/security/servers.md)
- [Процедуры бэкапа](./backups/README.md)
