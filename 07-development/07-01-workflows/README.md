---
title: 07.01 - Процессы разработки проекта tapbot.kz
---

**Версия:** 1\.0\
**Дата создания:** 16 июля 2025\
**Автор:** Команда tapbot.kz\
**Статус:** Активное руководство для команды разработки

## 07\.01.01 - Обзор процессов разработки

### 07\.01.01.01 - Архитектура разработки

Процессы разработки проекта tapbot.kz построены на принципах:

```
🔄 DevOps подход
├── Непрерывная интеграция (CI)
├── Непрерывное развертывание (CD)
├── Инфраструктура как код (IaC)
└── Мониторинг и обратная связь

🏗️ Этапы разработки
├── Локальная разработка
├── Тестирование изменений
├── Развертывание в staging
└── Продакшн развертывание
```

### 07\.01.01.02 - Основные принципы

-  **Безопасность с первого дня** - не откладывать защиту на потом

-  **Валидация YAML обязательна** - каждый docker-compose.yml проверяется

-  **Все веб-интерфейсы защищены** - BasicAuth или встроенная авторизация

-  **Человеческий контроль** - автоматизация не заменяет проверку

### 07\.01.01.03 - Технологический стек

**Основные компоненты:**

-  **Git** - система контроля версий

-  **Docker** - контейнеризация приложений

-  **Docker Compose** - оркестрация многоконтейнерных приложений

-  **GitHub Actions** - CI/CD пайплайны

-  **Traefik** - реверс-прокси и SSL терминация

### 07\.01.01.04 - Структура репозиториев

```
tapbot.kz/
├── infrastructure/           # Конфигурации серверов
│   ├── first-server/        # Первый сервер (93.189.229.59)
│   └── second-server/       # Второй сервер (195.49.210.94)
├── docs/                    # Документация проекта
├── scripts/                 # Автоматизация и утилиты
└── .github/                 # CI/CD конфигурации
    └── workflows/           # GitHub Actions
```

## 07\.01.02 - Workflow разработки

### 07\.01.02.01 - Локальная разработка

**Подготовка окружения:**

```bash
# Клонирование репозитория
git clone https://github.com/sutki24info/tapbot.kz.git
cd tapbot.kz

# Создание ветки для разработки
git checkout -b feature/новая-функциональность

# Настройка локального окружения
cp .env.example .env
# Редактирование .env файла с локальными настройками
```

**Процедура внесения изменений:**

1. Создание feature ветки от main

2. Разработка функциональности локально

3. Тестирование в локальной среде

4. Commit изменений с описательным сообщением

5. Push в удаленный репозиторий

6. Создание Pull Request

### 07\.01.02.02 - Соглашения о commit сообщениях

**Формат commit сообщений:**

```
type(scope): краткое описание

Подробное описание изменений (если необходимо)

Связанные issue: #123
```

**Типы изменений:**

-  `feat:` - новая функциональность

-  `fix:` - исправление багов

-  `docs:` - обновление документации

-  `style:` - форматирование кода

-  `refactor:` - рефакторинг без изменения функциональности

-  `test:` - добавление или изменение тестов

-  `chore:` - технические изменения (сборка, конфигурация)

**Примеры commit сообщений:**

```bash
feat(infrastructure): добавлен Redis кеш для второго сервера
fix(security): исправлена конфигурация fail2ban
docs(api): обновлена документация API эндпоинтов
chore(docker): обновлены версии базовых образов
```

### 07\.01.02.03 - Процесс code review

**Требования к Pull Request:**

-  Описательное название и описание изменений

-  Ссылки на связанные issue или задачи

-  Проверка всех automated checks

-  Одобрение от минимум одного reviewer

**Чеклист для reviewer:**

* [ ] Код соответствует стандартам проекта

* [ ] Изменения не нарушают безопасность

* [ ] Документация обновлена при необходимости

* [ ] Тесты добавлены или обновлены

* [ ] Конфигурации валидны и безопасны

### 07\.01.02.04 - Управление ветками

**Стратегия ветвления:**

```
main                 # Продакшн готовый код
├── develop          # Интеграционная ветка
├── feature/xxx      # Новая функциональность
├── hotfix/xxx       # Критические исправления
└── release/vX.Y.Z   # Подготовка к релизу
```

## 07\.01.03 - CI/CD пайплайны

### 07\.01.03.01 - Структура GitHub Actions

**Основные workflows:**

```yaml
.github/workflows/
├── ci.yml              # Основной CI пайплайн
├── security-scan.yml   # Сканирование безопасности
├── deploy-staging.yml  # Развертывание в staging
└── deploy-prod.yml     # Продакшн развертывание
```

### 07\.01.03.02 - CI пайплайн (Continuous Integration)

**Этапы CI пайплайна:**

