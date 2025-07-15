---
title: 🤖 tapbot.kz - Автоматизация бизнес-процессов через AI-ботов
---

**Статус проекта:** 🚧 Активная разработка\
**Инфраструктура:** 🟢 100% готова (2 сервера, 6 веб-интерфейсов)\
**Документация:** 🟢 Система Claude.ai + GitHub синхронизирована

## 🎯 Обзор проекта

tapbot.kz - стартап-платформа для автоматизации бизнес-процессов через Telegram-ботов с искусственным интеллектом. Основные направления: междугороднее такси между городами Казахстана и сервис аренды суточных квартир.

### 🏗️ Архитектурные принципы

-  **Разделение ответственности:** автоматизация отделена от баз данных

-  **Веб-интерфейсы везде:** команда состоит из новичков

-  **Безопасность в глубину:** многоуровневая защита

-  **Готовность к масштабированию:** контейнеризация и микросервисы

-  **Экономия ресурсов:** стартап-бюджет требует оптимизации

---

## 📁 Структура документации

### 01\. 🏗️ [Основы проекта](./01-project-foundation/_index)

**Фундамент проекта: видение, команда, экономика**

-  01\.01 [Видение и стратегия](01-project-foundation/01-01-vision/README) - Бизнес-контекст, требования, принципы

-  01\.02 [Команда и процессы](01-project-foundation/01-02-team/README) - Структура, ответственность, принятие решений

-  01\.03 [Экономика проекта](01-project-foundation/01-03-economics/README) - Бюджет, ROI, масштабирование

### 02\. 🖥️ [Инфраструктура](./02-infrastructure/_index)

**Железо, ресурсы, стоимость**

-  02\.01 [Серверы и железо](./02-infrastructure/02-01-servers/README) - Конфигурации, топология, провайдеры

-  02\.02 [Ресурсы и производительность](./02-infrastructure/02-02-resources/README) - CPU, память, оптимизация, мониторинг

-  02\.03 [Стоимость и экономика](02-infrastructure/02-03-cost/README) - Тарифы, сравнение провайдеров, ROI

### 03\. ⚙️ [Программный стек](./03-software-stack/_index)

**Архитектура, базы данных, приложения, интерфейсы**

-  03\.01 [Архитектура системы](./03-software-stack/03-01-architecture/README) - Микросервисы, Docker, reverse proxy, масштабирование

-  03\.02 [База данных](03-software-stack/03-02-database/README) - PostgreSQL, Qdrant, Redis, резервное копирование

-  03\.03 [Автоматизация и AI](03-software-stack/03-03-automation/README) - n8n, AI модели, Telegram Bot API, webhooks

-  03\.04 [Интерфейсы управления](03-software-stack/03-04-interfaces/README) - Directus, PGAdmin, Portainer, Webmin

### 04\. 🌐 [Сетевая архитектура](./04-network-architecture/_index)

**Домены, SSL, порты, firewall**

-  04\.01 [Доменная структура](./04-network-architecture/04-01-domains/README) - tapbot.kz, поддомены серверов, DNS управление

-  04\.02 [SSL и безопасность](04-network-architecture/04-02-ssl/README) - Let's Encrypt, Traefik SSL, мониторинг сертификатов

-  04\.03 [Управление портами](./04-network-architecture/04-03-port-management/README) - Стандартные порты, процедуры изменения, мониторинг

-  04\.04 [Firewall и сетевая защита](04-network-architecture/04-04-firewall/README) - UFW, fail2ban, сегментация, мониторинг угроз

### 05\. 🔧 [Операционные процедуры](05-operational-procedures)

**Развертывание, мониторинг, backup, disaster recovery**

-  05\.01 [Развертывание и обновления](05-operational-procedures/05-01-deployment/README) - Docker Compose, обновления, rollback, автоматизация

-  05\.02 [Мониторинг и алерты](05-operational-procedures/05-02-monitoring/README) - Netdata, Grafana, Dozzle, система уведомлений

-  05\.03 [Резервное копирование](05-operational-procedures/05-03-backup/README) - PostgreSQL backup, Docker volumes, автоматизация, восстановление

-  05\.04 [Аварийное восстановление](05-operational-procedures/05-04-disaster-recovery/README) - Disaster recovery планы, отказоустойчивость, тестирование

