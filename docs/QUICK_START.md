# Быстрый старт для команды tapbot.kz

## 🚀 Первые шаги

### 1. Веб-интерфейсы (основные инструменты)
- **Directus CMS**: https://dir.tapbot.kz
- **PGAdmin (БД)**: https://pg.tapbot.kz  
- **Portainer (Docker)**: https://docker2.tapbot.kz
- **Логи**: https://logs2.tapbot.kz

### 2. Доступ к серверам
```bash
# Второй сервер (PostgreSQL + Directus)
ssh monitor@178.236.17.186

# Первый сервер (будет готов скоро)
ssh monitor@93.189.229.59
```

### 3. Безопасные команды мониторинга
```bash
# Статус всех сервисов
docker compose ps

# Использование ресурсов
docker stats --no-stream

# Логи сервиса
docker compose logs directus
```

## 📚 Что читать дальше

1. **Новичкам**: [`guides/getting-started.md`](./guides/getting-started.md)
2. **Архитектура**: [`architecture/overview.md`](./architecture/overview.md)  
3. **Безопасность**: [`security/forbidden-actions.md`](./security/forbidden-actions.md)
4. **Операции**: [`operations/daily-health-check.md`](./operations/daily-health-check.md)

## ⚠️ Важные правила

- **НЕ выполняйте** команды с `rm`, `dd`, `mkfs` без подтверждения
- **ВСЕГДА** делайте backup перед изменениями
- **СПРАШИВАЙТЕ** если не уверены в команде
- **ИСПОЛЬЗУЙТЕ** веб-интерфейсы когда возможно

---
При вопросах обращайтесь к Кадырхану или создавайте Issue в GitHub
