# 🤖 tapbot.kz - Автоматизация бизнес-процессов через AI-ботов

**Статус проекта:** 🚧 Активная разработка  
**Инфраструктура:** 🟢 100% готова (2 сервера, 6 веб-интерфейсов)  
**Документация:** 🟢 Система Claude.ai + GitHub синхронизирована  

## 🎯 Обзор проекта

tapbot.kz - стартап-платформа для автоматизации бизнес-процессов через Telegram-ботов с искусственным интеллектом. Основные направления: междугороднее такси между городами Казахстана и сервис аренды суточных квартир.

### 🏗️ Архитектурные принципы
- **Разделение ответственности:** автоматизация отделена от баз данных
- **Веб-интерфейсы везде:** команда состоит из новичков  
- **Безопасность в глубину:** многоуровневая защита
- **Готовность к масштабированию:** контейнеризация и микросервисы
- **Экономия ресурсов:** стартап-бюджет требует оптимизации

---

## 📁 Структура документации

### 01. Основы проекта

#### 01.01 - Видение и стратегия
- [**01.01.01** - Бизнес-контекст и цели](docs/01-project-foundation/01-01-vision/README.md#010101---бизнес-контекст-и-цели)
- [**01.01.02** - Ключевые требования](docs/01-project-foundation/01-01-vision/README.md#010102---ключевые-требования)
- [**01.01.03** - Принципы проектирования](docs/01-project-foundation/01-01-vision/README.md#010103---принципы-проектирования)
- [**01.01.04** - Критерии успеха](docs/01-project-foundation/01-01-vision/README.md#010104---критерии-успеха)

#### 01.02 - Команда и процессы
- [**01.02.01** - Структура команды](docs/01-project-foundation/01-02-team/README.md#010201---структура-команды)
- [**01.02.02** - Зоны ответственности](docs/01-project-foundation/01-02-team/README.md#010202---зоны-ответственности)
- [**01.02.03** - Процессы принятия решений](docs/01-project-foundation/01-02-team/README.md#010203---процессы-принятия-решений)
- [**01.02.04** - Делегирование полномочий](docs/01-project-foundation/01-02-team/README.md#010204---делегирование-полномочий)

#### 01.03 - Экономика проекта
- [**01.03.01** - Бюджет и затраты](docs/01-project-foundation/01-03-economics/README.md#010301---бюджет-и-затраты)
- [**01.03.02** - ROI и окупаемость](docs/01-project-foundation/01-03-economics/README.md#010302---roi-и-окупаемость)
- [**01.03.03** - Планы масштабирования](docs/01-project-foundation/01-03-economics/README.md#010303---планы-масштабирования)
- [**01.03.04** - Финансовые риски](docs/01-project-foundation/01-03-economics/README.md#010304---финансовые-риски)

### 02. 🏗️ Инфраструктура

#### 02.01 - Серверы и железо
- [**02.01.01** - Первый сервер (Frontend & Automation)](docs/02-infrastructure/02-01-servers/README.md#020101---первый-сервер-frontend--automation)
- [**02.01.02** - Второй сервер (Database & Content)](docs/02-infrastructure/02-01-servers/README.md#020102---второй-сервер-database--content)
- [**02.01.03** - Провайдер beget.com](docs/02-infrastructure/02-01-servers/README.md#020103---провайдер-begetcom)
- [**02.01.04** - Сетевая топология](docs/02-infrastructure/02-01-servers/README.md#020104---сетевая-топология)

#### 02.02 - Ресурсы и производительность
- [**02.02.01** - CPU и вычислительная мощность](docs/02-infrastructure/02-02-resources/README.md#020201---cpu-и-вычислительная-мощность)
- [**02.02.02** - Память и хранилище](docs/02-infrastructure/02-02-resources/README.md#020202---память-и-хранилище)
- [**02.02.03** - Оптимизация ресурсов](docs/02-infrastructure/02-02-resources/README.md#020203---оптимизация-ресурсов)
- [**02.02.04** - Мониторинг нагрузки](docs/02-infrastructure/02-02-resources/README.md#020204---мониторинг-нагрузки)

#### 02.03 - Стоимость и экономика
- [**02.03.01** - Тарифные планы](docs/02-infrastructure/02-03-cost/README.md#020301---тарифные-планы)
- [**02.03.02** - Сравнение провайдеров](docs/02-infrastructure/02-03-cost/README.md#020302---сравнение-провайдеров)
- [**02.03.03** - Планы оптимизации затрат](docs/02-infrastructure/02-03-cost/README.md#020303---планы-оптимизации-затрат)
- [**02.03.04** - ROI инфраструктуры](docs/02-infrastructure/02-03-cost/README.md#020304---roi-инфраструктуры)

### 03. ⚙️ Программный стек

#### 03.01 - Архитектура системы
- [**03.01.01** - Микросервисная архитектура](docs/03-software-stack/03-01-architecture/README.md#030101---микросервисная-архитектура)
- [**03.01.02** - Контейнеризация Docker](docs/03-software-stack/03-01-architecture/README.md#030102---контейнеризация-docker)
- [**03.01.03** - Reverse Proxy и Load Balancing](docs/03-software-stack/03-01-architecture/README.md#030103---reverse-proxy-и-load-balancing)
- [**03.01.04** - Принципы масштабирования](docs/03-software-stack/03-01-architecture/README.md#030104---принципы-масштабирования)

#### 03.02 - База данных
- [**03.02.01** - PostgreSQL (реляционные данные)](docs/03-software-stack/03-02-database/README.md#030201---postgresql-реляционные-данные)
- [**03.02.02** - Qdrant (векторный поиск)](docs/03-software-stack/03-02-database/README.md#030202---qdrant-векторный-поиск)
- [**03.02.03** - Redis (кэширование и очереди)](docs/03-software-stack/03-02-database/README.md#030203---redis-кэширование-и-очереди)
- [**03.02.04** - Стратегии резервного копирования](docs/03-software-stack/03-02-database/README.md#030204---стратегии-резервного-копирования)

#### 03.03 - Автоматизация и AI
- [**03.03.01** - n8n Workflow Engine](docs/03-software-stack/03-03-automation/README.md#030301---n8n-workflow-engine)
- [**03.03.02** - Интеграция с AI модели](docs/03-software-stack/03-03-automation/README.md#030302---интеграция-с-ai-модели)
- [**03.03.03** - Telegram Bot API](docs/03-software-stack/03-03-automation/README.md#030303---telegram-bot-api)
- [**03.03.04** - Webhook обработка](docs/03-software-stack/03-03-automation/README.md#030304---webhook-обработка)

#### 03.04 - Интерфейсы управления
- [**03.04.01** - Directus CMS](docs/03-software-stack/03-04-interfaces/README.md#030401---directus-cms)
- [**03.04.02** - PGAdmin для PostgreSQL](docs/03-software-stack/03-04-interfaces/README.md#030402---pgadmin-для-postgresql)
- [**03.04.03** - Portainer для Docker](docs/03-software-stack/03-04-interfaces/README.md#030403---portainer-для-docker)
- [**03.04.04** - Webmin системное управление](docs/03-software-stack/03-04-interfaces/README.md#030404---webmin-системное-управление)

### 04. 🌐 Сетевая архитектура

#### 04.01 - Доменная структура
- [**04.01.01** - Основной домен tapbot.kz](docs/04-network-architecture/04-01-domains/README.md#040101---основной-домен-tapbotkz)
- [**04.01.02** - Поддомены первого сервера](docs/04-network-architecture/04-01-domains/README.md#040102---поддомены-первого-сервера)
- [**04.01.03** - Поддомены второго сервера](docs/04-network-architecture/04-01-domains/README.md#040103---поддомены-второго-сервера)
- [**04.01.04** - DNS управление через ps.kz](docs/04-network-architecture/04-01-domains/README.md#040104---dns-управление-через-pskz)

#### 04.02 - SSL и безопасность
- [**04.02.01** - Let's Encrypt автоматизация](docs/04-network-architecture/04-02-ssl/README.md#040201---lets-encrypt-автоматизация)
- [**04.02.02** - Traefik SSL терминация](docs/04-network-architecture/04-02-ssl/README.md#040202---traefik-ssl-терминация)
- [**04.02.03** - Сертификаты и обновление](docs/04-network-architecture/04-02-ssl/README.md#040203---сертификаты-и-обновление)
- [**04.02.04** - Мониторинг SSL статуса](docs/04-network-architecture/04-02-ssl/README.md#040204---мониторинг-ssl-статуса)

#### 04.03 - Управление портами
- [**04.03.01** - Стандартные порты сервисов](docs/04-network-architecture/04-03-port-management/README.md#040301---стандартные-порты-сервисов)
- [**04.03.02** - Безопасные альтернативные порты](docs/04-network-architecture/04-03-port-management/README.md#040302---безопасные-альтернативные-порты)
- [**04.03.03** - Процедуры изменения портов](docs/04-network-architecture/04-03-port-management/README.md#040303---процедуры-изменения-портов)
- [**04.03.04** - Мониторинг портов и сервисов](docs/04-network-architecture/04-03-port-management/README.md#040304---мониторинг-портов-и-сервисов)

#### 04.04 - Firewall и сетевая защита
- [**04.04.01** - UFW конфигурация](docs/04-network-architecture/04-04-firewall/README.md#040401---ufw-конфигурация)
- [**04.04.02** - fail2ban защита от атак](docs/04-network-architecture/04-04-firewall/README.md#040402---fail2ban-защита-от-атак)
- [**04.04.03** - Сетевая сегментация](docs/04-network-architecture/04-04-firewall/README.md#040403---сетевая-сегментация)
- [**04.04.04** - Мониторинг угроз](docs/04-network-architecture/04-04-firewall/README.md#040404---мониторинг-угроз)

### 05. 🔧 Операционные процедуры

#### 05.01 - Развертывание и обновления
- [**05.01.01** - Docker Compose стратегия](docs/05-operational-procedures/05-01-deployment/README.md#050101---docker-compose-стратегия)
- [**05.01.02** - Процедуры обновления сервисов](docs/05-operational-procedures/05-01-deployment/README.md#050102---процедуры-обновления-сервисов)
- [**05.01.03** - Rollback стратегии](docs/05-operational-procedures/05-01-deployment/README.md#050103---rollback-стратегии)
- [**05.01.04** - Автоматизация развертывания](docs/05-operational-procedures/05-01-deployment/README.md#050104---автоматизация-развертывания)

#### 05.02 - Мониторинг и алерты
- [**05.02.01** - Netdata real-time мониторинг](docs/05-operational-procedures/05-02-monitoring/README.md#050201---netdata-real-time-мониторинг)
- [**05.02.02** - Grafana дашборды](docs/05-operational-procedures/05-02-monitoring/README.md#050202---grafana-дашборды)
- [**05.02.03** - Dozzle логи контейнеров](docs/05-operational-procedures/05-02-monitoring/README.md#050203---dozzle-логи-контейнеров)
- [**05.02.04** - Система уведомлений](docs/05-operational-procedures/05-02-monitoring/README.md#050204---система-уведомлений)

#### 05.03 - Резервное копирование
- [**05.03.01** - Стратегии backup PostgreSQL](docs/05-operational-procedures/05-03-backup/README.md#050301---стратегии-backup-postgresql)
- [**05.03.02** - Резервирование Docker volumes](docs/05-operational-procedures/05-03-backup/README.md#050302---резервирование-docker-volumes)
- [**05.03.03** - Автоматизация backup](docs/05-operational-procedures/05-03-backup/README.md#050303---автоматизация-backup)
- [**05.03.04** - Процедуры восстановления](docs/05-operational-procedures/05-03-backup/README.md#050304---процедуры-восстановления)

#### 05.04 - Аварийное восстановление
- [**05.04.01** - Планы disaster recovery](docs/05-operational-procedures/05-04-disaster-recovery/README.md#050401---планы-disaster-recovery)
- [**05.04.02** - Процедуры отказоустойчивости](docs/05-operational-procedures/05-04-disaster-recovery/README.md#050402---процедуры-отказоустойчивости)
- [**05.04.03** - Тестирование восстановления](docs/05-operational-procedures/05-04-disaster-recovery/README.md#050403---тестирование-восстановления)
- [**05.04.04** - Документация инцидентов](docs/05-operational-procedures/05-04-disaster-recovery/README.md#050404---документация-инцидентов)

### 06. 🛡️ Безопасность

#### 06.01 - Стратегии защиты
- [**06.01.01** - Многоуровневая безопасность](docs/06-security/06-01-defense-strategy/README.md#060101---многоуровневая-безопасность)
- [**06.01.02** - Принцип минимальных привилегий](docs/06-security/06-01-defense-strategy/README.md#060102---принцип-минимальных-привилегий)
- [**06.01.03** - Сетевая сегментация](docs/06-security/06-01-defense-strategy/README.md#060103---сетевая-сегментация)
- [**06.01.04** - Мониторинг безопасности](docs/06-security/06-01-defense-strategy/README.md#060104---мониторинг-безопасности)

#### 06.02 - Аутентификация и авторизация
- [**06.02.01** - BasicAuth для веб-интерфейсов](docs/06-security/06-02-authentication/README.md#060201---basicauth-для-веб-интерфейсов)
- [**06.02.02** - SSH ключи и доступ](docs/06-security/06-02-authentication/README.md#060202---ssh-ключи-и-доступ)
- [**06.02.03** - Управление паролями](docs/06-security/06-02-authentication/README.md#060203---управление-паролями)
- [**06.02.04** - Двухфакторная аутентификация](docs/06-security/06-02-authentication/README.md#060204---двухфакторная-аутентификация)

#### 06.03 - Сетевая защита
- [**06.03.01** - UFW правила firewall](docs/06-security/06-03-network-protection/README.md#060301---ufw-правила-firewall)
- [**06.03.02** - fail2ban против брутфорса](docs/06-security/06-03-network-protection/README.md#060302---fail2ban-против-брутфорса)
- [**06.03.03** - DDoS защита](docs/06-security/06-03-network-protection/README.md#060303---ddos-защита)
- [**06.03.04** - Мониторинг трафика](docs/06-security/06-03-network-protection/README.md#060304---мониторинг-трафика)

#### 06.04 - Безопасность контейнеров
- [**06.04.01** - Docker security best practices](docs/06-security/06-04-container-security/README.md#060401---docker-security-best-practices)
- [**06.04.02** - Изоляция сетей Docker](docs/06-security/06-04-container-security/README.md#060402---изоляция-сетей-docker)
- [**06.04.03** - Управление секретами](docs/06-security/06-04-container-security/README.md#060403---управление-секретами)
- [**06.04.04** - Сканирование уязвимостей](docs/06-security/06-04-container-security/README.md#060404---сканирование-уязвимостей)

#### 06.05 - Системное администрирование
- [**06.05.01** - Webmin управление системой](docs/06-security/06-05-system-administration/README.md#060501---webmin-управление-системой)
  - [**06.05.01.01** - Назначение и роль в проекте](docs/06-security/06-05-system-administration/README.md#06050101---назначение-и-роль-в-проекте)
  - [**06.05.01.02** - Конфигурация серверов](docs/06-security/06-05-system-administration/README.md#06050102---конфигурация-серверов)
  - [**06.05.01.03** - Специфичная защита Webmin](docs/06-security/06-05-system-administration/README.md#06050103---специфичная-защита-webmin)
  - [**06.05.01.04** - Интеграция с Docker окружением](docs/06-security/06-05-system-administration/README.md#06050104---интеграция-с-docker-окружением)
  - [**06.05.01.05** - Типичные сценарии использования](docs/06-security/06-05-system-administration/README.md#06050105---типичные-сценарии-использования)
- [**06.05.02** - Права доступа и sudo](docs/06-security/06-05-system-administration/README.md#060502---права-доступа-и-sudo)
- [**06.05.03** - Аудит системных изменений](docs/06-security/06-05-system-administration/README.md#060503---аудит-системных-изменений)
- [**06.05.04** - Процедуры безопасного обновления](docs/06-security/06-05-system-administration/README.md#060504---процедуры-безопасного-обновления)

### 07. 📖 Справочники

#### 07.01 - Команды и скрипты
- [**07.01.01** - Docker управление](docs/07-reference/07-01-commands/README.md#070101---docker-управление)
- [**07.01.02** - Системное администрирование](docs/07-reference/07-01-commands/README.md#070102---системное-администрирование)
- [**07.01.03** - Сетевая диагностика](docs/07-reference/07-01-commands/README.md#070103---сетевая-диагностика)
- [**07.01.04** - Автоматизированные скрипты](docs/07-reference/07-01-commands/README.md#070104---автоматизированные-скрипты)

#### 07.02 - Конфигурационные файлы
- [**07.02.01** - Docker Compose шаблоны](docs/07-reference/07-02-configurations/README.md#070201---docker-compose-шаблоны)
- [**07.02.02** - Traefik конфигурации](docs/07-reference/07-02-configurations/README.md#070202---traefik-конфигурации)
- [**07.02.03** - Системные конфигурации](docs/07-reference/07-02-configurations/README.md#070203---системные-конфигурации)
- [**07.02.04** - Шаблоны безопасности](docs/07-reference/07-02-configurations/README.md#070204---шаблоны-безопасности)

#### 07.03 - Чек-листы и процедуры
- [**07.03.01** - Развертывание нового сервиса](docs/07-reference/07-03-checklists/README.md#070301---развертывание-нового-сервиса)
- [**07.03.02** - Настройка безопасности](docs/07-reference/07-03-checklists/README.md#070302---настройка-безопасности)
- [**07.03.03** - Процедуры обновления](docs/07-reference/07-03-checklists/README.md#070303---процедуры-обновления)
- [**07.03.04** - Аварийное восстановление](docs/07-reference/07-03-checklists/README.md#070304---аварийное-восстановление)

#### 07.04 - Решение проблем
- [**07.04.01** - Частые ошибки Docker](docs/07-reference/07-04-troubleshooting/README.md#070401---частые-ошибки-docker)
- [**07.04.02** - Проблемы SSL и DNS](docs/07-reference/07-04-troubleshooting/README.md#070402---проблемы-ssl-и-dns)
- [**07.04.03** - Диагностика производительности](docs/07-reference/07-04-troubleshooting/README.md#070403---диагностика-производительности)
- [**07.04.04** - Проблемы безопасности](docs/07-reference/07-04-troubleshooting/README.md#070404---проблемы-безопасности)

### 08. 📈 Планирование

#### 08.01 - Roadmap развития
- [**08.01.01** - Краткосрочные планы (3 месяца)](docs/08-planning/08-01-roadmap/README.md#080101---краткосрочные-планы-3-месяца)
- [**08.01.02** - Среднесрочные планы (6-12 месяцев)](docs/08-planning/08-01-roadmap/README.md#080102---среднесрочные-планы-6-12-месяцев)
- [**08.01.03** - Долгосрочное видение (1-2 года)](docs/08-planning/08-01-roadmap/README.md#080103---долгосрочное-видение-1-2-года)
- [**08.01.04** - Метрики и KPI](docs/08-planning/08-01-roadmap/README.md#080104---метрики-и-kpi)

#### 08.02 - Миграция документации
- [**08.02.01** - План перехода на GitHub](docs/08-planning/08-02-documentation-migration/README.md#080201---план-перехода-на-github)
- [**08.02.02** - Статус миграции разделов](docs/08-planning/08-02-documentation-migration/README.md#080202---статус-миграции-разделов)
- [**08.02.03** - Валидация и контроль качества](docs/08-planning/08-02-documentation-migration/README.md#080203---валидация-и-контроль-качества)
- [**08.02.04** - Обучение команды](docs/08-planning/08-02-documentation-migration/README.md#080204---обучение-команды)

#### 08.03 - Масштабирование инфраструктуры
- [**08.03.01** - Планы расширения серверов](docs/08-planning/08-03-scaling/README.md#080301---планы-расширения-серверов)
- [**08.03.02** - Оптимизация производительности](docs/08-planning/08-03-scaling/README.md#080302---оптимизация-производительности)
- [**08.03.03** - Стратегии load balancing](docs/08-planning/08-03-scaling/README.md#080303---стратегии-load-balancing)
- [**08.03.04** - Планы миграции на Kubernetes](docs/08-planning/08-03-scaling/README.md#080304---планы-миграции-на-kubernetes)

#### 08.04 - Бизнес-развитие
- [**08.04.01** - Планы запуска MVP](docs/08-planning/08-04-business-development/README.md#080401---планы-запуска-mvp)
- [**08.04.02** - Стратегии привлечения пользователей](docs/08-planning/08-04-business-development/README.md#080402---стратегии-привлечения-пользователей)
- [**08.04.03** - Партнерские программы](docs/08-planning/08-04-business-development/README.md#080403---партнерские-программы)
- [**08.04.04** - Монетизация и бизнес-модель](docs/08-planning/08-04-business-development/README.md#080404---монетизация-и-бизнес-модель)

---

## 🚀 Статус компонентов

| Компонент | Статус | Готовность | Сервер | Описание |
|-----------|--------|------------|---------|----------|
| **PostgreSQL** | 🟢 Работает | 100% | Сервер 2 | Основная база данных |
| **Directus CMS** | 🟢 Работает | 100% | Сервер 2 | Headless CMS и API |
| **PGAdmin** | 🟢 Работает | 100% | Сервер 2 | Управление PostgreSQL |
| **Qdrant** | 🟡 Планируется | 0% | Сервер 2 | Векторный поиск |
| **n8n** | 🟡 Планируется | 0% | Сервер 1 | Automation engine |
| **Redis** | 🟡 Планируется | 0% | Сервер 1 | Кэширование и очереди |
| **Traefik** | 🟢 Работает | 100% | Оба | Reverse proxy + SSL |
| **Portainer** | 🟢 Работает | 100% | Оба | Docker UI |
| **Webmin** | 🟢 Работает | 100% | Оба | Системное управление |
| **Dozzle** | 🟢 Работает | 100% | Сервер 2 | Docker логи |
| **Netdata** | 🟡 Планируется | 0% | Оба | Real-time мониторинг |
| **Grafana** | 🟡 Планируется | 0% | Сервер 1 | Дашборды метрик |

**Легенда:**
- 🟢 **Работает** - Компонент развернут и функционирует
- 🟡 **Планируется** - В процессе разработки/настройки
- 🔴 **Проблемы** - Требует исправления
- ⚫ **Отключен** - Временно недоступен

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
- Docker и Docker Compose
- Git
- SSH доступ к серверам
- Базовые знания Linux/Ubuntu

### Локальная разработка
```bash
# Клонирование репозитория
git clone https://github.com/sutki24info/tapbot.kz.git
cd tapbot.kz

# Изучение документации
cd docs/
find . -name "README.md" | head -10

# Проверка статуса сервисов
./scripts/check-services.sh
```

### Доступ к сервисам
- **Документация:** [docs.tapbot.kz](https://docs.tapbot.kz)
- **Directus CMS:** [dir.tapbot.kz](https://dir.tapbot.kz)
- **PGAdmin:** [pg.tapbot.kz](https://pg.tapbot.kz)
- **Портал мониторинга:** [traefik2.tapbot.kz](https://traefik2.tapbot.kz)

---

## 📚 Ключевые ресурсы

### Для новых участников команды
1. [**01.02 - Команда и процессы**](docs/01-project-foundation/01-02-team/README.md) - роли и обязанности
2. [**03.01 - Архитектура системы**](docs/03-software-stack/03-01-architecture/README.md) - общий обзор
3. [**07.03 - Чек-листы**](docs/07-reference/07-03-checklists/README.md) - пошаговые инструкции

### Для системных администраторов  
1. [**02.01 - Серверы и железо**](docs/02-infrastructure/02-01-servers/README.md) - конфигурации
2. [**06.01 - Стратегии защиты**](docs/06-security/06-01-defense-strategy/README.md) - безопасность
3. [**05.02 - Мониторинг**](docs/05-operational-procedures/05-02-monitoring/README.md) - наблюдение

### Для разработчиков
1. [**03.03 - Автоматизация и AI**](docs/03-software-stack/03-03-automation/README.md) - n8n и AI
2. [**03.02 - База данных**](docs/03-software-stack/03-02-database/README.md) - PostgreSQL, Qdrant
3. [**07.01 - Команды и скрипты**](docs/07-reference/07-01-commands/README.md) - инструменты

---

## 📞 Контакты и поддержка

**Основатель проекта:** Кадырхан  
**Email:** sutki24info@gmail.com  
**Telegram:** @sutki24info  

**Репозиторий:** https://github.com/sutki24info/tapbot.kz  
**Документация:** https://docs.tapbot.kz  
**Основной сайт:** https://tapbot.kz  

---

## 📄 Лицензия и использование

Этот проект разрабатывается как коммерческая платформа. Все права защищены.

**Документация:** Доступна для участников команды и партнеров  
**Код:** Приватный репозиторий с ограниченным доступом  
**Инфраструктура:** Коммерческое использование

---

## 🎯 Принципы развития

### Качество превыше скорости
- Каждый компонент проходит тщательное тестирование
- Безопасность встроена в каждый уровень архитектуры
- Документация обновляется синхронно с кодом

### Масштабируемость с первого дня
- Микросервисная архитектура готова к горизонтальному масштабированию
- Контейнеризация обеспечивает портабельность
- Мониторинг и логирование встроены изначально

### Команда и процессы
- Четкое разделение ответственности
- Автоматизация рутинных задач
- Непрерывное обучение и развитие

---

*Последнее обновление: 15 июля 2025*
