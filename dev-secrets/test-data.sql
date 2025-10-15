-- VULNERABILIDAD DEV: Datos de prueba con PII real
-- Development test data - DO NOT USE IN PRODUCTION

INSERT INTO users (id, username, email, ssn, credit_card, phone) VALUES
(1, 'testuser1', 'john.developer@company.com', '123-45-6789', '4532-1234-5678-9012', '555-123-4567'),
(2, 'testuser2', 'jane.tester@company.com', '987-65-4321', '5555-4444-3333-2222', '555-987-6543'),
(3, 'devuser', 'dev.user@company.com', '111-22-3333', '4111-1111-1111-1111', '555-111-2222');

-- VULNERABILIDAD: Passwords en texto plano
INSERT INTO admin_users (username, password, role) VALUES
('dev_admin', 'DevAdminPass123!', 'admin'),
('test_admin', 'TestPassword456!', 'admin'),
('qa_user', 'QAUserPass789!', 'qa');

-- VULNERABILIDAD: API keys de desarrollo (pero reales)
INSERT INTO api_keys (service, key_value, environment) VALUES
('stripe_dev', 'sk_test_51234567890abcdefghijklmnopqrstuvwxyz', 'development'),
('github_dev', 'ghp_dev1234567890abcdefghijklmnopqrstuvwxyz', 'development'),
('aws_dev', 'AKIAIOSFODNN7DEVEXAMPLE', 'development');

-- VULNERABILIDAD: Comentarios con lenguaje no inclusivo
-- TODO: Remove this ghetto hack once the retarded authentication is fixed
-- The guys in QA are being lazy about testing this shit

-- VULNERABILIDAD: Datos médicos de prueba (pero reales)
INSERT INTO patient_records (patient_id, ssn, diagnosis, insurance) VALUES
(1001, '444-55-6666', 'Hypertension', 'INS123456789'),
(1002, '777-88-9999', 'Diabetes', 'INS987654321');
