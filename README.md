# Spring Boot Entities Manager

A complete Spring Boot MVC application to manage **Department** and **Employee** entities.

## Features Built
- **Create, Read, Update** and Delete operations.
- **Embedded Database**: H2 in-memory database used for zero-setup execution.
- **Auto-Population**: The database starts prepopulated with 10 Departments and 10 Employees.
- **Custom Join Query**: Repository utilizes `@Query("SELECT e FROM Employee e JOIN FETCH e.department")` for optimized reads.
- **Validation**: Server-side integrity checks and user-friendly error messages on form submission.
- **Unit Tests**: Full suite for the service and repository layers using JUnit 5 + Mockito.

## Requirements
- Java 11+
- Maven

## How to Run

1. Open a terminal in this directory.
2. Run tests to ensure everything is functioning correctly:
   ```bash
   mvn clean test
   ```
3. Start the Spring Boot application:
   ```bash
   mvn spring-boot:run
   ```
4. Open your web browser and go to:
   ```text
   http://localhost:8080/
   ```

## Folder Structure
- `src/main/java/.../model/`: JPA Entities
- `src/main/java/.../repository/`: Data layer (Spring Data JPA)
- `src/main/java/.../service/`: Business Logic
- `src/main/java/.../controller/`: Spring MVC Controllers
- `src/main/webapp/WEB-INF/jsp/`: JSP View Templates
- `src/test/java/.../`: Unit & Integration Tests
