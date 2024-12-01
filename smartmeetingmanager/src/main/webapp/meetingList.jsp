<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.smartmeetingmanager.model.Meeting"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회의 목록</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f4f4f4;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        a.create-btn {
            display: inline-block;
            margin-bottom: 20px;
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        a.create-btn:hover {
            background-color: #0056b3;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 0 auto;
            background-color: #fff;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 12px;
            text-align: center;
            border: 1px solid #ddd;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        button {
            padding: 8px 15px;
            border: none;
            background-color: #28a745;
            color: white;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        button:hover {
            background-color: #218838;
        }
        form {
            display: inline-block;
        }
    </style>
</head>
<body>
    <h1>회의 목록</h1>
    <div style="text-align: center;">
        <a href="createMeeting.jsp" class="create-btn">회의 생성</a>
    </div>
    <table>
        <thead>
            <tr>
                <th>회의 ID</th>
                <th>제목</th>
                <th>설명</th>
                <th>시작 시간</th>
                <th>종료 시간</th>
                <th>관리</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<Meeting> meetings = (List<Meeting>) request.getAttribute("meetings");
                if (meetings != null && !meetings.isEmpty()) {
                    for (Meeting meeting : meetings) {
            %>
            <tr>
                <td><%= meeting.getId() %></td>
                <td><%= meeting.getTitle() %></td>
                <td><%= meeting.getDescription() %></td>
                <td><%= meeting.getStartTime() %></td>
                <td><%= meeting.getEndTime() %></td>
                <td>
                    <a href="MeetingController?action=details&id=<%= meeting.getId() %>">상세보기</a>
                    <form action="MeetingController" method="post" style="display:inline;">
                        <input type="hidden" name="action" value="join">
                        <input type="hidden" name="meetingId" value="<%= meeting.getId() %>">
                        <input type="text" name="username" placeholder="사용자 이름" required>
                        <button type="submit">참가</button>
                    </form>
                </td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="6">회의가 없습니다.</td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
</body>
</html>