# Caso CircleCI - Exposición Masiva de Secretos

Este directorio simula el incidente de seguridad de CircleCI de enero 2023, uno de los mayores compromisos de secretos en la historia de CI/CD.

## 🚨 Incidente Real de CircleCI (2023)

En enero de 2023, CircleCI sufrió una brecha de seguridad que expuso secretos de miles de organizaciones durante más de un mes.

### Cronología del Incidente:
- **Diciembre 2022**: Inicio del compromiso (no detectado)
- **29 Diciembre 2022**: Primer acceso no autorizado a sistemas de producción
- **4 Enero 2023**: CircleCI detecta actividad sospechosa
- **11 Enero 2023**: Notificación pública del incidente
- **Duración**: ~2 semanas de acceso activo no detectado

### Detalles del Compromiso:
- **Vector de Ataque**: Malware en laptop de empleado con privilegios de producción
- **Acceso Obtenido**: Sistemas de producción y datos de clientes
- **Secretos Comprometidos**: Variables de entorno, tokens de API, claves SSH
- **Organizaciones Afectadas**: Miles de empresas usando CircleCI

## 🔍 Tipos de Vulnerabilidades Simuladas

### 1. **Variables de Entorno en CI/CD** (`.circleci/config.yml`)
```yaml
environment:
  AWS_ACCESS_KEY_ID: AKIAIOSFODNN7EXAMPLE
  AWS_SECRET_ACCESS_KEY: wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
  GITHUB_TOKEN: ghp_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
```

### 2. **Archivos .env Committeados** (`.env`)
```bash
API_KEY=sk_live_51234567890abcdefghijklmnopqrstuvwxyz
DATABASE_PASSWORD=MySecretPassword123!
SENDGRID_API_KEY=SG.1234567890abcdefghijklmnopqrstuvwxyz.1234567890abcdefghijklmnopqrstuvwxyz
```

## 📁 Archivos en este Directorio:

1. **`.circleci/config.yml`**: Configuración CI/CD con secretos hardcodeados
2. **`.env`**: Variables de entorno con credenciales expuestas

## 🎯 Secretos Específicos Simulados:

### **Credenciales de AWS:**
- Access Key: `AKIAIOSFODNN7EXAMPLE`
- Secret Key: `wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY`

### **Tokens de GitHub:**
- Personal Access Token: `ghp_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx`

### **API Keys de Servicios:**
- Stripe: `sk_live_51234567890abcdefghijklmnopqrstuvwxyz`
- SendGrid: `SG.1234567890abcdefghijklmnopqrstuvwxyz.abcdef`
- Twilio: `1234567890abcdefghijklmnopqrstuvwxyz`
- Slack: `https://hooks.slack.com/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX`

### **Credenciales de Base de Datos:**
- PostgreSQL: `postgresql://admin:password123@db.example.com:5432/myapp`
- Redis: `redis://:password123@redis:6379`

### **Secretos de Autenticación:**
- JWT: `super-secret-jwt-key-that-should-not-be-here`
- Facebook App Secret: `1234567890abcdefghijklmnopqrstuvwxyz`

## 🔍 Comando para Escanear:

```bash
vault-radar scan repo ./circleci-case
```

## 📊 Findings Esperados:

- AWS Access Keys y Secret Keys
- GitHub Personal Access Tokens  
- Database connection strings con passwords
- JWT secrets en texto plano
- API keys de servicios de pago (Stripe)
- Tokens de comunicación (Slack, Twilio)
- Claves de servicios de email (SendGrid)
- Redis passwords

## 🛡️ Lecciones del Caso CircleCI:

1. **Seguridad de Endpoints**: Proteger laptops de empleados con acceso privilegiado
2. **Principio de Menor Privilegio**: Limitar acceso a sistemas de producción
3. **Detección de Anomalías**: Monitorear accesos inusuales a sistemas críticos
4. **Gestión de Secretos**: Usar herramientas como HashiCorp Vault en lugar de variables de entorno
5. **Rotación de Credenciales**: Implementar rotación automática de secretos
6. **Segmentación**: Aislar sistemas de producción de desarrollo

## 🚨 Impacto del Incidente Real:

- **Exposición Masiva**: Miles de organizaciones afectadas
- **Rotación Forzada**: Millones de secretos tuvieron que ser rotados
- **Pérdida de Confianza**: Impacto significativo en la reputación de CircleCI
- **Costos Operacionales**: Enormes costos de respuesta y remediación
- **Cadena de Suministro**: Compromiso de múltiples organizaciones downstream

## 🔧 Prevención con Vault Radar:

Este caso demuestra cómo Vault Radar habría podido:
- Detectar secretos hardcodeados en configuraciones CI/CD
- Identificar variables de entorno con credenciales
- Alertar sobre archivos .env committeados
- Prevenir la exposición masiva de secretos

La implementación de escaneo continuo con Vault Radar es esencial para prevenir incidentes similares.
