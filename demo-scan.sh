#!/bin/bash

echo "🔍 HashiCorp Vault Radar Demo - Escaneando Vulnerabilidades"
echo "=========================================================="

echo ""
echo "📁 Escaneando caso CircleCI (Variables de entorno expuestas)..."
vault-radar scan repo ./circleci-case

echo ""
echo "📁 Escaneando caso Codecov (Tokens de API hardcodeados)..."
vault-radar scan repo ./codecov-case

echo ""
echo "📁 Escaneando caso Toyota (Credenciales en código fuente)..."
vault-radar scan repo ./toyota-case

echo ""
echo "📁 Escaneando secretos en Docker..."
vault-radar scan repo ./docker-secrets

echo ""
echo "📁 Escaneando secretos en Kubernetes..."
vault-radar scan repo ./kubernetes-secrets

echo ""
echo "📁 Escaneando secretos en Terraform..."
vault-radar scan repo ./terraform-secrets

echo ""
echo "📁 Escaneando todo el repositorio..."
vault-radar scan repo .

echo ""
echo "✅ Demo completada. Revisa los findings encontrados por Vault Radar."
