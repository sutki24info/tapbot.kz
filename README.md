---
title: 🤖 tapbot.kz - AI Automation Platform
---

**Автоматизация бизнес-процессов через AI-ботов**

**Последнее обновление:** 6 июля 2025\
**Версия структуры:** 1\.0 (с enterprise нумерацией)\
**Статус:** 🚀 Активная разработка

[![](<https://img.shields.io/badge/Infrastructure-2 Servers-green>)](./02-infrastructure/_index) [![](<https://img.shields.io/badge/Stack-n8n | PostgreSQL | Redis-blue>)](./03-software-stack/_index) [![](<https://img.shields.io/badge/Security-Enterprise Level-red>)](./05-security/_index)

## 📋 Навигация по проекту

### 01\. 🏗️ [Основы проекта](./01-project-foundation/_index)

Фундамент проекта: видение, команда, экономика

-  **01\.01** [Архитектурное видение](01-project-foundation/01-01-vision/) - Бизнес-контекст, требования, принципы

-  **01\.02** [Команда и роли](01-project-foundation/01-02-team/) - Структура, ответственность, процессы

-  **01\.03** [Экономическая модель](01-project-foundation/01-03-economics/) - Бюджет, ROI, масштабирование

### 02\. 🖥️ [Инфраструктура](./02-infrastructure/_index)

Серверы, ресурсы, планы развития

-  **02\.01** [Серверная архитектура](./02-infrastructure/02-01-servers/README) - Два сервера beget.com

-  **02\.02** [Ресурсы и производительность](./02-infrastructure/02-02-resources/README) - CPU, память, мониторинг

-  **02\.03** [Экономика инфраструктуры](./02-infrastructure/02-03-economics/README) - Затраты, планы upgrade

-  **02\.04** [Планы развития](./02-infrastructure/02-04-development/README) - Краткосрочные и долгосрочные планы

### 03\. ⚙️ [Программный стек](./03-software-stack/_index)

Архитектура ПО, сервисы, интеграции

-  **03\.01** [Архитектурные принципы](03-software-stack/03-01-principles/) - Микросервисы, API-first, безопасность

-  **03\.02** [Первый сервер](03-software-stack/03-02-server1/) - n8n, Redis, Traefik

-  **03\.03** [Второй сервер](03-software-stack/03-03-server2/) - PostgreSQL, Directus, Qdrant

-  **03\.04** [Интеграции](03-software-stack/03-04-integrations/) - API, workflow, обработка ошибок

### 04\. 🌐 [Сетевая архитектура](./04-network-architecture/_index)

DNS, порты, балансировка, мониторинг сети

-  **04\.01** [DNS и домены](./04-network-architecture/04-01-domains/_index) - tapbot.kz, поддомены, SSL

-  **04\.02** [Порты и сервисы](./04-network-architecture/04-02-ports/_index) - Справочник портов, безопасность

-  **04\.03** [Балансировка нагрузки](04-network-architecture/04-03-loadbalancing/) - Traefik, upstream

-  **04\.04** [Мониторинг сети](04-network-architecture/04-04-monitoring/) - Алерты, логи, метрики

### 05\. 🛡️ [Безопасность](./05-security/_index)

Принципы, серверы, приложения, мониторинг

-  **05\.01** [Принципы безопасности](05-security/05-01-principles/) - Security by design, модель угроз

-  **05\.02** [Безопасность серверов](./05-security/05-02-server-security/_index) - Linux hardening, UFW, fail2ban

-  **05\.03** [Безопасность приложений](05-security/05-03-application-security/) - API, БД, секреты

-  **05\.04** [Мониторинг безопасности](05-security/05-04-monitoring/) - IDS, аудит, incident response

### 06\. 🔧 [Операции](./06-operations/_index)

Backup, развертывание, мониторинг, обслуживание

-  **06\.01** [Резервное копирование](./06-operations/06-01-backup/_index) - Стратегия, процедуры, автоматизация

-  **06\.02** [Развертывание](./06-operations/06-02-deployment/_index) - CI/CD, rollback, окружения

-  **06\.03** [Мониторинг](./06-operations/06-03-monitoring/_index) - Система, приложения, алерты

-  **06\.04** [Техобслуживание](06-operations/06-04-maintenance/) - Плановое обслуживание, обновления

### 07\. 💻 [Разработка](./07-development/_index)

Workflows, AI, API, инструменты

-  **07\.01** [n8n Workflows](./07-development/07-01-workflows/_index) - Проектирование, практики, тестирование

-  **07\.02** [AI интеграции](./07-development/07-02-ai-integration/_index) - OpenAI, prompt engineering, векторы

-  **07\.03** [Разработка API](07-development/07-03-api-development/) - Design, документирование, тестирование

-  **07\.04** [Инструменты](07-development/07-04-tools/) - Dev tools, отладка, утилиты

### 08\. 📈 [Планирование](./08-planning/_index)

Roadmap, история, риски, масштабирование

-  **08\.01** [Roadmap проекта](./08-planning/08-01-roadmap/_index) - Завершенные этапы, текущие задачи

-  **08\.02** [История проекта](08-planning/08-02-history/) - Генезис, вехи, принятые решения

-  **08\.03** [Управление рисками](08-planning/08-03-risk-management/) - Технические, экономические, операционные риски

-  **08\.04** [Масштабирование](./08-planning/08-04-scaling/_index) - Вертикальное, горизонтальное, enterprise

<details>

<summary>

Нажмите, чтобы развернуть: Детали проекта

</summary>

### Введение

Это пример сворачиваемого раздела в файле README.md. Вы можете разместить здесь любой контент в формате Markdown.

-  Списки
-  **Форматирование**
-  `Код`

> Блоки цитат и многое другое.

</details>

<details>

<summary>

Нажмите, чтобы развернуть: Инструкции по установке

</summary>

1. Клонируйте репозиторий: `git clone ...`
2. Установите зависимости: `npm install`
3. Запустите проект: `npm start`

</details>

<details>

<summary>

Нажмите, чтобы развернуть: Вложенная структура

</summary>

Вы также можете создавать вложенные сворачиваемые блоки.

<details>

<summary>

Уровень 2

</summary>

А здесь контент второго уровня.

<details>

<summary>

Уровень 3

</summary>

И даже третьего.

</details>

</details>

</details>




## 🚀 Быстрый старт

### Для новых участников команды:

1. **📚 Изучи основы:** [01-project-foundation](./01-project-foundation/_index) - понимание проекта и команды

2. **🏗️ Изучи архитектуру:** [02-infrastructure](./02-infrastructure/_index) + [03-software-stack](./03-software-stack/_index)

3. **🛡️ Настрой безопасность:** [05-security](./05-security/_index) - критично для продакшна

4. **🔧 Запусти операции:** [06-operations](./06-operations/_index) - backup, мониторинг, развертывание

## 📊 Текущий статус проекта

| Компонент            | Статус          | Прогресс | Описание                         |
|----------------------|-----------------|----------|----------------------------------|
| **Серверы**          | ✅ Готово        | 100%     | 2 сервера на beget.com настроены |
| **Backup система**   | ✅ Готово        | 100%     | Автоматические backup развернуты |
| **n8n Stack**        | 🔄 В работе     | 75%      | Развертывание на первом сервере  |
| **PostgreSQL Stack** | 🔄 В работе     | 60%      | Развертывание на втором сервере  |
| **Безопасность**     | ✅ Базовая       | 80%      | UFW, fail2ban, SSL настроены     |
| **AI интеграции**    | ⏳ Планируется   | 10%      | После основной инфраструктуры    |
| **Документация**     | 🔄 Активно      | 70%      | Переход на новую структуру       |
| **Команда**          | 🔄 Формирование | 30%      | Поиск студентов-помощников       |

## 👥 Команда

-  **Кадырхан** - CTO/Архитектор проекта (ведущий)

-  **Студенты-помощники** - DevOps/Development (планируется набор)

## 📞 Контакты и ресурсы

-  **🌐 Основной сайт:** [tapbot.kz](https://tapbot.kz)

-  **📚 Документация:** [docs.tapbot.kz](https://docs.tapbot.kz) (через Gramax)

-  **💻 GitHub:** [github.com/sutki24info/tapbot.kz](https://github.com/sutki24info/tapbot.kz)

---
