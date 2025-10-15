#!/bin/bash

# VULNERABILIDAD: Tokens hardcodeados en scripts (similar al caso Codecov)
CODECOV_TOKEN="12345678-1234-1234-1234-123456789012"
GITHUB_TOKEN="ghp_1234567890abcdefghijklmnopqrstuvwxyz12"
SONARQUBE_TOKEN="squ_1234567890abcdefghijklmnopqrstuvwxyz"

# Upload coverage to Codecov
curl -s https://codecov.io/bash | bash -s -- -t $CODECOV_TOKEN

# Create GitHub release
curl -H "Authorization: token $GITHUB_TOKEN" \
     -X POST \
     -d '{"tag_name":"v1.0.0","name":"Release v1.0.0"}' \
     https://api.github.com/repos/myorg/myrepo/releases

# SonarQube analysis
sonar-scanner -Dsonar.login=$SONARQUBE_TOKEN
