# HashiCorp Vault Radar Demo Repository

⚠️ **ADVERTENCIA: Este repositorio contiene vulnerabilidades intencionales para fines de demostración**

Este repositorio simula vulnerabilidades de seguridad similares a casos reales como:
- **CircleCI (2023)**: Exposición de secretos en variables de entorno
- **Codecov (2021)**: Compromiso de tokens de acceso 
- **Toyota (2022)**: Claves expuestas en código fuente

## Casos de Vulnerabilidad Incluidos

### 1. Secretos en Variables de Entorno (Tipo CircleCI)
- Variables de entorno con tokens expuestos
- Configuraciones de CI/CD inseguras

### 2. Tokens de API Hardcodeados (Tipo Codecov)
- Tokens de GitHub, AWS, y otros servicios
- Claves de API en archivos de configuración

### 3. Credenciales en Código Fuente (Tipo Toyota)
- Passwords en archivos de configuración
- Claves privadas SSH
- Strings de conexión a bases de datos

### 4. Secretos en Archivos de Configuración
- Docker secrets
- Kubernetes secrets
- Terraform variables

## Estructura del Repositorio

```
├── circleci-case/          # Simulación caso CircleCI
├── codecov-case/           # Simulación caso Codecov  
├── toyota-case/            # Simulación caso Toyota
├── docker-secrets/         # Secretos en Docker
├── kubernetes-secrets/     # Secretos en K8s
├── terraform-secrets/      # Secretos en Terraform
├── high-severity/          # Vulnerabilidades críticas
├── pii-risks/              # Datos PII y lenguaje no inclusivo
├── dev-secrets/            # Secretos en rama dev
└── qa-secrets/             # Secretos en rama qa
```

## Uso con Vault Radar

```bash
# Escanear todo el repositorio
vault-radar scan repo .

# Escanear directorio específico
vault-radar scan repo ./circleci-case
```

## Tipos de Findings Esperados

### 🔴 Alta Severidad
- AWS Root Account Credentials
- Production Database Master Passwords
- Production Private Keys
- Live API Keys (Stripe, PayPal)
- Production Encryption Keys

### 📊 PII (Información Personal Identificable)
- Números de Seguro Social (SSN)
- Números de tarjetas de crédito con CVV
- Direcciones físicas y números de teléfono
- Emails personales
- Registros médicos e información de seguros

### ⚠️ Lenguaje No Inclusivo
- Términos master/slave en código
- Términos blacklist/whitelist
- Lenguaje inapropiado en comentarios
- Referencias no inclusivas en documentación

### 🔧 Secretos Técnicos
- AWS Access Keys y Secret Keys
- GitHub Personal Access Tokens
- Database Connection Strings
- SSH Private Keys
- JWT Secrets
- API Keys de servicios terceros
- Docker y Kubernetes secrets
- Terraform variables con credenciales

## Ramas del Repositorio

- **main**: Vulnerabilidades de producción y casos principales
- **dev**: Secretos de desarrollo con datos de prueba (pero reales)
- **qa**: Configuraciones de staging que apuntan a producción
