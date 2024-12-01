package com.smartmeetingmanager.util;

import java.sql.Connection;

public class TestDBConnection {
    public static void main(String[] args) {
        try (Connection conn = DBUtil.getConnection()) {
            System.out.println("Database connection test successful!");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}