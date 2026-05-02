package com.example.entitiesmanager;

import com.example.entitiesmanager.model.Department;
import com.example.entitiesmanager.model.Employee;
import com.example.entitiesmanager.repository.DepartmentRepository;
import com.example.entitiesmanager.repository.EmployeeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

@Component
public class DataInitializer implements CommandLineRunner {

    private final DepartmentRepository departmentRepository;
    private final EmployeeRepository employeeRepository;

    @Autowired
    public DataInitializer(DepartmentRepository departmentRepository, EmployeeRepository employeeRepository) {
        this.departmentRepository = departmentRepository;
        this.employeeRepository = employeeRepository;
    }

    @Override
    public void run(String... args) throws Exception {
        if (departmentRepository.count() == 0 && employeeRepository.count() == 0) {
            // Create 10 Departments
            Department d1 = departmentRepository.save(new Department("HR"));
            Department d2 = departmentRepository.save(new Department("IT"));
            Department d3 = departmentRepository.save(new Department("Finance"));
            Department d4 = departmentRepository.save(new Department("Marketing"));
            Department d5 = departmentRepository.save(new Department("Sales"));
            Department d6 = departmentRepository.save(new Department("Legal"));
            Department d7 = departmentRepository.save(new Department("Operations"));
            Department d8 = departmentRepository.save(new Department("R&D"));
            Department d9 = departmentRepository.save(new Department("Customer Support"));
            Department d10 = departmentRepository.save(new Department("Admin"));

            // Create 10 Employees
            employeeRepository.save(new Employee("Alice Smith", "alice@example.com", d1));
            employeeRepository.save(new Employee("Bob Johnson", "bob@example.com", d2));
            employeeRepository.save(new Employee("Charlie Davis", "charlie@example.com", d3));
            employeeRepository.save(new Employee("Diana Prince", "diana@example.com", d4));
            employeeRepository.save(new Employee("Evan Wright", "evan@example.com", d5));
            employeeRepository.save(new Employee("Fiona Gallagher", "fiona@example.com", d6));
            employeeRepository.save(new Employee("George Mason", "george@example.com", d7));
            employeeRepository.save(new Employee("Hannah Abbott", "hannah@example.com", d8));
            employeeRepository.save(new Employee("Ian Malcolm", "ian@example.com", d9));
            employeeRepository.save(new Employee("Jane Doe", "jane@example.com", d10));
        }
    }
}
