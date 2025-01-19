package com.mycompany.gui;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    
    private Connection conn;
    
    // Method to establish the connection to the MySQL database
    public Connection connect() {
        try {
            // Load the MySQL JDBC driver (make sure the connector JAR is included in your project)
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Database URL, replace with your details
            String url = "jdbc:mysql://localhost:3306/projectdb";  // Change projectdb to your database name
            String user = "root"; // Your MySQL username
            String password = "dbdb1234"; // Your MySQL password

            // Establishing the connection
            conn = DriverManager.getConnection(url, user, password);

            System.out.println("Database connected!");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error while connecting to database: " + e.getMessage());
        }
        return conn;
    }

    // Close the connection
    public void close() {
        try {
            if (conn != null && !conn.isClosed()) {
                conn.close();
                System.out.println("Connection closed!");
            }
        } catch (SQLException e) {
            System.out.println("Error while closing the connection: " + e.getMessage());
        }
    }
}