<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.smartmeetingmanager.model.Message" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회의 채팅</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f4f4f4;
        }
        #chatBox {
            width: 80%;
            max-width: 600px;
            height: 300px;
            overflow-y: scroll;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin: 20px auto;
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
            justify-content: center;
            margin-top: 10px;
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
    <h1 style="text-align: center;">회의 채팅</h1>
    <div id="chatBox">
        <%
            List<Message> messages = (List<Message>) request.getAttribute("messages");
            if (messages != null && !messages.isEmpty()) {
                for (Message message : messages) {
        %>
        <div class="chat-message">
            <strong><%= message.getUsername() %>:</strong>
            <p><%= message.getContent() %></p>
            <small><%= message.getSentAt() %></small>
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
        <input type="hidden" name="meetingId" value="<%= request.getAttribute("meetingId") %>">
        <input type="hidden" name="senderId" value="4"> <!-- 로그인된 사용자 ID로 대체 -->
        <input type="text" id="message" name="message" placeholder="메시지를 입력하세요..." required>
        <button type="submit">전송</button>
    </form>
</body>
</html>