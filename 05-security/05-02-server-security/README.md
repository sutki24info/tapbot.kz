---
title: 05.02 - Безопасность серверов
---

**Последнее обновление:** 13 июля 2025\
**Ответственный:** DevOps команда\
**Статус:** Базовая защита реализована, расширенные меры в планах\
**Критичность:** ВЫСОКАЯ - основа безопасности инфраструктуры

## 05\.02.01 - Принципы безопасности

### Архитектура безопасности проекта tapbot.kz

#### Основные принципы:

-  **Минимальные привилегии:** Каждый пользователь имеет только необходимые права

-  **Защита в глубину:** Многоуровневая система защиты

-  **Автоматизация защиты:** Автоматическое реагирование на угрозы

-  **Принцип Zero Trust:** Проверка каждого подключения

-  **Безопасность по умолчанию:** Каждый новый сервис защищен с момента установки

#### Модель угроз:

-  **Атаки подбора паролей** на SSH и веб-интерфейсы

-  **Перехват трафика** при отсутствии SSL

-  **Несанкционированное расширение привилегий**

-  **Сетевые атаки и сканирование портов**

-  **Утечка учетных данных**

-  **Внутренние угрозы** от команды с ограниченным опытом

### Стратегия внедрения

#### ✅ Этап 1 (КРИТИЧЕСКИЙ - реализован):

* [x] **Let's Encrypt SSL сертификаты** для всех доменов

* [x] **Смена портов** критичных сервисов (Webmin: 10000 --> 8442)

* [x] **Установка fail2ban** на оба сервера

#### ✅ Этап 2 (ВАЖНЫЙ - реализован):

* [x] **Создание пользователя monitor** с ограниченными правами

* [x] **Настройка DNS записей** webmin1/webmin2.tapbot.kz

* [x] **Конфигурация sudo правил** для безопасного делегирования

#### 🔄 Этап 3 (В ПЛАНАХ):

* [ ] **WireGuard VPN** на первом сервере

* [ ] **Bitwarden** для управления паролями

* [ ] **Двухфакторная аутентификация** для критических сервисов

## 05\.02.02 - SSL/TLS защита

### Let's Encrypt автоматические сертификаты

#### Защищенные домены:

```
✅ dir.tapbot.kz - Directus CMS интерфейс
✅ pg.tapbot.kz - PostgreSQL администрирование
✅ docker2.tapbot.kz - Portainer Docker management
✅ webmin2.tapbot.kz - Системное администрирование
✅ dozzle2.tapbot.kz - Логи Docker контейнеров
```

#### Автоматическое обновление сертификатов:

```bash
# Cron задача для автообновления
0 12 * * * /usr/bin/certbot renew --quiet

# Проверка статуса всех сертификатов
certbot certificates

# Проверка срока действия конкретного домена
echo | openssl s_client -servername dir.tapbot.kz -connect dir.tapbot.kz:443 2>/dev/null | openssl x509 -noout -dates
```

#### Принудительное HTTPS через Traefik:

```yaml
# Автоматическое перенаправление HTTP → HTTPS
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
```

### Мониторинг SSL статуса

#### Ежедневные проверки:

```bash
# Скрипт проверки всех SSL сертификатов
#!/bin/bash
DOMAINS=("dir.tapbot.kz" "pg.tapbot.kz" "docker2.tapbot.kz" "webmin2.tapbot.kz" "dozzle2.tapbot.kz")

for domain in "${DOMAINS[@]}"; do
    expiry=$(echo | openssl s_client -servername $domain -connect $domain:443 2>/dev/null | openssl x509 -noout -enddate | cut -d= -f2)
    echo "$domain expires: $expiry"
done
```

#### Автоматические алерты:

-  **30 дней до истечения:** Уведомление в Telegram

-  **7 дней до истечения:** Ежедневные уведомления

-  **Ошибка обновления:** Немедленное уведомление команды

## 05\.02.03 - Сетевая защита

### UFW файрвол конфигурация

#### Базовая политика:

```bash
# Статус UFW
sudo ufw status verbose

# Вывод:
Status: active
Logging: on (low)
Default: deny (incoming), allow (outgoing), disabled (routed)
```

#### Разрешенные порты:

```
22/tcp     SSH (ограничен по IP при необходимости)
80/tcp     HTTP (для Let's Encrypt challenge)
443/tcp    HTTPS (веб-интерфейсы)
8442/tcp   Webmin второй сервер
8441/tcp   Webmin первый сервер (планируется)
```

#### Управление правилами UFW:

