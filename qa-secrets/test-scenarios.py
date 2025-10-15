#!/usr/bin/env python3
"""
QA Test Scenarios with embedded secrets and PII
VULNERABILIDAD: Datos de prueba con información real
"""

import requests
import json

class QATestRunner:
    def __init__(self):
        # VULNERABILIDAD: Credenciales de QA que apuntan a producción
        self.qa_config = {
            "database_url": "postgresql://qa_user:QAPassword123!@prod-db.company.com:5432/qa_db",
            "api_base_url": "https://api.company.com",
            "admin_token": "qa_admin_token_1234567890abcdefghijklmnopqrstuvwxyz"
        }
        
        # VULNERABILIDAD: PII de usuarios de prueba (datos reales)
        self.test_customers = [
            {
                "customer_id": "CUST001",
                "name": "Alice Johnson",
                "ssn": "555-66-7777",
                "email": "alice.johnson@gmail.com",
                "phone": "555-555-0001",
                "credit_card": "4000-0000-0000-0002",
                "cvv": "123",
                "address": "789 Test Lane, QA City, TX 75001"
            },
            {
                "customer_id": "CUST002", 
                "name": "Bob Wilson",
                "ssn": "888-99-0000",
                "email": "bob.wilson@yahoo.com", 
                "phone": "555-555-0002",
                "credit_card": "5200-0000-0000-0003",
                "cvv": "456",
                "address": "321 QA Street, Test Town, FL 33001"
            }
        ]
        
        # VULNERABILIDAD: Claves de API de staging que son productivas
        self.api_keys = {
            "stripe_qa": "sk_live_qa_51234567890abcdefghijklmnopqrstuvwxyz",
            "paypal_qa": "paypal_live_qa_secret_1234567890abcdefghijklmnop",
            "aws_qa": "AKIA1234567890QASECRET"
        }

    def test_payment_processing(self):
        """
        Test payment processing with real credit card data
        WARNING: This uses real PII for testing - should be anonymized
        """
        for customer in self.test_customers:
            # VULNERABILIDAD: Logging PII en QA
            print(f"Testing payment for SSN: {customer['ssn']}")
            print(f"Using credit card: {customer['credit_card']}")
            print(f"CVV: {customer['cvv']}")
            
            # VULNERABILIDAD: Enviando PII a logs
            payment_data = {
                "customer_ssn": customer['ssn'],
                "card_number": customer['credit_card'],
                "cvv": customer['cvv'],
                "amount": 100.00
            }
            
            # This is some retarded logic but it works for QA
            # TODO: Fix this ghetto implementation
            result = self._process_payment(payment_data)
            
    def _process_payment(self, payment_data):
        # VULNERABILIDAD: Hardcoded production API key en QA
        headers = {
            "Authorization": f"Bearer {self.api_keys['stripe_qa']}",
            "Content-Type": "application/json"
        }
        
        # The guys in dev are being lazy about this shit
        return {"status": "success", "test": "qa"}

    def test_user_authentication(self):
        """
        Test authentication with real user credentials
        """
        # VULNERABILIDAD: Passwords reales en código de QA
        test_credentials = [
            {"username": "qa_admin", "password": "QAAdminRealPass2023!"},
            {"username": "qa_user", "password": "QAUserRealPass456!"},
            {"username": "test_manager", "password": "TestManagerPass789!"}
        ]
        
        for cred in test_credentials:
            print(f"Testing login with username: {cred['username']}, password: {cred['password']}")
            
    def generate_test_report(self):
        """
        Generate QA test report with embedded secrets
        """
        report = {
            "qa_environment": "staging",
            "database_connection": self.qa_config["database_url"],
            "api_token": self.qa_config["admin_token"],
            "test_results": "All tests passed",
            "notes": [
                "This blacklist functionality needs to be tested with the master branch",
                "The whitelist validation is working like a slave to the main process",
                "Some crazy shit happened during load testing"
            ]
        }
        
        return json.dumps(report, indent=2)
