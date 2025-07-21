---
title: 06.02 - Развертывание Docker стека
---

**Раздел:** 06\.02 - Развертывание Docker стека\
**Назначение:** Руководство по установке и настройке Docker стека на серверах проекта

## 06\.02.01 - Подготовка серверной среды

### 06\.02.01.01 - Обновление системных пакетов

```bash
# Обновление базовой системы
sudo apt update && sudo apt upgrade -y

# Установка необходимых утилит
sudo apt install -y curl wget git htop nano ufw fail2ban
```

### 06\.02.01.02 - Настройка базовой безопасности

```bash
# Конфигурация UFW firewall
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw --force enable

# Активация fail2ban
sudo systemctl enable fail2ban
sudo systemctl start fail2ban
```

### 06\.02.01.03 - Установка Docker Engine

```bash
# Удаление конфликтующих пакетов
sudo apt remove -y docker docker-engine docker.io containerd runc

# Установка зависимостей
sudo apt install -y apt-transport-https ca-certificates curl gnupg lsb-release

# Добавление Docker GPG ключа
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Добавление Docker репозитория
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Установка Docker
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Добавление пользователя в группу docker
sudo usermod -aG docker $USER
```

## 06\.02.02 - Конфигурация первого сервера (n8n стек)

### 06\.02.02.01 - Создание структуры проекта

```bash
# Создание рабочих директорий
sudo mkdir -p /opt/docker/n8n-stack
cd /opt/docker/n8n-stack

# Структура данных
sudo mkdir -p {traefik_data/logs,n8n_data,portainer_data,redis_data}

# Установка прав доступа
sudo chown -R $USER:$USER /opt/docker/n8n-stack
chmod 755 /opt/docker/n8n-stack
```

### 06\.02.02.02 - Конфигурация Traefik

```bash
# Создание конфигурации Traefik
cat > traefik_data/traefik.yml << 'EOF'
api:
  dashboard: true
  insecure: false

entryPoints:
  web:
    address: ":80"
    http:
      redirections:
        entrypoint:
          to: websecure
          scheme: https
  websecure:
    address: ":443"

certificatesResolvers:
  letsencrypt:
    acme:
      email: admin@tapbot.kz
      storage: /acme.json
      httpChallenge:
        entryPoint: web

providers:
  docker:
    endpoint: "unix:///var/run/docker.sock"
    exposedByDefault: false

log:
  level: INFO
  filePath: "/logs/traefik.log"

accessLog:
  filePath: "/logs/access.log"
EOF

# Создание файла для SSL сертификатов
touch traefik_data/acme.json
chmod 600 traefik_data/acme.json
```

### 06\.02.02.03 - Docker Compose конфигурация

```yaml
# Создание docker-compose.yml для первого сервера
cat > docker-compose.yml << 'EOF'
version: '3.8'

services:
  traefik:
    image: traefik:v3.0
    container_name: traefik
    restart: unless-stopped
    security_opt:
      - no-new-privileges:true
    ports:
      - "80:80"
      - "443:443"
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock:ro
      - ./traefik_data/traefik.yml:/traefik.yml:ro
      - ./traefik_data/acme.json:/acme.json
      - ./traefik_data/logs:/logs
    labels:
      - traefik.enable=true
      - traefik.http.routers.traefik.rule=Host(`traefik.tapbot.kz`)
      - traefik.http.routers.traefik.entrypoints=websecure
      - traefik.http.routers.traefik.tls.certresolver=letsencrypt
      - traefik.http.routers.traefik.service=api@internal
      - traefik.http.middlewares.traefik-auth.basicauth.users=admin:$$2y$$10$$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi
      - traefik.http.routers.traefik.middlewares=traefik-auth
    networks:
      - web

  n8n:
    image: n8nio/n8n:latest
    container_name: n8n_app
    restart: unless-stopped
    environment:
      - N8N_BASIC_AUTH_ACTIVE=true
      - N8N_BASIC_AUTH_USER=admin
      - N8N_BASIC_AUTH_PASSWORD=${N8N_PASSWORD}
      - N8N_HOST=n8n.tapbot.kz
      - N8N_PORT=5678
      - N8N_PROTOCOL=https
      - WEBHOOK_URL=https://n8n.tapbot.kz/
      - GENERIC_TIMEZONE=Asia/Almaty
    volumes:
      - ./n8n_data:/home/node/.n8n
    labels:
      - traefik.enable=true
      - traefik.http.routers.n8n.rule=Host(`n8n.tapbot.kz`)
      - traefik.http.routers.n8n.entrypoints=websecure
      - traefik.http.routers.n8n.tls.certresolver=letsencrypt
    networks:
      - web
      - n8n_network
    depends_on:
      - traefik

  portainer:
    image: portainer/portainer-ce:latest
    container_name: portainer
    restart: unless-stopped
    security_opt:
      - no-new-privileges:true
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock:ro
      - ./portainer_data:/data
    labels:
      - traefik.enable=true
      - traefik.http.routers.portainer.rule=Host(`docker1.tapbot.kz`)
      - traefik.http.routers.portainer.entrypoints=websecure
      - traefik.http.routers.portainer.tls.certresolver=letsencrypt
      - traefik.http.services.portainer.loadbalancer.server.port=9000
    networks:
      - web

networks:
  web:
    external: false
  n8n_network:
    external: false
EOF
```

