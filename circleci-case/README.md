# Caso CircleCI - Variables de Entorno Expuestas

Este directorio simula el caso de CircleCI donde secretos fueron expuestos en variables de entorno.

## Vulnerabilidades Incluidas:

1. **Archivo .circleci/config.yml**: Secretos hardcodeados en variables de entorno
2. **Archivo .env**: Archivo de entorno committeado con secretos

## Tipos de Secretos:
- AWS Access Keys
- GitHub Personal Access Tokens
- Database URLs con credenciales
- JWT Secrets
- API Keys de Stripe, Slack, SendGrid, Twilio
- Passwords de Redis

## Comando para escanear:
```bash
vault-radar scan repo ./circleci-case
```
