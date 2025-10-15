import psycopg2
import mysql.connector
from pymongo import MongoClient

class DatabaseConnector:
    def __init__(self):
        # VULNERABILIDAD: Credenciales hardcodeadas en código fuente
        self.postgres_config = {
            'host': 'prod-db.toyota-internal.com',
            'database': 'toyota_production',
            'user': 'admin',
            'password': 'Toyota123!Production',
            'port': 5432
        }
        
        self.mysql_config = {
            'host': 'mysql.toyota.com',
            'database': 'vehicle_data',
            'user': 'root',
            'password': 'MySQLRootPass2023!',
            'port': 3306
        }
        
        # MongoDB connection string with credentials
        self.mongo_uri = "mongodb://toyota_admin:MongoPass123!@cluster.toyota.mongodb.net/production?retryWrites=true"
        
        # Redis connection
        self.redis_password = "RedisSecretKey2023!"
        
        # API Keys for external services
        self.api_keys = {
            'weather_api': 'wapi_key_1234567890abcdefghijklmnop',
            'maps_api': 'AIzaSyDdI0hCZtE6vySjMm-WEfRq3CPzqKqqsHI',
            'payment_gateway': 'pk_live_51234567890abcdefghijklmnopqrstuvwxyz'
        }

    def connect_postgres(self):
        return psycopg2.connect(**self.postgres_config)
    
    def connect_mysql(self):
        return mysql.connector.connect(**self.mysql_config)
    
    def connect_mongo(self):
        return MongoClient(self.mongo_uri)
