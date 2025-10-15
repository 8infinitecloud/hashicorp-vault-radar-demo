#!/bin/bash

echo "🔍 HashiCorp Vault Radar Demo Completo - Escaneando Todas las Vulnerabilidades"
echo "============================================================================="

echo ""
echo "📁 Escaneando rama MAIN..."
echo "----------------------------"

echo "🔴 Escaneando vulnerabilidades de ALTA SEVERIDAD..."
vault-radar scan repo ./high-severity

echo "📊 Escaneando vulnerabilidades de PII..."
vault-radar scan repo ./pii-risks

echo "📁 Escaneando caso CircleCI (Variables de entorno expuestas)..."
vault-radar scan repo ./circleci-case

echo "📁 Escaneando caso Codecov (Tokens de API hardcodeados)..."
vault-radar scan repo ./codecov-case

echo "📁 Escaneando caso Toyota (Credenciales en código fuente)..."
vault-radar scan repo ./toyota-case

echo "📁 Escaneando secretos en Docker..."
vault-radar scan repo ./docker-secrets

echo "📁 Escaneando secretos en Kubernetes..."
vault-radar scan repo ./kubernetes-secrets

echo "📁 Escaneando secretos en Terraform..."
vault-radar scan repo ./terraform-secrets

echo ""
echo "🔄 Cambiando a rama DEV..."
git checkout dev

echo "📁 Escaneando vulnerabilidades en rama DEV..."
vault-radar scan repo ./dev-secrets

echo ""
echo "🔄 Cambiando a rama QA..."
git checkout qa

echo "📁 Escaneando vulnerabilidades en rama QA..."
vault-radar scan repo ./qa-secrets

echo ""
echo "🔄 Volviendo a rama MAIN..."
git checkout main

echo ""
echo "📊 Escaneando TODO el repositorio (todas las ramas)..."
vault-radar scan repo .

echo ""
echo "📋 RESUMEN DE VULNERABILIDADES ESPERADAS:"
echo "=========================================="
echo "🔴 ALTA SEVERIDAD:"
echo "   - Credenciales de root de AWS"
echo "   - Claves maestras de base de datos"
echo "   - Claves privadas de producción"
echo "   - Tokens de API de producción"
echo ""
echo "📊 PII (Información Personal):"
echo "   - Números de Seguro Social (SSN)"
echo "   - Números de tarjetas de crédito"
echo "   - Direcciones y teléfonos"
echo "   - Registros médicos"
echo ""
echo "⚠️  LENGUAJE NO INCLUSIVO:"
echo "   - Términos master/slave"
echo "   - Términos blacklist/whitelist"
echo "   - Lenguaje inapropiado en comentarios"
echo "   - Referencias no inclusivas"
echo ""
echo "🔧 SECRETOS POR TIPO:"
echo "   - AWS Access Keys y Secret Keys"
echo "   - GitHub Personal Access Tokens"
echo "   - Database connection strings"
echo "   - JWT Secrets"
echo "   - API Keys (Stripe, Slack, SendGrid, etc.)"
echo "   - SSH Private Keys"
echo "   - Docker y Kubernetes secrets"
echo "   - Terraform variables con secretos"
echo ""
echo "✅ Demo completada. Revisa los findings encontrados por Vault Radar en todas las ramas."
