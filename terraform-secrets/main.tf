terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  # VULNERABILIDAD: Credenciales hardcodeadas en Terraform
  access_key = "AKIAIOSFODNN7EXAMPLE"
  secret_key = "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"
}

resource "aws_instance" "web" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t3.micro"
  
  # VULNERABILIDAD: Secretos en user_data
  user_data = <<-EOF
    #!/bin/bash
    export DATABASE_PASSWORD="TerraformSecretPass123!"
    export API_KEY="sk_live_51234567890abcdefghijklmnopqrstuvwxyz"
    export JWT_SECRET="terraform-jwt-secret-2023"
    
    # Setup application
    echo "DATABASE_URL=postgresql://admin:TerraformSecretPass123!@db.company.com:5432/prod" > /app/.env
    echo "REDIS_PASSWORD=TerraformRedisPass123!" >> /app/.env
  EOF

  tags = {
    Name = "WebServer"
    # VULNERABILIDAD: Información sensible en tags
    DatabasePassword = "TerraformSecretPass123!"
    APIKey = "sk_live_51234567890abcdefghijklmnopqrstuvwxyz"
  }
}

resource "aws_db_instance" "main" {
  identifier = "main-database"
  engine     = "postgres"
  
  # VULNERABILIDAD: Credenciales de DB hardcodeadas
  username = "admin"
  password = "PostgresTerraformPass2023!"
  
  allocated_storage = 20
  instance_class    = "db.t3.micro"
}
