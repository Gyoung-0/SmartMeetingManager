package com.smartmeetingmanager.service;

import com.smartmeetingmanager.model.Meeting;
import com.smartmeetingmanager.model.Participant;
import com.smartmeetingmanager.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MeetingService {

    public List<Meeting> getAllMeetings() {
        List<Meeting> meetings = new ArrayList<>();
        String query = "SELECT * FROM meetings";

        try (Connection conn = DBUtil.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                Meeting meeting = new Meeting();
                meeting.setId(rs.getInt("id"));
                meeting.setTitle(rs.getString("title"));
                meeting.setDescription(rs.getString("description"));
                meeting.setStartTime(rs.getTimestamp("start_time"));
                meeting.setEndTime(rs.getTimestamp("end_time"));
                meetings.add(meeting);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return meetings;
    }

    public Meeting getMeetingById(int id) {
        Meeting meeting = null;
        String query = "SELECT * FROM meetings WHERE id = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    meeting = new Meeting();
                    meeting.setId(rs.getInt("id"));
                    meeting.setTitle(rs.getString("title"));
                    meeting.setDescription(rs.getString("description"));
                    meeting.setStartTime(rs.getTimestamp("start_time"));
                    meeting.setEndTime(rs.getTimestamp("end_time"));
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return meeting;
    }

    public List<Participant> getParticipantsByMeetingId(int meetingId) {
        List<Participant> participants = new ArrayList<>();
        String query = "SELECT p.id, p.meeting_id, u.username " +
                       "FROM participants p " +
                       "JOIN users u ON p.user_id = u.id " +
                       "WHERE p.meeting_id = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, meetingId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Participant participant = new Participant();
                    participant.setId(rs.getInt("id"));
                    participant.setMeetingId(rs.getInt("meeting_id"));
                    participant.setUsername(rs.getString("username"));
                    participants.add(participant);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return participants;
    }

    public void createMeeting(String title, String description, Timestamp startTime, Timestamp endTime) {
        String query = "INSERT INTO meetings (title, description, start_time, end_time) VALUES (?, ?, ?, ?)";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, title);
            stmt.setString(2, description);
            stmt.setTimestamp(3, startTime);
            stmt.setTimestamp(4, endTime);

            stmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void addParticipant(int meetingId, String username) {
        String query = "INSERT INTO participants (meeting_id, user_id) VALUES (?, (SELECT id FROM users WHERE username = ?))";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, meetingId);
            stmt.setString(2, username);

            stmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}