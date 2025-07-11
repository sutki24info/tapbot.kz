# 🤖 tapbot.kz - AI Automation Platform

**Автоматизация бизнес-процессов через AI-ботов**

[![Infrastructure](https://img.shields.io/badge/Infrastructure-2%20Servers-green)](02-infrastructure/)
[![Stack](https://img.shields.io/badge/Stack-n8n%20%7C%20PostgreSQL%20%7C%20Redis-blue)](03-software-stack/)
[![Security](https://img.shields.io/badge/Security-Enterprise%20Level-red)](05-security/)

## 📋 Навигация по проекту

### 01. 🏗️ [Основы проекта](01-project-foundation/)
Фундамент проекта: видение, команда, экономика
- **01.01** [Архитектурное видение](01-project-foundation/01-01-vision/) - Бизнес-контекст, требования, принципы
- **01.02** [Команда и роли](01-project-foundation/01-02-team/) - Структура, ответственность, процессы  
- **01.03** [Экономическая модель](01-project-foundation/01-03-economics/) - Бюджет, ROI, масштабирование

### 02. 🖥️ [Инфраструктура](02-infrastructure/)
Серверы, ресурсы, планы развития
- **02.01** [Серверная архитектура](02-infrastructure/02-01-servers/README.md) - Два сервера beget.com
- **02.02** [Ресурсы и производительность](02-infrastructure/02-02-resources/README.md) - CPU, память, мониторинг
- **02.03** [Экономика инфраструктуры](02-infrastructure/02-03-economics/README.md) - Затраты, планы upgrade
- **02.04** [Планы развития](02-infrastructure/02-04-development/README.md) - Краткосрочные и долгосрочные планы

### 03. ⚙️ [Программный стек](03-software-stack/)
Архитектура ПО, сервисы, интеграции
- **03.01** [Архитектурные принципы](03-software-stack/03-01-principles/) - Микросервисы, API-first, безопасность
- **03.02** [Первый сервер](03-software-stack/03-02-server1/) - n8n, Redis, Traefik
- **03.03** [Второй сервер](03-software-stack/03-03-server2/) - PostgreSQL, Directus, Qdrant  
- **03.04** [Интеграции](03-software-stack/03-04-integrations/) - API, workflow, обработка ошибок

### 04. 🌐 [Сетевая архитектура](04-network-architecture/)
DNS, порты, балансировка, мониторинг сети
- **04.01** [DNS и домены](04-network-architecture/04-01-domains/) - tapbot.kz, поддомены, SSL
- **04.02** [Порты и сервисы](04-network-architecture/04-02-ports/) - Справочник портов, безопасность
- **04.03** [Балансировка нагрузки](04-network-architecture/04-03-loadbalancing/) - Traefik, upstream
- **04.04** [Мониторинг сети](04-network-architecture/04-04-monitoring/) - Алерты, логи, метрики

### 05. 🛡️ [Безопасность](05-security/)
Принципы, серверы, приложения, мониторинг
- **05.01** [Принципы безопасности](05-security/05-01-principles/) - Security by design, модель угроз
- **05.02** [Безопасность серверов](05-security/05-02-server-security/) - Linux hardening, UFW, fail2ban
- **05.03** [Безопасность приложений](05-security/05-03-application-security/) - API, БД, секреты
- **05.04** [Мониторинг безопасности](05-security/05-04-monitoring/) - IDS, аудит, incident response

### 06. 🔧 [Операции](06-operations/)
Backup, развертывание, мониторинг, обслуживание
- **06.01** [Резервное копирование](06-operations/06-01-backup/) - Стратегия, процедуры, автоматизация
- **06.02** [Развертывание](06-operations/06-02-deployment/) - CI/CD, rollback, окружения
- **06.03** [Мониторинг](06-operations/06-03-monitoring/) - Система, приложения, алерты
- **06.04** [Техобслуживание](06-operations/06-04-maintenance/) - Плановое обслуживание, обновления

### 07. 💻 [Разработка](07-development/)
Workflows, AI, API, инструменты
- **07.01** [n8n Workflows](07-development/07-01-workflows/) - Проектирование, практики, тестирование
- **07.02** [AI интеграции](07-development/07-02-ai-integration/) - OpenAI, prompt engineering, векторы
- **07.03** [Разработка API](07-development/07-03-api-development/) - Design, документирование, тестирование  
- **07.04** [Инструменты](07-development/07-04-tools/) - Dev tools, отладка, утилиты

### 08. 📈 [Планирование](08-planning/)
Roadmap, история, риски, масштабирование
- **08.01** [Roadmap проекта](08-planning/08-01-roadmap/) - Завершенные этапы, текущие задачи
- **08.02** [История проекта](08-planning/08-02-history/) - Генезис, вехи, принятые решения
- **08.03** [Управление рисками](08-planning/08-03-risk-management/) - Технические, экономические, операционные риски
- **08.04** [Масштабирование](08-planning/08-04-scaling/) - Вертикальное, горизонтальное, enterprise

## 🚀 Быстрый старт

### Для новых участников команды:
1. **📚 Изучи основы:** [01-project-foundation](01-project-foundation/) - понимание проекта и команды
2. **🏗️ Изучи архитектуру:** [02-infrastructure](02-infrastructure/) + [03-software-stack](03-software-stack/)  
3. **🛡️ Настрой безопасность:** [05-security](05-security/) - критично для продакшна
4. **🔧 Запусти операции:** [06-operations](06-operations/) - backup, мониторинг, развертывание

## 📊 Текущий статус проекта

| Компонент | Статус | Прогресс | Описание |
|-----------|--------|----------|----------|
| **Серверы** | ✅ Готово | 100% | 2 сервера на beget.com настроены |
| **Backup система** | ✅ Готово | 100% | Автоматические backup развернуты |
| **n8n Stack** | 🔄 В работе | 75% | Развертывание на первом сервере |
| **PostgreSQL Stack** | 🔄 В работе | 60% | Развертывание на втором сервере |
| **Безопасность** | ✅ Базовая | 80% | UFW, fail2ban, SSL настроены |
| **AI интеграции** | ⏳ Планируется | 10% | После основной инфраструктуры |
| **Документация** | 🔄 Активно | 70% | Переход на новую структуру |
| **Команда** | 🔄 Формирование | 30% | Поиск студентов-помощников |

## 👥 Команда

- **Кадырхан** - CTO/Архитектор проекта (ведущий)
- **Студенты-помощники** - DevOps/Development (планируется набор)

## 📞 Контакты и ресурсы

- **🌐 Основной сайт:** [tapbot.kz](https://tapbot.kz)
- **📚 Документация:** [docs.tapbot.kz](https://docs.tapbot.kz) (через Gramax)
- **💻 GitHub:** [github.com/sutki24info/tapbot.kz](https://github.com/sutki24info/tapbot.kz)

---

**Последнее обновление:** 6 июля 2025  
**Версия структуры:** 1.0 (с enterprise нумерацией)  
**Статус:** 🚀 Активная разработка