### 06\.02.02.04 - Переменные окружения

```bash
# Генерация безопасных паролей
N8N_PASS=$(openssl rand -base64 24)

# Создание .env файла
cat > .env << EOF
# Пароли и авторизация
N8N_PASSWORD=$N8N_PASS

# Домены сервисов
N8N_DOMAIN=n8n.tapbot.kz
PORTAINER_DOMAIN=docker1.tapbot.kz
TRAEFIK_DOMAIN=traefik.tapbot.kz

# Системные настройки
TZ=Asia/Almaty
EOF

# Защита конфиденциальных данных
chmod 600 .env
```

## 06\.02.03 - Конфигурация второго сервера (база данных)

### 06\.02.03.01 - Структура PostgreSQL стека

```bash
# Создание директории для второго сервера
sudo mkdir -p /opt/docker/directus-stack
cd /opt/docker/directus-stack

# Структура данных
sudo mkdir -p {postgres_data,directus_data,pgadmin_data,traefik_data/logs}

# Права доступа
sudo chown -R $USER:$USER /opt/docker/directus-stack
```

### 06\.02.03.02 - Конфигурация PostgreSQL

```bash
# Создание кастомной конфигурации PostgreSQL
cat > postgres_custom.conf << 'EOF'
# PostgreSQL Configuration - tapbot.kz
# Оптимизированная конфигурация для Docker

# Сетевые настройки
listen_addresses = '*'
port = 5432

# Логирование (оптимизировано против спама)
log_min_messages = warning
log_statement = none
log_min_duration_statement = 1000
log_connections = off
log_disconnections = off

# Производительность
shared_buffers = 1GB
work_mem = 32MB
maintenance_work_mem = 256MB
effective_cache_size = 3GB
max_connections = 50
EOF
```

### 06\.02.03.03 - Docker Compose для второго сервера

```yaml
# Конфигурация стека баз данных
cat > docker-compose.yml << 'EOF'
version: '3.8'

services:
  postgres:
    image: postgres:16-alpine
    container_name: postgres_db
    restart: unless-stopped
    environment:
      POSTGRES_USER: ${POSTGRES_USER}
      POSTGRES_PASSWORD: ${POSTGRES_PASSWORD}
      POSTGRES_DB: ${POSTGRES_DB}
    volumes:
      - ./postgres_data:/var/lib/postgresql/data
      - ./postgres_custom.conf:/etc/postgresql/postgresql.conf
    command: postgres -c config_file=/etc/postgresql/postgresql.conf
    networks:
      - database_network

  directus:
    image: directus/directus:latest
    container_name: directus_app
    restart: unless-stopped
    environment:
      SECRET: ${DIRECTUS_SECRET}
      KEY: ${DIRECTUS_KEY}
      DB_CLIENT: pg
      DB_HOST: postgres
      DB_PORT: 5432
      DB_DATABASE: ${POSTGRES_DB}
      DB_USER: ${POSTGRES_USER}
      DB_PASSWORD: ${POSTGRES_PASSWORD}
      ADMIN_EMAIL: ${ADMIN_EMAIL}
      ADMIN_PASSWORD: ${ADMIN_PASSWORD}
    volumes:
      - ./directus_data:/directus/uploads
    labels:
      - traefik.enable=true
      - traefik.http.routers.directus.rule=Host(`dir.tapbot.kz`)
      - traefik.http.routers.directus.entrypoints=websecure
      - traefik.http.routers.directus.tls.certresolver=letsencrypt
    networks:
      - web
      - database_network
    depends_on:
      - postgres

  pgadmin:
    image: dpage/pgadmin4:latest
    container_name: pgadmin
    restart: unless-stopped
    environment:
      PGADMIN_DEFAULT_EMAIL: ${ADMIN_EMAIL}
      PGADMIN_DEFAULT_PASSWORD: ${PGADMIN_PASSWORD}
    volumes:
      - ./pgadmin_data:/var/lib/pgadmin
    labels:
      - traefik.enable=true
      - traefik.http.routers.pgadmin.rule=Host(`pg.tapbot.kz`)
      - traefik.http.routers.pgadmin.entrypoints=websecure
      - traefik.http.routers.pgadmin.tls.certresolver=letsencrypt
      - traefik.http.middlewares.pgadmin-auth.basicauth.users=admin:$$2y$$10$$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi
      - traefik.http.routers.pgadmin.middlewares=pgadmin-auth
    networks:
      - web
      - database_network

networks:
  web:
    external: false
  database_network:
    internal: true
EOF
```

