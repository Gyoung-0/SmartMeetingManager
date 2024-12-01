package com.smartmeetingmanager.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import com.smartmeetingmanager.service.ChatService;
import com.smartmeetingmanager.model.Message;

import java.io.IOException;
import java.util.List;

@WebServlet("/chat")
public class ChatController extends HttpServlet {
    private ChatService chatService = new ChatService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int meetingId = Integer.parseInt(request.getParameter("meetingId"));
        List<Message> messages = chatService.getMessagesByMeetingId(meetingId);

        request.setAttribute("messages", messages);
        request.setAttribute("meetingId", meetingId);
        request.getRequestDispatcher("chat.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int meetingId = Integer.parseInt(request.getParameter("meetingId"));
        int senderId = Integer.parseInt(request.getParameter("senderId"));
        String content = request.getParameter("message");

        chatService.saveMessage(meetingId, senderId, content);

        response.sendRedirect("chat?meetingId=" + meetingId);
    }
}