```yaml
name: CI Pipeline

on:
  pull_request:
    branches: [ main, develop ]
  push:
    branches: [ main, develop ]

jobs:
  validate:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v4
      
      - name: Validate Docker Compose
        run: |
          find . -name "docker-compose*.yml" -exec docker-compose -f {} config \;
      
      - name: Security scan
        run: |
          # Сканирование конфигураций на уязвимости
          scripts/security-validate.sh
      
      - name: Lint documentation
        run: |
          # Проверка markdown документации
          markdownlint docs/
```

### 07\.01.03.03 - CD пайплайн (Continuous Deployment)

**Этапы развертывания:**

**Staging развертывание:**

```yaml
name: Deploy to Staging

on:
  push:
    branches: [ develop ]

jobs:
  deploy-staging:
    runs-on: ubuntu-latest
    environment: staging
    steps:
      - name: Deploy to staging server
        uses: appleboy/ssh-action@v0.1.8
        with:
          host: ${{ secrets.STAGING_HOST }}
          username: ${{ secrets.STAGING_USER }}
          key: ${{ secrets.STAGING_SSH_KEY }}
          script: |
            cd /opt/staging/tapbot.kz
            git pull origin develop
            docker-compose down
            docker-compose up -d
            docker-compose ps
```

**Production развертывание:**

```yaml
name: Deploy to Production

on:
  push:
    branches: [ main ]
    tags: [ 'v*' ]

jobs:
  deploy-prod:
    runs-on: ubuntu-latest
    environment: production
    steps:
      - name: Deploy to production
        # Аналогичные шаги с дополнительными проверками
```

### 07\.01.03.04 - Валидация конфигураций

**Обязательные проверки перед развертыванием:**

```bash
#!/bin/bash
# scripts/security-validate.sh

echo "🔍 Валидация безопасности конфигураций..."

# Проверка docker-compose файлов
for file in $(find . -name "docker-compose*.yml"); do
    echo "Проверка $file..."
    
    # Валидация YAML синтаксиса
    docker-compose -f "$file" config > /dev/null || exit 1
    
    # Проверка на небезопасные настройки
    if grep -q "privileged: true" "$file"; then
        echo "❌ ОШИБКА: Найден privileged режим в $file"
        exit 1
    fi
    
    # Проверка на открытые порты без авторизации
    if grep -q "ports:" "$file" && ! grep -q "traefik" "$file"; then
        echo "⚠️ ПРЕДУПРЕЖДЕНИЕ: Прямые порты без Traefik в $file"
    fi
done

echo "✅ Валидация пройдена успешно"
```

## 07\.01.04 - Среды разработки

### 07\.01.04.01 - Локальная среда

**Настройка локального окружения:**

```bash
# Создание локального .env файла
cat > .env.local << EOF
# Локальные настройки разработки
ENVIRONMENT=development
DEBUG=true
DATABASE_URL=postgresql://user:pass@localhost:5432/tapbot_dev
REDIS_URL=redis://localhost:6379
LOG_LEVEL=debug
EOF

# Запуск локальных сервисов
docker-compose -f docker-compose.local.yml up -d
```

**Особенности локальной разработки:**

-  Все сервисы доступны на localhost

-  Упрощенная аутентификация для разработки

-  Подробное логирование для отладки

-  Автоматическая перезагрузка при изменениях

### 07\.01.04.02 - Staging среда

**Назначение staging среды:**

-  Тестирование интеграций между сервисами

-  Валидация перед продакшн развертыванием

-  Демонстрация новой функциональности

-  Нагрузочное тестирование

**Конфигурация staging:**

```yaml
# docker-compose.staging.yml
version: '3.8'
services:
  app:
    image: tapbot/app:staging
    environment:
      - ENVIRONMENT=staging
      - DATABASE_URL=${STAGING_DATABASE_URL}
      - REDIS_URL=${STAGING_REDIS_URL}
    labels:
      - "traefik.enable=true"
      - "traefik.http.routers.app-staging.rule=Host(`staging.tapbot.kz`)"
      - "traefik.http.routers.app-staging.tls=true"
```

### 07\.01.04.03 - Production среда

**Характеристики production среды:**

-  Максимальная безопасность и стабильность

-  Мониторинг и алертинг в реальном времени

-  Автоматическое резервное копирование

-  Ограниченный доступ только для критических операций

**Процедуры production развертывания:**

```bash
# Предварительные проверки
./scripts/pre-deploy-checks.sh

# Создание backup
./scripts/backup-before-deploy.sh

# Развертывание с blue-green strategy
./scripts/deploy-blue-green.sh

# Верификация развертывания
./scripts/post-deploy-verification.sh
```

### 07\.01.04.04 - Управление конфигурациями

**Переменные окружения по средам:**