### 06\. 🛡️ [Безопасность](06-security)

**Стратегии защиты, аутентификация, сетевая защита, контейнеры, администрирование**

-  06\.01 [Стратегии защиты](06-security/06-01-defense-strategy/README) - Многоуровневая безопасность, минимальные привилегии, сегментация

-  06\.02 [Аутентификация и авторизация](06-security/06-02-authentication/README) - BasicAuth, SSH ключи, управление паролями, 2FA

-  06\.03 [Сетевая защита](06-security/06-03-network-protection/README) - UFW правила, fail2ban, DDoS защита, мониторинг трафика

-  06\.04 [Безопасность контейнеров](06-security/06-04-container-security/README) - Docker security, изоляция сетей, управление секретами

-  06\.05 [Системное администрирование](06-security/06-05-system-administration/README) - Webmin управление, SSH доступ, права пользователей, системные утилиты

### 07\. 📖 [Справочники](07-reference)

**Команды, конфигурации, чек-листы, решение проблем**

-  07\.01 [Команды и скрипты](07-reference/07-01-commands/README) - Docker управление, системное администрирование, диагностика

-  07\.02 [Конфигурационные файлы](07-reference/07-02-configurations/README) - Docker Compose шаблоны, Traefik, системные конфигурации

-  07\.03 [Чек-листы и процедуры](07-reference/07-03-checklists/README) - Развертывание сервисов, настройка безопасности, обновления

-  07\.04 [Решение проблем](07-reference/07-04-troubleshooting/README) - Docker ошибки, SSL/DNS проблемы, диагностика производительности

### 08\. 📈 [Планирование](./08-planning/_index)

**Roadmap, миграция документации, масштабирование, бизнес-развитие**

-  08\.01 [Roadmap развития](./08-planning/08-01-roadmap/README) - Краткосрочные планы, среднесрочные планы, долгосрочное видение, метрики

-  08\.02 [Миграция документации](08-planning/08-02-documentation-migration/README) - План перехода на GitHub, статус миграции, контроль качества

-  08\.03 [Масштабирование инфраструктуры](08-planning/08-03-scaling/README) - Расширение серверов, оптимизация производительности, Kubernetes

-  08\.04 [Бизнес-развитие](08-planning/08-04-business-development/README) - Запуск MVP, привлечение пользователей, партнерские программы, монетизация

---

## 🚀 Статус компонентов

| Компонент        | Статус         | Готовность | Сервер   | Описание              |
|------------------|----------------|------------|----------|-----------------------|
| **PostgreSQL**   | 🟢 Работает    | 100%       | Сервер 2 | Основная база данных  |
| **Directus CMS** | 🟢 Работает    | 100%       | Сервер 2 | Headless CMS и API    |
| **PGAdmin**      | 🟢 Работает    | 100%       | Сервер 2 | Управление PostgreSQL |
| **Qdrant**       | 🟡 Планируется | 0%         | Сервер 2 | Векторный поиск       |
| **n8n**          | 🟡 Планируется | 0%         | Сервер 1 | Automation engine     |
| **Redis**        | 🟡 Планируется | 0%         | Сервер 1 | Кэширование и очереди |
| **Traefik**      | 🟢 Работает    | 100%       | Оба      | Reverse proxy + SSL   |
| **Portainer**    | 🟢 Работает    | 100%       | Оба      | Docker UI             |
| **Webmin**       | 🟢 Работает    | 100%       | Оба      | Системное управление  |
| **Dozzle**       | 🟢 Работает    | 100%       | Сервер 2 | Docker логи           |
| **Netdata**      | 🟡 Планируется | 0%         | Оба      | Real-time мониторинг  |
| **Grafana**      | 🟡 Планируется | 0%         | Сервер 1 | Дашборды метрик       |

**Легенда:**

-  🟢 **Работает** - Компонент развернут и функционирует

-  🟡 **Планируется** - В процессе разработки/настройки

-  🔴 **Проблемы** - Требует исправления

-  ⚫ **Отключен** - Временно недоступен

---

## 🏗️ Архитектура серверов

### Первый сервер (93.189.229.59) - Frontend & Automation Hub

