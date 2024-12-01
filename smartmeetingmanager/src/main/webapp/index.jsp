<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Smart Meeting Manager</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        header {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            text-align: center;
        }
        nav {
            margin: 20px;
            text-align: center;
        }
        nav a {
            text-decoration: none;
            margin: 0 15px;
            padding: 10px 15px;
            color: white;
            background-color: #4CAF50;
            border-radius: 5px;
            font-weight: bold;
        }
        nav a:hover {
            background-color: #45a049;
        }
        footer {
            text-align: center;
            padding: 10px;
            position: fixed;
            bottom: 0;
            width: 100%;
            background-color: #4CAF50;
            color: white;
        }
    </style>
</head>
<body>
    <header>
        <h1>Smart Meeting Manager</h1>
    </header>

    <nav>
        <%
            HttpSession httpsession = request.getSession(false);
            String username = (session != null) ? (String) session.getAttribute("username") : null;

            if (username == null) {
        %>
            <a href="login.jsp">Login</a>
            <a href="register.jsp">Register</a>
        <%
            } else {
        %>
            <span>Welcome, <strong><%= username %></strong>!</span>
            <a href="MeetingController?action=list">Meeting List</a>
            <a href="createMeeting.jsp">Create Meeting</a> <!-- 추가 -->
            <a href="logout.jsp" style="background-color: #f44336;">Logout</a>
        <%
            }
        %>
    </nav>

    <footer>
        <p>&copy; 2024 Smart Meeting Manager. All rights reserved.</p>
    </footer>
</body>
</html>