package com.smartmeetingmanager.model;

public class Participant {
    private int id;
    private int meetingId;
    private String username;

    // Constructors
    public Participant() {}

    public Participant(int id, int meetingId, String username) {
        this.id = id;
        this.meetingId = meetingId;
        this.username = username;
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

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Override
    public String toString() {
        return "Participant{" +
                "id=" + id +
                ", meetingId=" + meetingId +
                ", username='" + username + '\'' +
                '}';
    }
}