```bash
# .env.development
DEBUG=true
LOG_LEVEL=debug
RATE_LIMIT_ENABLED=false

# .env.staging  
DEBUG=false
LOG_LEVEL=info
RATE_LIMIT_ENABLED=true
MONITORING_ENABLED=true

# .env.production
DEBUG=false
LOG_LEVEL=warn
RATE_LIMIT_ENABLED=true
MONITORING_ENABLED=true
SECURITY_ENHANCED=true
```

## 07\.01.05 - Тестирование

### 07\.01.05.01 - Стратегия тестирования

**Пирамида тестирования:**

```
              /\
             /  \
            / E2E \
           /______\
          /        \
         / Integration \
        /______________\
       /                \
      /   Unit Tests      \
     /____________________\
```

**Типы тестов:**

-  **Unit тесты** - тестирование отдельных функций и модулей

-  **Integration тесты** - тестирование взаимодействия между компонентами

-  **E2E тесты** - тестирование пользовательских сценариев

-  **Security тесты** - проверка уязвимостей безопасности

### 07\.01.05.02 - Автоматизированное тестирование

**Конфигурация тестов:**

```yaml
# .github/workflows/tests.yml
name: Tests

on: [push, pull_request]

jobs:
  unit-tests:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Run unit tests
        run: |
          npm test
          pytest tests/unit/
  
  integration-tests:
    runs-on: ubuntu-latest
    services:
      postgres:
        image: postgres:15
        env:
          POSTGRES_PASSWORD: test
        options: >-
          --health-cmd pg_isready
          --health-interval 10s
          --health-timeout 5s
          --health-retries 5
    steps:
      - uses: actions/checkout@v4
      - name: Run integration tests
        run: pytest tests/integration/
  
  security-tests:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Run security scan
        run: |
          docker run --rm -v $(pwd):/src securecodewarrior/docker-security-scan
```

### 07\.01.05.03 - Ручное тестирование

**Чеклист для ручного тестирования:**

* [ ] Все эндпоинты отвечают корректно

* [ ] Авторизация и аутентификация работают

* [ ] Данные корректно сохраняются и загружаются

* [ ] UI отображается правильно на разных устройствах

* [ ] Производительность соответствует требованиям

### 07\.01.05.04 - Нагрузочное тестирование

**Инструменты и подходы:**

```bash
# Простое нагрузочное тестирование с Apache Bench
ab -n 1000 -c 10 https://api.tapbot.kz/health

# Более сложные сценарии с Artillery
artillery run load-test-config.yml

# Мониторинг во время нагрузочного тестирования
docker stats
htop
```

## 07\.01.06 - Управление релизами

### 07\.01.06.01 - Стратегия релизов

**Типы релизов:**

-  **Major (v2.0.0)** - значительные изменения с потенциальной несовместимостью

-  **Minor (v1.1.0)** - новая функциональность без нарушения совместимости

-  **Patch (v1.0.1)** - исправления багов и мелкие улучшения

-  **Hotfix (v1.0.1-hotfix.1)** - критические исправления для продакшна

### 07\.01.06.02 - Процедура релиза

**Подготовка к релизу:**

```bash
# 1. Создание release ветки
git checkout -b release/v1.2.0 develop

# 2. Обновление версии в конфигурациях
./scripts/bump-version.sh 1.2.0

# 3. Финальное тестирование
npm run test:all
./scripts/integration-tests.sh

# 4. Создание changelog
./scripts/generate-changelog.sh v1.1.0..HEAD

# 5. Merge в main и создание тега
git checkout main
git merge release/v1.2.0
git tag -a v1.2.0 -m "Release version 1.2.0"
git push origin main --tags
```

### 07\.01.06.03 - Rollback процедуры

**Быстрый rollback:**

```bash
#!/bin/bash
# scripts/rollback.sh

PREVIOUS_VERSION=${1:-$(git describe --tags --abbrev=0 HEAD^)}

echo "🔄 Выполняется rollback к версии $PREVIOUS_VERSION"

# Остановка текущих сервисов
docker-compose down

# Переключение на предыдущую версию
git checkout $PREVIOUS_VERSION

# Восстановление сервисов
docker-compose up -d

# Проверка здоровья сервисов
./scripts/health-check.sh

echo "✅ Rollback к версии $PREVIOUS_VERSION завершен"
```

### 07\.01.06.04 - Мониторинг релизов

**Ключевые метрики:**

-  Время развертывания

-  Количество ошибок после релиза

-  Производительность приложения

-  Пользовательские метрики

**Автоматические проверки после релиза:**

