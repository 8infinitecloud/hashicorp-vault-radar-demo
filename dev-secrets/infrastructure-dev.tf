# VULNERABILIDAD HIGH SEVERITY: Dev Terraform pointing to production resources

terraform {
  backend "s3" {
    bucket = "company-terraform-state"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
    # CRITICAL: Production state access from dev
    access_key = "AKIA1234567890PRODROOT"
    secret_key = "production/root/secret/key/full/admin/access/2023"
  }
}

provider "aws" {
  region = "us-east-1"
  # CRITICAL: Root credentials in dev terraform
  access_key = "AKIA1234567890PRODROOT"
  secret_key = "production/root/secret/key/full/admin/access/2023"
}

# VULNERABILIDAD: Non-inclusive naming
resource "aws_iam_role" "master_role" {
  name = "dev-master-role"
  
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
  
  tags = {
    Name = "Master Role for Dev"
    Type = "master"
    # CRITICAL: Production secrets in tags
    ProductionDBPassword = "ProductionMasterDBPassword2023!"
    ProductionAPIKey = "prod_api_key_full_admin_access_2023"
  }
}

# VULNERABILIDAD: More non-inclusive naming
resource "aws_iam_policy" "slave_policy" {
  name = "dev-slave-policy"
  
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = "*"
        Resource = "*"
      }
    ]
  })
}

# CRITICAL: Dev instance with production access
resource "aws_instance" "dev_server" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t3.micro"
  
  user_data = <<-EOF
    #!/bin/bash
    # CRITICAL: Production credentials in dev user_data
    export PROD_DB_PASSWORD="ProductionMasterDBPassword2023!"
    export PROD_API_KEY="prod_api_key_full_admin_access_2023"
    export AWS_ROOT_ACCESS_KEY="AKIA1234567890PRODROOT"
    export AWS_ROOT_SECRET_KEY="production/root/secret/key/full/admin/access/2023"
    
    # Setup dev environment with prod access
    echo "DEV_ENV=development" > /app/.env
    echo "PROD_ACCESS=true" >> /app/.env
    echo "PROD_DB_PASSWORD=ProductionMasterDBPassword2023!" >> /app/.env
  EOF
  
  tags = {
    Name = "Dev-Server-With-Prod-Access"
    Environment = "development"
    # CRITICAL: More production secrets
    MasterPassword = "ProductionMasterDBPassword2023!"
    SlavePassword = "slave_db_production_password_456"
  }
}
