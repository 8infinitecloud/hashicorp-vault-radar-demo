#!/usr/bin/env python3
"""
Customer data processing module
VULNERABILIDAD: PII hardcodeado en código fuente
"""

class CustomerProcessor:
    def __init__(self):
        # VULNERABILIDAD PII: Información personal hardcodeada
        self.test_customers = [
            {
                "ssn": "123-45-6789",
                "credit_card": "4532-1234-5678-9012",
                "email": "john.doe@gmail.com",
                "phone": "+1-555-123-4567",
                "address": "123 Main St, Anytown, CA 90210",
                "drivers_license": "D1234567",
                "passport": "123456789"
            },
            {
                "ssn": "987-65-4321", 
                "credit_card": "5555-4444-3333-2222",
                "email": "jane.smith@yahoo.com",
                "phone": "+1-555-987-6543",
                "address": "456 Oak Ave, Springfield, NY 12345",
                "drivers_license": "D9876543",
                "passport": "987654321"
            }
        ]
        
        # VULNERABILIDAD: Datos médicos sensibles
        self.medical_records = {
            "patient_123": {
                "ssn": "111-22-3333",
                "diagnosis": "Diabetes Type 2",
                "medications": ["Metformin", "Insulin"],
                "insurance_id": "INS123456789"
            }
        }
        
        # VULNERABILIDAD: Información financiera
        self.bank_accounts = [
            {"account": "1234567890", "routing": "021000021", "ssn": "444-55-6666"},
            {"account": "0987654321", "routing": "011401533", "ssn": "777-88-9999"}
        ]

    def process_payment(self):
        # VULNERABILIDAD: CVV y datos de tarjeta en logs
        credit_card = "4111-1111-1111-1111"
        cvv = "123"
        expiry = "12/25"
        
        print(f"Processing payment with card: {credit_card}, CVV: {cvv}, Expiry: {expiry}")
        
        # VULNERABILIDAD: SSN en logs
        ssn = "123-45-6789"
        print(f"Customer SSN: {ssn}")
        
        return True