```bash
# Добавление правила для SSH с ограничением по IP
sudo ufw allow from [ADMIN_IP] to any port 22 comment 'SSH для админа'

# Блокировка подозрительного IP
sudo ufw deny from [MALICIOUS_IP] comment 'Заблокированный IP'

# Временное разрешение для отладки
sudo ufw allow 3000/tcp comment 'Временный порт для отладки'

# Удаление временного правила
sudo ufw delete allow 3000/tcp
```

### fail2ban автоматическая защита

#### Настроенные jail:

```bash
# Проверка активных jail
sudo fail2ban-client status

# Результат:
Status
|- Number of jail:      3
`- Jail list:   sshd, webmin-auth, nginx-http-auth
```

#### SSH защита:

```ini
[sshd]
enabled = true
port = ssh
filter = sshd
logpath = /var/log/auth.log
maxretry = 5      # 5 попыток перед блокировкой
bantime = 3600    # 1 час блокировки
findtime = 600    # Окно анализа 10 минут
```

#### Webmin специализированная защита:

```ini
[webmin-auth]
enabled = true
port = 8441,8442
filter = webmin-auth
logpath = /var/log/auth.log
maxretry = 3      # Строже чем SSH
bantime = 7200    # 2 часа блокировки
findtime = 300    # 5 минут окно анализа
```

#### Мониторинг и управление блокировками:

```bash
# Просмотр заблокированных IP для SSH
sudo fail2ban-client get sshd banip

# Разблокировка IP (при необходимости)
sudo fail2ban-client set sshd unbanip [IP_ADDRESS]

# Статистика блокировок за день
sudo fail2ban-client get sshd stats

# Анализ источников атак
sudo grep "Failed password" /var/log/auth.log | awk '{print $11}' | sort | uniq -c | sort -nr | head -10
```

## 05\.02.04 - Управление доступом

### SSH ключи и аутентификация

#### Принципы доступа:

-  **Root доступ:** Только по SSH ключам (PasswordAuthentication=no для root)

-  **Пользователь monitor:** Ограниченные sudo права

-  **Ротация ключей:** Ежегодно для обеспечения безопасности

-  **Аудит доступа:** Логирование всех SSH подключений

#### Конфигурация SSH:

```bash
# /etc/ssh/sshd_config - ключевые настройки безопасности
Port 22
PermitRootLogin prohibit-password  # Только SSH ключи для root
PasswordAuthentication yes         # Для пользователя monitor
PubkeyAuthentication yes
AuthorizedKeysFile .ssh/authorized_keys
MaxAuthTries 3                     # Максимум попыток аутентификации
ClientAliveInterval 300            # Timeout неактивных сессий
ClientAliveCountMax 2
```

#### Управление SSH ключами:

```bash
# Добавление нового ключа для root
echo "ssh-rsa AAAAB3NzaC1yc2E... admin@tapbot.kz" >> /root/.ssh/authorized_keys
chmod 600 /root/.ssh/authorized_keys

# Генерация нового ключа (ежегодная ротация)
ssh-keygen -t rsa -b 4096 -C "admin@tapbot.kz" -f ~/.ssh/tapbot_$(date +%Y)

# Аудит активных ключей
sudo cat /root/.ssh/authorized_keys | grep -E "^ssh-" | wc -l
```

### Пользователь monitor

#### Философия ограниченного доступа:

**Пользователь monitor создан для делегирования базовых административных задач команде новичков без предоставления полного root доступа.**

#### Sudo правила:

```bash
# /etc/sudoers.d/monitor
# Мониторинг системы (только чтение)
monitor ALL=(ALL) NOPASSWD: /usr/bin/htop
monitor ALL=(ALL) NOPASSWD: /bin/ps *
monitor ALL=(ALL) NOPASSWD: /usr/bin/top
monitor ALL=(ALL) NOPASSWD: /bin/df *
monitor ALL=(ALL) NOPASSWD: /usr/bin/du *
monitor ALL=(ALL) NOPASSWD: /bin/netstat *
monitor ALL=(ALL) NOPASSWD: /usr/bin/ss *

# Проверка статуса служб (только чтение)
monitor ALL=(ALL) NOPASSWD: /bin/systemctl status *
monitor ALL=(ALL) NOPASSWD: /bin/systemctl is-active *
monitor ALL=(ALL) NOPASSWD: /bin/systemctl is-enabled *

# Безопасные службы для перезапуска
monitor ALL=(ALL) NOPASSWD: /bin/systemctl restart fail2ban
monitor ALL=(ALL) NOPASSWD: /bin/systemctl restart rsyslog
monitor ALL=(ALL) NOPASSWD: /bin/systemctl restart cron

