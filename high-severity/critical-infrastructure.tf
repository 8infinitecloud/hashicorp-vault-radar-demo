# VULNERABILIDAD CRÍTICA: Infraestructura de producción con secretos hardcodeados

terraform {
  backend "s3" {
    bucket = "company-terraform-state"
    key    = "production/terraform.tfstate"
    region = "us-east-1"
    # VULNERABILIDAD CRÍTICA: Credenciales de acceso al state de producción
    access_key = "AKIA1234567890PRODROOT"
    secret_key = "production/root/secret/key/with/full/admin/access/2023"
  }
}

provider "aws" {
  region = "us-east-1"
  # VULNERABILIDAD CRÍTICA: Root account credentials hardcodeadas
  access_key = "AKIA1234567890ROOTACCT"
  secret_key = "root/account/secret/key/full/admin/access/production/2023"
}

# VULNERABILIDAD CRÍTICA: RDS con credenciales de root hardcodeadas
resource "aws_db_instance" "production" {
  identifier = "production-database"
  engine     = "postgres"
  engine_version = "13.7"
  instance_class = "db.r5.xlarge"
  allocated_storage = 1000
  
  # VULNERABILIDAD CRÍTICA: Master password hardcodeado
  username = "postgres"
  password = "ProductionMasterDBPassword2023!"
  
  # VULNERABILIDAD: Base de datos pública
  publicly_accessible = true
  
  # VULNERABILIDAD: Sin encriptación
  storage_encrypted = false
  
  tags = {
    Environment = "production"
    # VULNERABILIDAD: Información sensible en tags
    MasterPassword = "ProductionMasterDBPassword2023!"
    AdminContact = "admin@company.com"
  }
}

# VULNERABILIDAD CRÍTICA: S3 bucket público con datos sensibles
resource "aws_s3_bucket" "sensitive_data" {
  bucket = "company-production-sensitive-data"
  
  tags = {
    Environment = "production"
    Contains = "PII, Financial Records, Medical Data"
  }
}

resource "aws_s3_bucket_public_access_block" "sensitive_data" {
  bucket = aws_s3_bucket.sensitive_data.id
  
  # VULNERABILIDAD CRÍTICA: Bucket público
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# VULNERABILIDAD CRÍTICA: IAM user con políticas de administrador
resource "aws_iam_user" "service_account" {
  name = "production-service-account"
  
  tags = {
    Purpose = "Full admin access for production services"
    # VULNERABILIDAD: Credenciales en tags
    AccessKey = "AKIA1234567890SVCACCT"
    SecretKey = "service/account/secret/key/full/admin/2023"
  }
}

resource "aws_iam_user_policy_attachment" "service_account_admin" {
  user       = aws_iam_user.service_account.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

# VULNERABILIDAD CRÍTICA: Security group completamente abierto
resource "aws_security_group" "production_sg" {
  name_prefix = "production-"
  
  # VULNERABILIDAD CRÍTICA: Todo el tráfico permitido desde cualquier lugar
  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# VULNERABILIDAD: Instancia EC2 con user_data que contiene secretos críticos
resource "aws_instance" "production_app" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "m5.2xlarge"
  
  # VULNERABILIDAD CRÍTICA: Secretos de producción en user_data
  user_data = <<-EOF
    #!/bin/bash
    
    # Production database credentials
    export PROD_DB_PASSWORD="ProductionMasterDBPassword2023!"
    export PROD_DB_CONNECTION="postgresql://postgres:ProductionMasterDBPassword2023!@prod-db.company.com:5432/production"
    
    # Production API keys
    export STRIPE_LIVE_SECRET="sk_live_51234567890abcdefghijklmnopqrstuvwxyz"
    export PAYPAL_PRODUCTION_SECRET="paypal_live_secret_1234567890abcdefghijklmnop"
    
    # Production encryption keys
    export ENCRYPTION_MASTER_KEY="production-master-encryption-key-2023-critical"
    export JWT_PRIVATE_KEY="production-jwt-private-signing-key-2023"
    
    # Production service account keys
    export AWS_ROOT_ACCESS_KEY="AKIA1234567890ROOTACCT"
    export AWS_ROOT_SECRET_KEY="root/account/secret/key/full/admin/access/production/2023"
    
    # Setup production application
    echo "PROD_ADMIN_PASSWORD=ProductionAdminRootPass2023!" > /app/.env
    echo "SUPERUSER_PASSWORD=ProductionSuperUserPass456!" >> /app/.env
  EOF
  
  tags = {
    Name = "Production-Application-Server"
    Environment = "production"
    # VULNERABILIDAD: Más secretos en tags
    AdminPassword = "ProductionAdminRootPass2023!"
    DatabasePassword = "ProductionMasterDBPassword2023!"
  }
}
