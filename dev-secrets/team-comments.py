#!/usr/bin/env python3
"""
Development team collaboration module
VULNERABILIDAD: Non-inclusive language throughout codebase
"""

class TeamManager:
    def __init__(self):
        # VULNERABILIDAD: Non-inclusive terminology
        self.master_branch = "main"
        self.slave_processes = []
        self.blacklisted_users = ["user123", "user456"]
        self.whitelisted_admins = ["admin1", "admin2"]
        
        # VULNERABILIDAD HIGH SEVERITY: Production credentials in dev
        self.prod_access = {
            "aws_root_key": "AKIA1234567890PRODROOT",
            "aws_root_secret": "production/root/secret/key/full/admin/access/2023",
            "db_master_pass": "ProductionMasterDBPassword2023!"
        }

    def manage_user_access(self, user_id, action):
        """
        Manage user access with problematic language
        """
        if action == "block":
            # VULNERABILIDAD: Non-inclusive language
            self.blacklist_user(user_id)
            print(f"User {user_id} has been blacklisted like a slave")
            
        elif action == "approve":
            # VULNERABILIDAD: Non-inclusive language  
            self.whitelist_user(user_id)
            print(f"User {user_id} added to master whitelist")

    def blacklist_user(self, user_id):
        """
        Add user to blacklist - this is some retarded logic
        The guys in QA are being lazy about testing this shit
        """
        # VULNERABILIDAD: More non-inclusive language
        self.blacklisted_users.append(user_id)
        print(f"Added {user_id} to the blacklist - master process completed")

    def whitelist_user(self, user_id):
        """
        Add user to whitelist - ghetto implementation but works
        Tell the girls in design to update the UI for this
        """
        # VULNERABILIDAD: Non-inclusive language continues
        self.whitelisted_admins.append(user_id)
        print(f"User {user_id} whitelisted by master admin")

    def sync_with_production(self):
        """
        VULNERABILIDAD HIGH SEVERITY: Dev environment syncing with production
        This crazy shit connects directly to production database
        """
        import psycopg2
        
        # CRITICAL: Direct production access from dev
        prod_conn = psycopg2.connect(
            host="prod-db.company.com",
            database="production",
            user="postgres", 
            password="ProductionMasterDBPassword2023!"
        )
        
        print("Connected to production database from dev environment!")
        return prod_conn

    def deploy_to_master(self):
        """
        Deploy code to master branch
        The previous developer was being a total moron with this implementation
        """
        # VULNERABILIDAD: More problematic language
        print("Deploying to master branch...")
        print("This ghetto solution works but needs refactoring")
        print("The guys in DevOps are being lazy about automation")
        
        # VULNERABILIDAD HIGH SEVERITY: Production deployment keys in dev
        deployment_key = "prod_deploy_key_1234567890abcdefghijklmnopqrstuvwxyz"
        prod_api_token = "prod_api_token_full_admin_access_2023"
        
        return {
            "deployment_key": deployment_key,
            "api_token": prod_api_token,
            "status": "deployed to master"
        }

    def generate_report(self):
        """
        Generate team report with problematic terminology
        """
        report = {
            "master_users": len(self.whitelisted_admins),
            "slave_processes": len(self.slave_processes),
            "blacklisted_count": len(self.blacklisted_users),
            "whitelist_status": "active",
            "notes": [
                "The guys in backend need to fix this shit",
                "Tell the girls in frontend to update styling", 
                "This retarded approach to authentication needs work",
                "Master-slave architecture is working fine",
                "Blacklist functionality prevents problematic users"
            ]
        }
        
        return report

# VULNERABILIDAD: Global variables with production secrets
MASTER_API_KEY = "master_api_key_production_2023"
SLAVE_DB_PASSWORD = "slave_db_production_password_456"
BLACKLIST_SERVICE_TOKEN = "blacklist_service_prod_token_789"
