<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Employee Form</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700&display=swap');

        :root {
            --bg-gradient: linear-gradient(135deg, #0f172a 0%, #1e1b4b 100%);
            --card-bg: rgba(255, 255, 255, 0.05);
            --card-border: rgba(255, 255, 255, 0.1);
            --input-bg: rgba(0, 0, 0, 0.2);
            --input-border: rgba(255, 255, 255, 0.15);
            --input-focus: #818cf8;
            --text-main: #f8fafc;
            --text-muted: #94a3b8;
            --accent: #818cf8;
            --accent-hover: #6366f1;
            --danger-bg: rgba(239, 68, 68, 0.1);
            --danger-text: #fca5a5;
        }

        body {
            font-family: 'Outfit', sans-serif;
            margin: 0;
            min-height: 100vh;
            background: var(--bg-gradient);
            color: var(--text-main);
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .form-wrapper {
            width: 100%;
            max-width: 500px;
            animation: scaleIn 0.6s cubic-bezier(0.16, 1, 0.3, 1);
        }

        @keyframes scaleIn {
            from { opacity: 0; transform: scale(0.95); }
            to { opacity: 1; transform: scale(1); }
        }

        .form-container {
            background: var(--card-bg);
            backdrop-filter: blur(16px);
            border: 1px solid var(--card-border);
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.5);
        }

        h2 {
            font-size: 2rem;
            font-weight: 600;
            margin-top: 0;
            margin-bottom: 30px;
            text-align: center;
            color: #fff;
        }

        .form-group {
            margin-bottom: 24px;
        }

        label {
            display: block;
            font-size: 0.9rem;
            font-weight: 500;
            color: var(--text-muted);
            margin-bottom: 8px;
        }

        input[type="text"], select {
            width: 100%;
            padding: 14px 16px;
            background: var(--input-bg);
            border: 1px solid var(--input-border);
            border-radius: 10px;
            color: #fff;
            font-family: 'Outfit', sans-serif;
            font-size: 1rem;
            box-sizing: border-box;
            transition: all 0.3s ease;
        }

        input[type="text"]:focus, select:focus {
            outline: none;
            border-color: var(--input-focus);
            box-shadow: 0 0 0 3px rgba(129, 140, 248, 0.2);
            background: rgba(0, 0, 0, 0.3);
        }

        select option {
            background: #1e293b;
            color: #fff;
        }

        .error {
            color: var(--danger-text);
            font-size: 0.85rem;
            margin-top: 6px;
            display: block;
        }

        .alert-error {
            padding: 14px 16px;
            background: var(--danger-bg);
            color: var(--danger-text);
            border-left: 4px solid var(--danger-text);
            border-radius: 8px;
            margin-bottom: 24px;
            font-weight: 500;
        }

        .actions {
            display: flex;
            gap: 15px;
            margin-top: 35px;
        }

        .btn {
            flex: 1;
            padding: 14px;
            font-size: 1rem;
            font-weight: 600;
            text-align: center;
            border-radius: 10px;
            transition: all 0.3s ease;
            cursor: pointer;
            border: none;
            font-family: 'Outfit', sans-serif;
        }

        .btn-primary {
            background: linear-gradient(135deg, var(--accent), var(--accent-hover));
            color: white;
            box-shadow: 0 4px 15px rgba(99, 102, 241, 0.3);
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(99, 102, 241, 0.4);
        }

        .btn-cancel {
            background: rgba(255, 255, 255, 0.1);
            color: #cbd5e1;
            text-decoration: none;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .btn-cancel:hover {
            background: rgba(255, 255, 255, 0.15);
            color: #fff;
        }
    </style>
</head>
<body>

<div class="form-wrapper">
    <div class="form-container">
        <h2>${employee.id == null ? 'Add New Employee' : 'Edit Employee'}</h2>

        <c:if test="${not empty errorMessage}">
            <div class="alert-error">${errorMessage}</div>
        </c:if>

        <c:url var="actionUrl" value="${employee.id == null ? '/employees/save' : '/employees/update/'.concat(employee.id)}" />

        <form:form action="${actionUrl}" modelAttribute="employee" method="post">
            <div class="form-group">
                <label for="name">Full Name</label>
                <form:input path="name" id="name" placeholder="e.g. Jane Doe" />
                <form:errors path="name" cssClass="error" />
            </div>

            <div class="form-group">
                <label for="email">Email Address</label>
                <form:input path="email" id="email" placeholder="jane@example.com" />
                <form:errors path="email" cssClass="error" />
            </div>

            <div class="form-group">
                <label for="department">Department</label>
                <form:select path="department" id="department">
                    <form:option value="" label="-- Select Department --"/>
                    <form:options items="${departments}" itemValue="id" itemLabel="name" />
                </form:select>
                <form:errors path="department" cssClass="error" />
            </div>

            <div class="actions">
                <a href="<c:url value='/employees'/>" class="btn btn-cancel">Cancel</a>
                <button type="submit" class="btn btn-primary">Save Employee</button>
            </div>
        </form:form>
    </div>
</div>

</body>
</html>