```
🌐 tapbot.kz                 → Главная страница проекта
🤖 n8n.tapbot.kz            → n8n Workflow Automation  
🔗 api.tapbot.kz            → API Endpoints
🐳 docker1.tapbot.kz        → Portainer Docker UI
📊 monitor1.tapbot.kz       → Netdata мониторинг
📈 dash1.tapbot.kz          → Grafana дашборды
🛠️ webmin1.tapbot.kz:8441   → Webmin управление
🔍 logs1.tapbot.kz          → Dozzle логи
🗄️ redis1.tapbot.kz         → Redis Commander
```

### Второй сервер (178.236.17.186) - Database & Content Hub

```
📝 dir.tapbot.kz            → Directus Headless CMS ✅
🗄️ pg.tapbot.kz             → PGAdmin PostgreSQL ✅  
🔍 vector.tapbot.kz         → Qdrant Vector Search
🐳 portainer2.tapbot.kz     → Portainer Docker UI ✅
🛠️ webmin2.tapbot.kz:8442   → Webmin управление ✅
📊 traefik2.tapbot.kz       → Traefik Dashboard ✅
📋 logs2.tapbot.kz          → Dozzle логи ✅
📈 monitor2.tapbot.kz       → System monitoring ✅
🗄️ redis2.tapbot.kz         → Redis Commander
```

---

## 🔧 Быстрый старт для разработчиков

### Предварительные требования

-  Docker и Docker Compose

-  Git

-  SSH доступ к серверам

-  Базовые знания Linux/Ubuntu

### Локальная разработка

```bash
# Клонирование репозитория
git clone https://github.com/sutki24info/tapbot.kz.git
cd tapbot.kz

# Изучение документации
cd 02-infrastructure/
ls -la

# Проверка статуса сервисов
./scripts/check-services.sh
```

### Доступ к сервисам

-  **Документация:** [docs.tapbot.kz](https://docs.tapbot.kz)

-  **Directus CMS:** [dir.tapbot.kz](https://dir.tapbot.kz)

-  **PGAdmin:** [pg.tapbot.kz](https://pg.tapbot.kz)

-  **Портал мониторинга:** [traefik2.tapbot.kz](https://traefik2.tapbot.kz)

---

## 📚 Ключевые ресурсы

### Для новых участников команды

1. [**01\.02 - Команда и процессы**](01-project-foundation/01-02-team/README) - роли и обязанности

2. [**03\.01 - Архитектура системы**](./03-software-stack/03-01-architecture/README) - общий обзор

3. [**07\.03 - Чек-листы**](07-reference/07-03-checklists/README) - пошаговые инструкции

### Для системных администраторов

1. [**02\.01 - Серверы и железо**](./02-infrastructure/02-01-servers/README) - конфигурации

2. [**06\.01 - Стратегии защиты**](06-security/06-01-defense-strategy/README) - безопасность

3. [**05\.02 - Мониторинг**](05-operational-procedures/05-02-monitoring/README) - наблюдение

### Для разработчиков

1. [**03\.03 - Автоматизация и AI**](03-software-stack/03-03-automation/README) - n8n и AI

2. [**03\.02 - База данных**](03-software-stack/03-02-database/README) - PostgreSQL, Qdrant

3. [**07\.01 - Команды и скрипты**](07-reference/07-01-commands/README) - инструменты

---

## 📞 Контакты и поддержка

**Основатель проекта:** Кадырхан\
**Email:** sutki24info@gmail.com\
**Telegram:** @sutki24info

**Репозиторий:** https://github.com/sutki24info/tapbot.kz\
**Документация:** https://docs.tapbot.kz\
**Основной сайт:** https://tapbot.kz

---

## 🎯 Принципы развития

### Качество превыше скорости

-  Каждый компонент проходит тщательное тестирование

-  Безопасность встроена в каждый уровень архитектуры

-  Документация обновляется синхронно с кодом

### Масштабируемость с первого дня

-  Микросервисная архитектура готова к горизонтальному масштабированию

-  Контейнеризация обеспечивает портабельность

-  Мониторинг и логирование встроены изначально

### Команда и процессы

-  Четкое разделение ответственности

-  Автоматизация рутинных задач

-  Непрерывное обучение и развитие

---

*Последнее обновление: 15 июля 2025*