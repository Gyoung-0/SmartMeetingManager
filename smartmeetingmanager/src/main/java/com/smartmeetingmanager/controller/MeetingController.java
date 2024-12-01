package com.smartmeetingmanager.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;
import com.smartmeetingmanager.model.Meeting;
import com.smartmeetingmanager.model.Participant;
import com.smartmeetingmanager.service.MeetingService;

@WebServlet("/MeetingController")
public class MeetingController extends HttpServlet {
    private MeetingService meetingService = new MeetingService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("list".equals(action)) {
            // 회의 목록 가져오기
            List<Meeting> meetings = meetingService.getAllMeetings();
            request.setAttribute("meetings", meetings);
            request.getRequestDispatcher("meetingList.jsp").forward(request, response);
        } else if ("details".equals(action)) {
            // 특정 회의의 상세 정보 가져오기
            int meetingId = Integer.parseInt(request.getParameter("id"));
            Meeting meeting = meetingService.getMeetingById(meetingId);
            List<Participant> participants = meetingService.getParticipantsByMeetingId(meetingId);

            request.setAttribute("meeting", meeting);
            request.setAttribute("participants", participants);
            request.getRequestDispatcher("meetingDetails.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("create".equals(action)) {
            // 회의 생성
            String title = request.getParameter("title");
            String description = request.getParameter("description");
            String startTimeStr = request.getParameter("startTime");

            Timestamp startTime = Timestamp.valueOf(startTimeStr.replace("T", " ") + ":00");
            Timestamp endTime = new Timestamp(startTime.getTime() + 3600 * 1000); // 1시간 후

            meetingService.createMeeting(title, description, startTime, endTime);
            response.sendRedirect("MeetingController?action=list");
        } else if ("join".equals(action)) {
            // 회의 참가
            int meetingId = Integer.parseInt(request.getParameter("meetingId"));
            String username = request.getParameter("username");

            meetingService.addParticipant(meetingId, username);
            response.sendRedirect("MeetingController?action=details&id=" + meetingId);
        }
    }
}