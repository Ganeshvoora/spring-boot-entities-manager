<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Employee Management</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700&display=swap');

        :root {
            --bg-gradient: linear-gradient(135deg, #0f172a 0%, #1e1b4b 100%);
            --card-bg: rgba(255, 255, 255, 0.05);
            --card-border: rgba(255, 255, 255, 0.1);
            --text-main: #f8fafc;
            --text-muted: #94a3b8;
            --accent: #818cf8;
            --accent-hover: #6366f1;
            --danger: #fb7185;
            --danger-hover: #e11d48;
            --success-bg: rgba(34, 197, 94, 0.1);
            --success-text: #4ade80;
        }

        body {
            font-family: 'Outfit', sans-serif;
            margin: 0;
            min-height: 100vh;
            background: var(--bg-gradient);
            color: var(--text-main);
            display: flex;
            justify-content: center;
            padding: 40px 20px;
        }

        .container {
            width: 100%;
            max-width: 1000px;
            animation: fadeIn 0.8s ease-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .top-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }

        h2 {
            font-size: 2.2rem;
            font-weight: 700;
            margin: 0;
            background: linear-gradient(to right, #a5b4fc, #c4b5fd);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .btn {
            display: inline-flex;
            align-items: center;
            padding: 12px 24px;
            font-size: 1rem;
            font-weight: 500;
            color: #fff;
            background: linear-gradient(135deg, var(--accent), var(--accent-hover));
            border-radius: 8px;
            text-decoration: none;
            box-shadow: 0 4px 15px rgba(99, 102, 241, 0.3);
            transition: all 0.3s ease;
            border: none;
            cursor: pointer;
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(99, 102, 241, 0.4);
        }

        .table-wrapper {
            background: var(--card-bg);
            backdrop-filter: blur(12px);
            border: 1px solid var(--card-border);
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.2);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            text-align: left;
        }

        th, td {
            padding: 16px 20px;
            border-bottom: 1px solid var(--card-border);
        }

        th {
            background: rgba(255, 255, 255, 0.03);
            font-weight: 600;
            color: #cbd5e1;
            text-transform: uppercase;
            font-size: 0.85rem;
            letter-spacing: 0.05em;
        }

        tr {
            transition: background-color 0.3s ease;
        }

        tr:hover {
            background-color: rgba(255, 255, 255, 0.05);
        }

        tr:last-child td {
            border-bottom: none;
        }

        .action-link {
            text-decoration: none;
            font-weight: 500;
            margin-right: 15px;
            transition: color 0.3s ease;
        }

        .edit-link { color: var(--accent); }
        .edit-link:hover { color: #a5b4fc; }

        .delete-link { color: var(--danger); }
        .delete-link:hover { color: #fda4af; }

        .alert {
            padding: 16px 20px;
            background: var(--success-bg);
            color: var(--success-text);
            border-left: 4px solid var(--success-text);
            border-radius: 8px;
            margin-bottom: 25px;
            font-weight: 500;
            animation: slideIn 0.5s ease-out;
        }

        @keyframes slideIn {
            from { opacity: 0; transform: translateX(-20px); }
            to { opacity: 1; transform: translateX(0); }
        }
    </style>
</head>
<body>

<div class="container">
    <c:if test="${not empty successMessage}">
        <div class="alert">${successMessage}</div>
    </c:if>

    <div class="top-bar">
        <h2>Employee Directory</h2>
        <a href="<c:url value='/employees/new'/>" class="btn">+ Add New Employee</a>
    </div>

    <div class="table-wrapper">
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Department</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="emp" items="${employees}">
                    <tr>
                        <td>#${emp.id}</td>
                        <td><strong>${emp.name}</strong></td>
                        <td>${emp.email}</td>
                        <td><span style="background: rgba(255,255,255,0.1); padding: 4px 10px; border-radius: 12px; font-size: 0.85em;">${emp.department.name}</span></td>
                        <td>
                            <a class="action-link edit-link" href="<c:url value='/employees/edit/${emp.id}'/>">Edit</a>
                            <a class="action-link delete-link" href="<c:url value='/employees/delete/${emp.id}'/>" onclick="return confirm('Are you sure you want to delete this employee?');">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
