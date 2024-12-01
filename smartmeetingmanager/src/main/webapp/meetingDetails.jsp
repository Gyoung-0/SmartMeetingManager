<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.smartmeetingmanager.model.Meeting" %>
<%@ page import="com.smartmeetingmanager.model.Participant" %>
<%@ page import="com.smartmeetingmanager.model.Message" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회의 상세 정보</title>
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
        .details-container {
            max-width: 600px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        p, ul {
            margin: 10px 0;
        }
        strong {
            color: #007bff;
        }
        ul {
            list-style: none;
            padding: 0;
        }
        ul li {
            background-color: #f9f9f9;
            padding: 8px 12px;
            margin-bottom: 5px;
            border-radius: 4px;
        }
        ul li:hover {
            background-color: #e9ecef;
        }
        .button-group {
            margin-top: 20px;
            text-align: center;
        }
        .button-group a, .button-group button {
            margin: 5px;
            padding: 10px 15px;
            text-decoration: none;
            color: white;
            border: none;
            border-radius: 4px;
            background-color: #007bff;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .button-group button:hover, .button-group a:hover {
            background-color: #0056b3;
        }
        .button-group button.delete {
            background-color: #dc3545;
        }
        .button-group button.delete:hover {
            background-color: #c82333;
        }
        .chat-container {
            margin-top: 40px;
            background-color: #fff;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        .chat-box {
            height: 300px;
            overflow-y: scroll;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-bottom: 10px;
            padding: 10px;
            background-color: #f9f9f9;
        }
        .chat-message {
            margin-bottom: 10px;
        }
        .chat-message strong {
            color: #007bff;
        }
        #chatForm {
            display: flex;
        }
        #message {
            flex: 1;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-right: 10px;
        }
        button {
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <h1>회의 상세 정보</h1>
    <div class="details-container">
        <%
            Meeting meeting = (Meeting) request.getAttribute("meeting");
            if (meeting != null) {
        %>
        <p><strong>회의 ID:</strong> <%= meeting.getId() %></p>
        <p><strong>제목:</strong> <%= meeting.getTitle() %></p>
        <p><strong>설명:</strong> <%= meeting.getDescription() %></p>
        <p><strong>시작 시간:</strong> <%= meeting.getStartTime() %></p>
        <p><strong>종료 시간:</strong> <%= meeting.getEndTime() %></p>
        <p><strong>참가자 목록:</strong></p>
        <ul>
            <%
                List<Participant> participants = (List<Participant>) request.getAttribute("participants");
                if (participants != null && !participants.isEmpty()) {
                    for (Participant participant : participants) {
            %>
            <li><%= participant.getUsername() %></li>
            <%
                    }
                } else {
            %>
            <li>참가자가 없습니다.</li>
            <%
                }
            %>
        </ul>
        <div class="button-group">
            <a href="editMeeting.jsp?id=<%= meeting.getId() %>">회의 수정</a>
            <form action="MeetingController" method="post" style="display:inline;">
                <input type="hidden" name="action" value="delete">
                <input type="hidden" name="id" value="<%= meeting.getId() %>">
                <button type="submit" class="delete">회의 삭제</button>
            </form>
        </div>
        <%
            } else {
        %>
        <p>회의 정보를 불러올 수 없습니다.</p>
        <%
            }
        %>
        <div class="button-group">
            <a href="MeetingController?action=list">회의 목록으로 돌아가기</a>
        </div>
    </div>

    <!-- 채팅 추가 -->
    <div class="chat-container">
        <h2>채팅</h2>
        <div class="chat-box">
            <%
                List<Message> messages = (List<Message>) request.getAttribute("messages");
                if (messages != null && !messages.isEmpty()) {
                    for (Message message : messages) {
            %>
            <div class="chat-message">
                <strong><%= message.getUsername() %>:</strong> <%= message.getContent() %> <small>(<%= message.getSentAt() %>)</small>
            </div>
            <%
                    }
                } else {
            %>
            <p>채팅 메시지가 없습니다.</p>
            <%
                }
            %>
        </div>
        <form id="chatForm" action="chat" method="post">
            <input type="hidden" name="meetingId" value="<%= meeting.getId() %>">
            <%
                Integer senderId = (Integer) session.getAttribute("userId");
                String username = (String) session.getAttribute("username");
                if (senderId == null) senderId = 0;
            %>
            <input type="hidden" name="senderId" value="<%= senderId %>">
            <input type="text" id="message" name="message" placeholder="메시지를 입력하세요..." required>
            <button type="submit">전송</button>
        </form>
    </div>
</body>
</html>