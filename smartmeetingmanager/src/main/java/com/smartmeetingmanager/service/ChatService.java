package com.smartmeetingmanager.service;

import com.smartmeetingmanager.model.Message;
import com.smartmeetingmanager.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ChatService {

    public void saveMessage(int meetingId, int senderId, String content) {
        String query = "INSERT INTO messages (meeting_id, sender_id, content, sent_at) VALUES (?, ?, ?, NOW())";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, meetingId);
            stmt.setInt(2, senderId);
            stmt.setString(3, content);

            stmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Message> getMessagesByMeetingId(int meetingId) {
        List<Message> messages = new ArrayList<>();
        String query = "SELECT m.id, m.meeting_id, m.sender_id, m.content, m.sent_at, u.username " +
                       "FROM messages m " +
                       "JOIN users u ON m.sender_id = u.id " +
                       "WHERE m.meeting_id = ? ORDER BY m.sent_at ASC";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, meetingId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Message message = new Message();
                    message.setId(rs.getInt("id"));
                    message.setMeetingId(rs.getInt("meeting_id"));
                    message.setSenderId(rs.getInt("sender_id"));
                    message.setUsername(rs.getString("username"));
                    message.setContent(rs.getString("content"));
                    message.setSentAt(rs.getTimestamp("sent_at"));
                    messages.add(message);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return messages;
    }
}