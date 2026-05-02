package com.example.entitiesmanager.repository;

import com.example.entitiesmanager.model.Department;
import com.example.entitiesmanager.model.Employee;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

@DataJpaTest
class EmployeeRepositoryTest {

    @Autowired
    private TestEntityManager entityManager;

    @Autowired
    private EmployeeRepository employeeRepository;

    @Test
    void testFindAllWithDepartment() {
        Department dept = new Department("Engineering");
        entityManager.persist(dept);
        
        Employee emp1 = new Employee("Alice", "alice@test.com", dept);
        Employee emp2 = new Employee("Bob", "bob@test.com", dept);
        entityManager.persist(emp1);
        entityManager.persist(emp2);
        entityManager.flush();

        List<Employee> employees = employeeRepository.findAllWithDepartment();
        
        // Since DataInitializer might run or might not depending on context,
        // we check if the list contains at least the 2 we just added.
        // Actually, @DataJpaTest doesn't load CommandLineRunner by default, so it's clean.
        assertEquals(2, employees.size());
        assertNotNull(employees.get(0).getDepartment());
        assertEquals("Engineering", employees.get(0).getDepartment().getName());
    }
}
