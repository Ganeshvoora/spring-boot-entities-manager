package com.example.entitiesmanager.service;

import com.example.entitiesmanager.model.Department;
import com.example.entitiesmanager.model.Employee;
import com.example.entitiesmanager.repository.EmployeeRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

class EmployeeServiceTest {

    @Mock
    private EmployeeRepository employeeRepository;

    @InjectMocks
    private EmployeeService employeeService;

    @BeforeEach
    void setUp() {
        MockitoAnnotations.openMocks(this);
    }

    @Test
    void testGetAllEmployees() {
        Department dept = new Department("IT");
        Employee emp1 = new Employee("John", "john@test.com", dept);
        Employee emp2 = new Employee("Jane", "jane@test.com", dept);
        when(employeeRepository.findAllWithDepartment()).thenReturn(Arrays.asList(emp1, emp2));

        List<Employee> result = employeeService.getAllEmployees();
        assertEquals(2, result.size());
        verify(employeeRepository, times(1)).findAllWithDepartment();
    }

    @Test
    void testGetEmployeeById() {
        Department dept = new Department("IT");
        Employee emp = new Employee("John", "john@test.com", dept);
        emp.setId(1L);
        when(employeeRepository.findById(1L)).thenReturn(Optional.of(emp));

        Employee result = employeeService.getEmployeeById(1L);
        assertNotNull(result);
        assertEquals("John", result.getName());
    }

    @Test
    void testSaveEmployee() {
        Department dept = new Department("IT");
        Employee emp = new Employee("John", "john@test.com", dept);
        when(employeeRepository.save(emp)).thenReturn(emp);

        Employee result = employeeService.saveEmployee(emp);
        assertNotNull(result);
        assertEquals("John", result.getName());
    }

    @Test
    void testDeleteEmployee() {
        doNothing().when(employeeRepository).deleteById(1L);
        employeeService.deleteEmployee(1L);
        verify(employeeRepository, times(1)).deleteById(1L);
    }
}
