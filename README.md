---
title: 🤖 tapbot.kz - AI Business Automation Platform
---

:::quote 

Платформа автоматизации бизнес-процессов через Telegram-ботов с искусственным интеллектом

:::

[![](<https://img.shields.io/badge/Status-Active Development-green>)](https://github.com/sutki24info/tapbot.kz) [![](https://img.shields.io/badge/License-Private-red)](https://github.com/sutki24info/tapbot.kz) [![](<https://img.shields.io/badge/Infrastructure-2 Servers-blue>)](https://github.com/sutki24info/tapbot.kz)

## 🎯 О проекте

**tapbot.kz** - это платформа для автоматизации бизнес-процессов в Казахстане через AI-ботов в Telegram.

### 🚀 Основные направления:

-  **🚗 Междугороднее такси** между городами Казахстана

-  **🏠 Аренда суточных квартир** с AI-помощником

-  **📊 Автоматизация бизнес-процессов** для малого и среднего бизнеса

---

## 🏗️ Архитектура инфраструктуры

### 🖥️ Сервер 1 - Frontend & Automation Hub

**IP:** `93.189.229.59` | **Роль:** Обработка запросов и автоматизация

```
┌─────────────────────────────────────┐
│           Первый сервер             │
├─────────────────────────────────────┤
│ 🔧 n8n           - Автоматизация    │
│ 🔄 Redis         - Кэширование      │
│ 🌐 Traefik       - Reverse Proxy    │
│ 🐳 Portainer     - Docker UI        │
│ 📊 Monitoring    - Метрики          │
└─────────────────────────────────────┘
```

### 🖥️ Сервер 2 - Database & Content Hub

**IP:** `178.236.17.186` | **Роль:** Хранение данных и контент

```
┌─────────────────────────────────────┐
│           Второй сервер             │
├─────────────────────────────────────┤
│ 🗄️ PostgreSQL    - База данных      │
│ 📝 Directus       - Headless CMS    │
│ 🔍 Qdrant         - Векторный поиск │
│ 🛠️ PGAdmin        - DB управление   │
│ 🔐 Vaultwarden    - Пароли          │
└─────────────────────────────────────┘
```

---

## 📁 Структура репозитория

```
tapbot.kz/
├── 📚 docs/                    # Документация для команды
│   ├── 01-architecture/        # Архитектурные решения
│   ├── 02-installation/        # Руководства установки
│   ├── 03-operations/          # Операционные процедуры
│   ├── 04-troubleshooting/     # Решение проблем
│   └── 05-reference/           # Справочная информация
│
├── 🔧 infrastructure/          # Конфигурации серверов
│   ├── server1/                # Первый сервер (n8n stack)
│   ├── server2/                # Второй сервер (directus stack)
│   └── shared/                 # Общие конфигурации
│
├── 🤖 scripts/                 # Автоматизация и скрипты
│   ├── production/             # Продакшн скрипты (ежедневные)
│   ├── deployment/             # Деплой скрипты
│   ├── maintenance/            # Обслуживание
│   └── historical/             # Исторические (одноразовые)
│
├── 🔐 secrets/                 # Шаблоны секретов
│   ├── server1/                # Шаблоны для первого сервера
│   └── server2/                # Шаблоны для второго сервера
│
├── 🐳 containers/              # Описания контейнеров
│   ├── custom-builds/          # Кастомные Docker образы
│   └── official-images/        # Описания официальных образов
│
└── 🛠️ tools/                   # Вспомогательные инструменты
    ├── validation/             # Скрипты валидации
    ├── monitoring/             # Инструменты мониторинга
    └── development/            # Инструменты разработки
```

---

## 📊 Статус компонентов

| 🔧 Компонент       | 🖥️ Сервер | 📈 Статус      | 🌐 Домен               | 📚 Документация                        |
|--------------------|------------|----------------|------------------------|----------------------------------------|
| **PostgreSQL**     | Сервер 2   | ✅ Активен      | `pg.tapbot.kz`         | [Установка](docs/02-installation/)     |
| **Directus CMS**   | Сервер 2   | ✅ Активен      | `dir.tapbot.kz`        | [Руководство](docs/02-installation/)   |
| **PGAdmin**        | Сервер 2   | ✅ Активен      | `pg.tapbot.kz`         | [Настройка](docs/03-operations/)       |
| **Portainer**      | Сервер 2   | ✅ Активен      | `portainer2.tapbot.kz` | [Docker UI](docs/05-reference/)        |
| **Traefik**        | Сервер 2   | ✅ Активен      | `traefik2.tapbot.kz`   | [Reverse Proxy](docs/01-architecture/) |
| **n8n Automation** | Сервер 1   | 🟡 Планируется | `n8n.tapbot.kz`        | [Планы](docs/02-installation/)         |
| **Redis Cache**    | Сервер 1   | 🟡 Планируется | `redis1.tapbot.kz`     | [Кэширование](docs/02-installation/)   |
| **Qdrant Vector**  | Сервер 2   | 🟡 Планируется | `vector.tapbot.kz`     | [AI Search](docs/02-installation/)     |
| **Vaultwarden**    | Сервер 2   | 🟡 Планируется | `vault.tapbot.kz`      | [Пароли](docs/03-operations/)          |

---

## 🚀 Быстрый старт

### 📋 Для DevOps инженеров:

1. **Клонирование репозитория:**

   ```bash
   git clone https://github.com/sutki24info/tapbot.kz.git
   cd tapbot.kz
   ```

2. **Изучение архитектуры:**

   -  [📖 Обзор системы](docs/01-architecture/001-overview)

   -  [🏗️ Роли серверов](docs/01-architecture/002-servers-roles)

3. **Установка компонентов:**

   -  [🖥️ Первый сервер](docs/02-installation/001-server1-n8n-stack)

   -  [🗄️ Второй сервер](docs/02-installation/002-server2-directus-stack)

### 📋 Для команды разработки:

-  **📚 Документация:** [docs.tapbot.kz](https://docs.tapbot.kz) *(планируется)*

-  **🔧 API документация:** [api.tapbot.kz/docs](https://api.tapbot.kz/docs) *(планируется)*

-  **📊 Мониторинг:** [monitor.tapbot.kz](https://monitor.tapbot.kz) *(планируется)*

---

## 🔐 Безопасность

:::quote 

**⚠️ ВАЖНО:** Этот репозиторий содержит только **шаблоны конфигураций** и **публичную документацию**.

:::

### 🛡️ Что НЕ хранится в Git:

-  ❌ Реальные пароли и API ключи

-  ❌ SSL сертификаты

-  ❌ Backup файлы с данными

-  ❌ .env файлы с секретами

### ✅ Где хранятся секреты:

-  🔐 **Vaultwarden** - менеджер паролей (планируется)

-  🔒 **Сервера** - локальные .env файлы

-  🗝️ **Encrypted backups** - зашифрованные резервные копии

---

## 🛠️ Технологический стек

### 🖥️ Backend & Infrastructure:

![Docker](https://img.shields.io/badge/Docker-2496ED?style=flat&logo=docker&logoColor=white)

### 🔧 Automation & Tools:

![n8n](https://img.shields.io/badge/n8n-EA4B71?style=flat&logo=n8n&logoColor=white)

### 🤖 AI & ML:

![OpenAI](https://img.shields.io/badge/OpenAI-412991?style=flat&logo=openai&logoColor=white)

---

## 📈 Roadmap проекта

### 🎯 Q3 2025 - Foundation

* [x] **Второй сервер** - PostgreSQL + Directus ✅

* [x] **Базовая безопасность** - UFW + fail2ban ✅

* [x] **SSL сертификаты** - Let's Encrypt ✅

* [ ] **Первый сервер** - n8n + Redis 🔄

* [ ] **Vaultwarden** - Управление паролями 🔄

### 🎯 Q4 2025 - AI Integration

* [ ] **Qdrant** - Векторный поиск

* [ ] **AI workflows** - Первые боты

* [ ] **Telegram интеграция** - MVP

* [ ] **Мониторинг** - Grafana + Prometheus

### 🎯 Q1 2026 - Business Launch

* [ ] **Такси бот** - Междугороднее такси

* [ ] **Квартиры бот** - Аренда жилья

* [ ] **Платежи** - Интеграция с банками

* [ ] **Масштабирование** - Больше серверов

---

## 👥 Команда

| Роль                         | Имя      | Контакт               | Ответственность         |
|------------------------------|----------|-----------------------|-------------------------|
| **🏗️ CTO & Founder**        | Кадырхан | sutki24info@gmail.com | Архитектура, стратегия  |
| **🤖 AI Expert**             | Кадырхан | \-                    | DevOps, автоматизация   |
| **👨‍💻 Студенты-помощники** | \-       | \-                    | Тестирование, поддержка |

---

## 📞 Контакты и поддержка

### 📧 Основные контакты:

-  **Email:** kadyrkhan@gmail.com

-  **Telegram:** @KadyrkhanUtin

-  **GitHub Issues:** [Создать issue](https://github.com/sutki24info/tapbot.kz/issues)

### 🌐 Полезные ссылки:

-  **🖥️ Сервер 1 Dashboard:** https://n8n.tapbot.kz *(планируется)*

-  **🗄️ Сервер 2 Dashboard:** https://dir.tapbot.kz

-  **📚 Документация:** https://docs.tapbot.kz *(планируется)*

-  **📊 Мониторинг:** https://monitor.tapbot.kz *(планируется)*

---

## 📄 Лицензия

**Private Repository** - Все права защищены © 2025 tapbot.kz

:::quote 

Этот проект является коммерческой разработкой. Использование кода и документации возможно только с письменного разрешения владельца.

:::

---

## 🔄 История изменений

| Дата        | Версия | Изменения                              | Автор    |
|-------------|--------|----------------------------------------|----------|
| 04\.07.2025 | v1.0   | Создание базовой структуры репозитория | Кадырхан |
| 03\.07.2025 | v0.9   | Завершение настройки второго сервера   | Кадырхан |
| 01\.07.2025 | v0.8   | Настройка Directus + PostgreSQL        | Кадырхан |

---

**🚀 Сделано с ❤️ в Казахстане для автоматизации бизнеса**

![Visitors](https://visitor-badge.laobi.icu/badge?page_id=sutki24info.tapbot.kz)