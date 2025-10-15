// VULNERABILIDAD: Lenguaje no inclusivo y PII en comentarios

/**
 * Employee management system
 * TODO: Fix the retarded logic in the authentication module
 * NOTE: The guys in the backend team are being lazy about this
 * HACK: This is a ghetto solution but it works for now
 */

class EmployeeManager {
    constructor() {
        // VULNERABILIDAD: PII de empleados hardcodeado
        this.employees = [
            {
                name: "John Smith",
                ssn: "123-45-6789",
                email: "john.smith@company.com",
                phone: "555-123-4567",
                salary: 75000,
                address: "123 Corporate Blvd, Business City, CA 90210"
            },
            {
                name: "Maria Garcia", 
                ssn: "987-65-4321",
                email: "maria.garcia@company.com",
                phone: "555-987-6543",
                salary: 82000,
                address: "456 Professional Ave, Work Town, NY 12345"
            }
        ];
        
        // VULNERABILIDAD: Comentarios con lenguaje no inclusivo
        // This blacklist contains problematic employees
        this.blacklist = ["emp123", "emp456"];
        
        // The whitelist has our preferred candidates
        this.whitelist = ["emp789", "emp101"];
    }
    
    // VULNERABILIDAD: Función con nombre no inclusivo
    blacklistEmployee(employeeId) {
        // This is some crazy shit that needs to be fixed
        // The previous developer was being a total moron
        this.blacklist.push(employeeId);
        console.log(`Employee ${employeeId} has been blacklisted like a slave`);
    }
    
    // VULNERABILIDAD: Más lenguaje problemático
    whitelistEmployee(employeeId) {
        // Add to master list of approved employees
        this.whitelist.push(employeeId);
        console.log(`Employee ${employeeId} added to master whitelist`);
    }
    
    // VULNERABILIDAD: PII en logs
    processPayroll() {
        this.employees.forEach(emp => {
            console.log(`Processing payroll for SSN: ${emp.ssn}, Salary: $${emp.salary}`);
            console.log(`Sending check to: ${emp.address}`);
        });
    }
}
