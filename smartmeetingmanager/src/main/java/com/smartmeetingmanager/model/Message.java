package com.smartmeetingmanager.model;

import java.sql.Timestamp;

public class Message {
    private int id;
    private int meetingId;
    private int senderId;
    private String username; 
    private String content;
    private Timestamp sentAt;

    // Constructors
    public Message() {}

    public Message(int id, int meetingId, int senderId, String username, String content, Timestamp sentAt) {
        this.id = id;
        this.meetingId = meetingId;
        this.senderId = senderId;
        this.username = username; 
        this.content = content;
        this.sentAt = sentAt;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getMeetingId() {
        return meetingId;
    }

    public void setMeetingId(int meetingId) {
        this.meetingId = meetingId;
    }

    public int getSenderId() {
        return senderId;
    }

    public void setSenderId(int senderId) {
        this.senderId = senderId;
    }

    public String getUsername() { 
        return username;
    }

    public void setUsername(String username) { 
        this.username = username;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Timestamp getSentAt() {
        return sentAt;
    }

    public void setSentAt(Timestamp sentAt) {
        this.sentAt = sentAt;
    }

    @Override
    public String toString() {
        return "Message{" +
                "id=" + id +
                ", meetingId=" + meetingId +
                ", senderId=" + senderId +
                ", username='" + username + '\'' +
                ", content='" + content + '\'' +
                ", sentAt=" + sentAt +
                '}';
    }
}