# Просмотр логов (только чтение)
monitor ALL=(ALL) NOPASSWD: /usr/bin/tail /var/log/*
monitor ALL=(ALL) NOPASSWD: /usr/bin/head /var/log/*
monitor ALL=(ALL) NOPASSWD: /usr/bin/less /var/log/*
monitor ALL=(ALL) NOPASSWD: /usr/bin/journalctl *

# Docker мониторинг (только чтение)
monitor ALL=(ALL) NOPASSWD: /usr/bin/docker ps *
monitor ALL=(ALL) NOPASSWD: /usr/bin/docker stats *
monitor ALL=(ALL) NOPASSWD: /usr/bin/docker logs *
```

#### Критические ограничения:

```bash
# ЗАПРЕЩЕННЫЕ ОПЕРАЦИИ (НЕТ sudo прав):
# - stop, disable, mask системных служб
# - docker start, stop, restart контейнеров  
# - reboot, shutdown системы
# - изменение файлов конфигурации в /etc/
# - создание/удаление пользователей
# - изменение сетевых настроек
# - управление файрволом UFW
```

### Аудит и мониторинг доступа

#### Логирование активности:

```bash
# Мониторинг SSH подключений
sudo last -10

# Проверка sudo активности пользователя monitor
sudo grep "monitor.*COMMAND" /var/log/auth.log | tail -20

# Анализ неудачных попыток входа
sudo grep "Failed password" /var/log/auth.log | tail -10

# Проверка активных сессий
who
w
```

## 05\.02.05 - Защита веб-интерфейсов

### BasicAuth для критичных интерфейсов

#### Dozzle (Docker логи):

```yaml
# docker-compose.yml - защита BasicAuth
services:
  dozzle:
    environment:
      - DOZZLE_USERNAME=admin
      - DOZZLE_PASSWORD=${DOZZLE_PASSWORD}
    labels:
      - "traefik.http.middlewares.dozzle-auth.basicauth.users=admin:$$2y$$10$$..."
```

#### Мониторинг попыток доступа:

```bash
# Логи доступа через Traefik
docker logs traefik | grep "dozzle2.tapbot.kz"

# Анализ неудачных попыток входа
grep "401\|403" /var/log/traefik/access.log | tail -20

# Статистика по IP адресам атакующих
grep "401" /var/log/traefik/access.log | awk '{print $1}' | sort | uniq -c | sort -nr | head -10
```

### Встроенная авторизация приложений

#### Directus CMS:

-  **Система ролей:** Admin, Editor, Public с детальными правами

-  **Токены API:** Ограниченные по времени и функциональности

-  **Аудит действий:** Все изменения данных логируются

-  **Session management:** Автоматический выход при неактивности

#### pgAdmin:

-  **Персональные аккаунты:** Каждому администратору отдельный доступ

-  **Ограничения по БД:** Доступ только к необходимым базам данных

-  **Connection limits:** Ограничение количества одновременных подключений

-  **Query logging:** Аудит выполняемых SQL запросов

#### Portainer:

-  **Role-based access:** Разные уровни доступа к Docker ресурсам

-  **Environment isolation:** Изоляция между production и staging

-  **Action logging:** Все операции с контейнерами логируются

## 05\.02.06 - Мониторинг безопасности

### Контрольные процедуры

#### Ежедневные проверки безопасности:

```bash
# Статус защитных служб
sudo systemctl status fail2ban ufw ssh

# Проверка активных подключений
sudo ss -tuln | grep LISTEN
who
w

# Анализ попыток вторжения за последние 24 часа
sudo fail2ban-client status
grep "Failed password" /var/log/auth.log | grep "$(date +'%b %d')" | wc -l
```

#### Еженедельные проверки:

```bash
# Обновления безопасности
sudo apt list --upgradable | grep -i security

# Анализ логов безопасности за неделю
sudo grep -i "failed\|error\|denied" /var/log/auth.log | grep "$(date -d '7 days ago' +'%b %d')" | wc -l

# Проверка SSL сертификатов
sudo certbot certificates

# Аудит sudo активности пользователя monitor
sudo grep "monitor.*COMMAND" /var/log/auth.log | grep "$(date -d '7 days ago' +'%b %d')" | tail -20
```

#### Ежемесячные проверки:

```bash
# Аудит системных пользователей
sudo cat /etc/passwd | grep -E ":/bin/(bash|sh)$"

# Проверка SSH ключей
sudo find /home -name "authorized_keys" -exec ls -la {} \;
sudo cat /root/.ssh/authorized_keys | wc -l

# Анализ открытых портов
sudo ss -tlnp | grep LISTEN

# Аудит UFW правил
sudo ufw status numbered
```

### Автоматизированный мониторинг

#### Скрипты безопасности:

```bash
#!/bin/bash
# /opt/scripts/security-check.sh
# Ежедневная проверка безопасности

# Проверка критичных служб
services=("fail2ban" "ufw" "ssh")
for service in "${services[@]}"; do
    if ! systemctl is-active --quiet $service; then
        echo "ALERT: Service $service is not running!" | mail -s "Security Alert" admin@tapbot.kz
    fi
done

# Проверка новых SSH ключей
current_keys=$(cat /root/.ssh/authorized_keys | wc -l)
if [ $current_keys -gt $EXPECTED_KEYS ]; then
    echo "ALERT: Unexpected SSH keys detected!" | mail -s "Security Alert" admin@tapbot.kz
fi

# Проверка fail2ban блокировок
banned_count=$(fail2ban-client status sshd | grep "Currently banned" | awk '{print $4}')
if [ $banned_count -gt 10 ]; then
    echo "WARNING: High number of banned IPs: $banned_count" | mail -s "Security Warning" admin@tapbot.kz
fi
```

#### Интеграция с Telegram алертами:

```bash
# Функция отправки в Telegram
send_telegram_alert() {
    local message="$1"
    curl -s -X POST "https://api.telegram.org/bot${BOT_TOKEN}/sendMessage" \
        -d chat_id="${CHAT_ID}" \
        -d text="🚨 Security Alert: $message"
}

# Использование в скриптах мониторинга
if [ $security_breach_detected ]; then
    send_telegram_alert "Potential security breach detected on $(hostname)"
fi
```

## 05\.02.07 - Процедуры реагирования на инциденты

### 05\.02.07.01 - Классификация инцидентов

#### Уровень 1: Информационные события

-  **Примеры:** Единичные неудачные попытки входа, сканирование портов

-  **Реакция:** Автоматическое логирование, без немедленных действий

-  **Эскалация:** Еженедельный отчет команде

#### Уровень 2: Подозрительная активность

-  **Примеры:** Множественные попытки входа, необычные паттерны доступа

-  **Реакция:** Автоматическая блокировка через fail2ban

-  **Эскалация:** Уведомление в Telegram канал DevOps

#### Уровень 3: Активная атака

-  **Примеры:** Успешный вход неавторизованного пользователя, изменения системных файлов

-  **Реакция:** Немедленная блокировка, отключение скомпрометированных аккаунтов

-  **Эскалация:** Звонок ответственному администратору

#### Уровень 4: Критический инцидент

-  **Примеры:** Полная компрометация сервера, утечка данных

-  **Реакция:** Изоляция сервера, активация плана disaster recovery

-  **Эскалация:** Экстренное собрание команды, уведомление руководства

### 05\.02.07.02 - Процедуры реагирования

#### При компрометации пользователя monitor:

```bash
# Немедленные действия
sudo passwd -l monitor                    # Блокировка пользователя
sudo pkill -u monitor                     # Завершение всех сессий
sudo /usr/share/webmin/useradmin/delete-user.pl monitor  # Удаление из Webmin

# Расследование
sudo last monitor                         # Анализ активности
sudo grep "monitor" /var/log/auth.log | tail -50  # Проверка логов
sudo grep "monitor.*COMMAND" /var/log/auth.log    # Выполненные команды

# Восстановление (после анализа)
sudo passwd monitor                       # Новый пароль
sudo passwd -u monitor                    # Разблокировка
# Пересоздание в Webmin с новыми правами
```

#### При атаке на SSH:

```bash
# Анализ атаки
sudo fail2ban-client get sshd banip      # Заблокированные IP
sudo grep "Failed password" /var/log/auth.log | awk '{print $11}' | sort | uniq -c | sort -nr

# Информация о злоумышленниках
for ip in $(sudo fail2ban-client get sshd banip); do
    echo "=== $ip ==="
    whois $ip | grep -E "(country|abuse|organization)"
done

# Усиление защиты при активной атаке
sudo fail2ban-client set sshd maxretry 2    # Снижение лимита попыток
sudo fail2ban-client set sshd bantime 86400 # Увеличение времени блокировки до 24 часов

# Постоянная блокировка источников массовых атак
sudo ufw deny from [MALICIOUS_IP] comment 'Persistent attacker - manual block'
```

#### При проблемах с SSL:

```bash
# Диагностика SSL проблем
sudo certbot certificates                 # Проверка всех сертификатов

# Детальная проверка конкретного домена
echo | openssl s_client -servername dir.tapbot.kz -connect dir.tapbot.kz:443 2>/dev/null | openssl x509 -noout -text

# Принудительное обновление при проблемах
sudo certbot renew --force-renewal --cert-name dir.tapbot.kz

# Перезапуск Traefik для применения новых сертификатов
docker restart traefik

# Верификация восстановления
curl -I https://dir.tapbot.kz
```

### 05\.02.07.03 - Документирование инцидентов

#### Обязательная информация:

-  **Время обнаружения:** Точное время первого обнаружения угрозы

-  **Источник угрозы:** IP адреса, типы атак, векторы проникновения

-  **Затронутые системы:** Какие сервисы и данные могли быть скомпрометированы

-  **Принятые меры:** Последовательность действий по устранению угрозы

-  **Время восстановления:** RTO - как быстро удалось восстановить сервисы

-  **Потеря данных:** RPO - какие данные могли быть потеряны или скомпрометированы

-  **Извлеченные уроки:** Что нужно улучшить в системе безопасности

#### Шаблон отчета об инциденте:

```markdown
# Отчет об инциденте безопасности

**Дата:** YYYY-MM-DD HH:MM
**Уровень:** [1-4]
**Статус:** Расследуется/Устранен/Закрыт

## Краткое описание
[Что произошло в 1-2 предложениях]

## Временная линия
- HH:MM - Первое обнаружение
- HH:MM - Начало реагирования  
- HH:MM - Устранение угрозы
- HH:MM - Полное восстановление

## Технические детали
- **Источник:** IP адреса, домены
- **Вектор атаки:** Как произошло проникновение
- **Затронутые системы:** Список сервисов
- **Примененные контрмеры:** Что было сделано

## Оценка ущерба
- **Доступность:** Время недоступности сервисов
- **Конфиденциальность:** Какие данные могли быть доступны
- **Целостность:** Были ли изменены данные

## Превентивные меры
- **Немедленные:** Что нужно сделать прямо сейчас
- **Краткосрочные:** Улучшения на ближайшие недели
- **Долгосрочные:** Стратегические изменения
```

## 05\.02.08 - Планы развития безопасности

### Краткосрочные планы (Q3-Q4 2025)

#### WireGuard VPN:

```bash
# Планируемая установка на первый сервер
# Конфигурация:
# - Подсеть: 10.0.100.0/24
# - Порт: 51820/udp  
# - Клиенты: до 50 подключений
# - Цель: Безопасный доступ к админ-интерфейсам
```

#### Bitwarden Password Manager:

```bash
# Планируемая установка на первый сервер
# Конфигурация:
# - Домен: vault.tapbot.kz
# - Цель: Централизованное управление паролями команды
# - Интеграция: С существующими системами аутентификации
```

#### Двухфакторная аутентификация:

-  **Google Authenticator для SSH:** Через PAM модули

-  **TOTP для Webmin:** Встроенная поддержка в Webmin

-  **Hardware tokens:** Для критичных операций senior команды

### Долгосрочные планы (2026+)

#### SIEM система:

-  **ELK Stack:** Централизованный сбор логов безопасности

-  **Автоматические алерты:** При подозрительной активности

-  **Корреляция событий:** Между серверами и сервисами

-  **Machine Learning:** Для обнаружения аномалий в поведении

#### Сегментация сети:

-  **VLAN изоляция:** Между типами трафика

-  **Micro-segmentation:** Для контейнеров Docker

-  **Zero Trust архитектура:** Для всех подключений

-  **Network monitoring:** Для обнаружения lateral movement

#### Compliance и сертификации:

-  **ISO 27001:** Для информационной безопасности

-  **SOC 2 Type II:** Для enterprise клиентов

-  **GDPR compliance:** Для европейских пользователей

-  **PCI DSS:** При обработке платежных данных

### Метрики и KPI безопасности

#### Технические метрики:

```
Время обнаружения инцидентов: <5 минут
Время реагирования на инциденты: <15 минут
Покрытие мониторингом: >95% систем
Автоматизация реагирования: >80% инцидентов уровня 1-2
Успешность автоматических обновлений: >99%
```

#### Бизнес метрики:

```
Доступность сервисов: >99.5%
Время восстановления (RTO): <30 минут
Потеря данных (RPO): <15 минут  
Соответствие политикам безопасности: 100%
Удовлетворенность команды инструментами: >90%
```

---

**Важное примечание:** Безопасность - это непрерывный процесс, требующий постоянного внимания и обновления. При внедрении любых изменений всегда тестируйте на непродакшн среде и имейте план отката. Регулярно обновляйте системы безопасности и следите за новыми угрозами в сфере информационной безопасности. Документирование всех инцидентов критически важно для непрерывного улучшения системы защиты.