#!/bin/bash
echo "🚀 Создание идеальной структуры tapbot.kz с нумерацией..."

# Создание основных директорий с нумерацией
mkdir -p 01-project-foundation/{01-01-vision,01-02-team,01-03-economics}
mkdir -p 02-infrastructure/{02-01-servers,02-02-resources,02-03-economics,02-04-development,configs/{server1,server2,backups}}
mkdir -p 03-software-stack/{03-01-principles,03-02-server1,03-03-server2,03-04-integrations}
mkdir -p 04-network-architecture/{04-01-domains,04-02-ports,04-03-loadbalancing,04-04-monitoring}
mkdir -p 05-security/{05-01-principles,05-02-server-security,05-03-application-security,05-04-monitoring}
mkdir -p 06-operations/{06-01-backup,06-02-deployment,06-03-monitoring,06-04-maintenance}
mkdir -p 07-development/{07-01-workflows,07-02-ai-integration,07-03-api-development,07-04-tools}
mkdir -p 08-planning/{08-01-roadmap,08-02-history,08-03-risk-management,08-04-scaling}

echo "✅ Структура директорий создана"
