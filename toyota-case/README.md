# Caso Toyota - Credenciales Expuestas en Código Fuente

Este directorio simula el incidente de seguridad de Toyota de 2022 donde credenciales fueron expuestas en repositorios de código fuente.

## 🚨 Incidente Real de Toyota (2022)

En octubre de 2022, Toyota Motor Corporation reveló que las claves de acceso a su entorno de desarrollo en la nube estuvieron expuestas públicamente durante casi 5 años en un repositorio de GitHub.

### Detalles del Incidente:
- **Duración**: Diciembre 2017 - Septiembre 2022 (casi 5 años)
- **Exposición**: Claves de acceso a sistemas de desarrollo en la nube
- **Causa**: Credenciales hardcodeadas en código fuente
- **Impacto**: Acceso potencial a datos de clientes y información corporativa

## 🔍 Tipos de Vulnerabilidades Simuladas

### 1. **Credenciales en Código Python** (`database.py`)
```python
self.postgres_config = {
    'password': 'Toyota123!Production'
}
```

### 2. **Configuraciones Spring** (`application.yml`)
```yaml
spring:
  datasource:
    password: ToyotaSpringPass2023!
```

### 3. **Archivos de Propiedades** (`config.properties`)
```properties
database.password=Toyota123!Production
jwt.secret=super-secret-jwt-key-production-2023
```

### 4. **Claves SSH Privadas** (`ssh_key`)
```
-----BEGIN RSA PRIVATE KEY-----
MIIEpAIBAAKCAQEA1234567890abcdef...
-----END RSA PRIVATE KEY-----
```

## 📁 Archivos en este Directorio:

1. **`database.py`**: Credenciales de DB hardcodeadas en Python
2. **`config.properties`**: Archivo de configuración con secretos
3. **`application.yml`**: Configuración Spring con passwords
4. **`ssh_key`**: Clave SSH privada expuesta

## 🎯 Vulnerabilidades Específicas:

### **Credenciales de Base de Datos:**
- PostgreSQL: `Toyota123!Production`
- MySQL: `MySQLRootPass2023!`
- MongoDB: `MongoPass123!`
- Redis: `RedisSecretKey2023!`

### **API Keys Expuestas:**
- Weather API: `wapi_key_1234567890abcdefghijklmnop`
- Google Maps: `AIzaSyDdI0hCZtE6vySjMm-WEfRq3CPzqKqqsHI`
- Stripe: `pk_live_51234567890abcdefghijklmnopqrstuvwxyz`

### **Tokens de Autenticación:**
- JWT Secret: `toyota-jwt-super-secret-key-production-2023`
- OAuth Client Secret: `toyota_github_client_secret_1234567890abcdef`

### **Claves de Encriptación:**
- Stripe Webhook: `whsec_toyota_1234567890abcdefghijklmnopqrstuvwxyz`

## 🔍 Comando para Escanear:

```bash
vault-radar scan repo ./toyota-case
```

## 📊 Findings Esperados:

- Database connection strings con passwords
- API keys hardcodeadas
- JWT secrets en texto plano
- SSH private keys
- OAuth client secrets
- Webhook secrets
- Redis passwords

## 🛡️ Lecciones del Caso Toyota:

1. **Nunca hardcodear credenciales** en código fuente
2. **Usar gestores de secretos** como HashiCorp Vault
3. **Implementar escaneo automático** con herramientas como Vault Radar
4. **Rotar credenciales** regularmente
5. **Monitorear repositorios públicos** en busca de secretos expuestos
6. **Entrenar desarrolladores** sobre mejores prácticas de seguridad

## 🚨 Impacto Potencial:

- Acceso no autorizado a bases de datos de producción
- Compromiso de sistemas de desarrollo
- Exposición de datos de clientes
- Uso fraudulento de APIs de terceros
- Acceso a sistemas internos vía SSH

Este caso demuestra la importancia crítica de usar herramientas como Vault Radar para detectar y prevenir la exposición de credenciales en repositorios de código.