```bash
#!/bin/bash
# scripts/post-deploy-verification.sh

echo "🔍 Проверка состояния после развертывания..."

# Проверка доступности основных сервисов
curl -f https://api.tapbot.kz/health || exit 1
curl -f https://docs.tapbot.kz || exit 1

# Проверка базы данных
docker-compose exec postgres pg_isready || exit 1

# Проверка логов на ошибки
docker-compose logs --tail=100 | grep -i error && exit 1

echo "✅ Все проверки пройдены успешно"
```

## 07\.01.07 - Безопасность разработки

### 07\.01.07.01 - Безопасность кода

**Статический анализ безопасности:**

```yaml
# .github/workflows/security.yml
name: Security Scan

on: [push, pull_request]

jobs:
  security-scan:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      
      - name: Run Bandit (Python security)
        run: bandit -r . -f json -o bandit-report.json
      
      - name: Run npm audit (Node.js)
        run: npm audit --audit-level high
      
      - name: Run Semgrep
        uses: returntocorp/semgrep-action@v1
        with:
          config: auto
```

### 07\.01.07.02 - Управление секретами

**Принципы работы с секретами:**

-  Никогда не commit'ить секреты в Git

-  Использовать переменные окружения

-  Ротация секретов каждые 90 дней

-  Минимальные привилегии для всех ключей

**Пример безопасного управления:**

```bash
# Загрузка секретов из внешнего хранилища
export DATABASE_PASSWORD=$(vault kv get -field=password secret/database)
export API_KEY=$(vault kv get -field=key secret/external-api)

# Валидация наличия всех необходимых секретов
./scripts/validate-secrets.sh
```

### 07\.01.07.03 - Безопасность инфраструктуры

**Сканирование Docker образов:**

```bash
# Сканирование уязвимостей в образах
docker run --rm -v /var/run/docker.sock:/var/run/docker.sock \
  aquasec/trivy image nginx:latest

# Проверка конфигураций Docker Compose
docker run --rm -v $(pwd):/project \
  cisfoundation/docker-bench-security
```

### 07\.01.07.04 - Инцидент-менеджмент

**Процедура реагирования на инциденты:**

1. **Обнаружение** - автоматические алерты или ручное выявление

2. **Изоляция** - ограничение воздействия проблемы

3. **Исследование** - анализ причин и масштаба инцидента

4. **Устранение** - исправление проблемы

5. **Восстановление** - возврат к нормальной работе

6. **Постмортем** - анализ и извлечение уроков

**Шаблон отчета об инциденте:**

```markdown
# Инцидент: [Краткое описание]

**Дата:** [DD.MM.YYYY]
**Время:** [HH:MM - HH:MM UTC+6]
**Серьезность:** [Critical/High/Medium/Low]

## Краткое описание
[Что произошло]

## Воздействие
[Какие сервисы пострадали]

## Причина
[Первопричина инцидента]

## Действия по устранению
[Что было сделано для исправления]

## Извлеченные уроки
[Что можно улучшить в будущем]
```

## 07\.01.08 - Мониторинг и логирование

### 07\.01.08.01 - Логирование приложений

**Структура логов:**

```json
{
  "timestamp": "2025-07-16T10:30:00Z",
  "level": "INFO",
  "service": "api-gateway",
  "message": "Request processed successfully",
  "request_id": "req-12345",
  "user_id": "user-67890",
  "duration_ms": 150,
  "status_code": 200
}
```

**Уровни логирования:**

-  **ERROR** - ошибки, требующие немедленного внимания

-  **WARN** - предупреждения о потенциальных проблемах

-  **INFO** - информационные сообщения о работе системы

-  **DEBUG** - детальная информация для отладки

### 07\.01.08.02 - Метрики производительности

**Ключевые метрики:**

```python
# Примеры метрик для мониторинга
from prometheus_client import Counter, Histogram, Gauge

# Счетчики запросов
REQUEST_COUNT = Counter('requests_total', 'Total requests', ['method', 'endpoint'])

# Время обработки
REQUEST_DURATION = Histogram('request_duration_seconds', 'Request duration')

# Активные подключения
ACTIVE_CONNECTIONS = Gauge('active_connections', 'Active connections')
```

### 07\.01.08.03 - Алертинг

**Конфигурация алертов:**

```yaml
# alerts.yml
groups:
  - name: application
    rules:
      - alert: HighErrorRate
        expr: rate(http_requests_total{status=~"5.."}[5m]) > 0.1
        for: 2m
        labels:
          severity: critical
        annotations:
          summary: "High error rate detected"
          
      - alert: DatabaseDown
        expr: up{job="database"} == 0
        for: 30s
        labels:
          severity: critical
        annotations:
          summary: "Database is down"
```

### 07\.01.08.04 - Дашборды и визуализация

**Основные дашборды:**

-  **System Overview** - общее состояние системы

-  **Application Performance** - производительность приложений

-  **Infrastructure Monitoring** - состояние серверов

-  **Security Dashboard** - события безопасности

## 