## 06\.02.04 - Процедуры запуска и валидации

### 06\.02.04.01 - Последовательность запуска

```bash
# Проверка конфигурации
docker compose config

# Загрузка образов
docker compose pull

# Запуск сервисов
docker compose up -d

# Мониторинг запуска
docker compose ps
docker compose logs -f
```

### 06\.02.04.02 - Валидация развертывания

```bash
# Проверка статуса контейнеров
docker compose ps

# Проверка сетевой связности
docker compose exec directus_app nc -zv postgres 5432

# Проверка SSL сертификатов
curl -I https://n8n.tapbot.kz
curl -I https://dir.tapbot.kz

# Проверка веб-интерфейсов
curl -I https://docker1.tapbot.kz
curl -I https://pg.tapbot.kz
```

### 06\.02.04.03 - Диагностика проблем

```bash
# Анализ логов
docker compose logs --tail 50 [service_name]

# Проверка использования ресурсов
docker stats --no-stream

# Проверка сетей Docker
docker network ls
docker network inspect [network_name]

# Диагностика PostgreSQL
docker compose exec postgres psql -U directus_user -d directus -c "SELECT version();"
```

## 06\.02.05 - Автоматизация и мониторинг

### 06\.02.05.01 - Автоматическое резервное копирование

```bash
# Создание скрипта backup
cat > /usr/local/bin/docker-backup.sh << 'EOF'
#!/bin/bash
BACKUP_DIR="/opt/backups"
DATE=$(date +%Y%m%d_%H%M%S)

# PostgreSQL backup
docker compose exec -T postgres pg_dump -U directus_user directus > $BACKUP_DIR/postgres-$DATE.sql

# n8n данные backup
tar -czf $BACKUP_DIR/n8n-data-$DATE.tar.gz /opt/docker/n8n-stack/n8n_data

# Очистка старых backup
find $BACKUP_DIR -name "*.sql" -mtime +7 -delete
find $BACKUP_DIR -name "*.tar.gz" -mtime +7 -delete
EOF

chmod +x /usr/local/bin/docker-backup.sh

# Добавление в crontab
echo "0 2 * * * /usr/local/bin/docker-backup.sh" | crontab -
```

### 06\.02.05.02 - Мониторинг здоровья сервисов

```bash
# Создание скрипта мониторинга
cat > /usr/local/bin/health-check.sh << 'EOF'
#!/bin/bash
SERVICES=("traefik" "n8n_app" "postgres_db" "directus_app")

for service in "${SERVICES[@]}"; do
    if ! docker ps | grep -q $service; then
        echo "$(date): ALERT - $service is not running" >> /var/log/docker-health.log
        # Попытка перезапуска
        docker compose restart $service
    fi
done
EOF

chmod +x /usr/local/bin/health-check.sh

# Мониторинг каждые 5 минут
echo "*/5 * * * * /usr/local/bin/health-check.sh" | crontab -
```

### 06\.02.05.03 - Обновление сервисов

```bash
# Скрипт обновления образов
cat > /usr/local/bin/update-stack.sh << 'EOF'
#!/bin/bash
cd /opt/docker/n8n-stack

# Резервное копирование перед обновлением
/usr/local/bin/docker-backup.sh

# Обновление образов
docker compose pull

# Перезапуск с новыми образами
docker compose up -d

# Очистка неиспользуемых образов
docker image prune -f
EOF

chmod +x /usr/local/bin/update-stack.sh
```