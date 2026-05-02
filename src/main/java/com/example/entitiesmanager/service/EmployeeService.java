package com.example.entitiesmanager.service;

import com.example.entitiesmanager.model.Employee;
import com.example.entitiesmanager.repository.EmployeeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeService {

    private final EmployeeRepository employeeRepository;

    @Autowired
    public EmployeeService(EmployeeRepository employeeRepository) {
        this.employeeRepository = employeeRepository;
    }

    public List<Employee> getAllEmployees() {
        // Using the custom inner join query as required
        return employeeRepository.findAllWithDepartment();
    }

    public Employee getEmployeeById(Long id) {
        return employeeRepository.findById(id).orElseThrow(() -> new IllegalArgumentException("Invalid employee Id:" + id));
    }

    public Employee saveEmployee(Employee employee) {
        try {
            return employeeRepository.save(employee);
        } catch (Exception e) {
            // Wrapping in a generic exception for simplicity, can be handled globally or specifically in controller
            throw new RuntimeException("Error saving employee due to integrity violation: " + e.getMessage());
        }
    }

    public void deleteEmployee(Long id) {
        employeeRepository.deleteById(id);
    }
}
