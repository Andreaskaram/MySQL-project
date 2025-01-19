package com.mycompany.gui;

import java.sql.Connection;
import sqlgui.mysqlGUI;

public class Gui {

    public static void main(String[] args) {
        //System.out.println("Hello World!");

        // Create an instance of the DBConnection class
        DBConnection dbConnection = new DBConnection();

        // Call the connect method to establish the connection
        Connection conn = dbConnection.connect();  // Establishes connection when the program starts

        // Check if the connection is successful
        //System.out.println(conn);
        if (conn != null) {
            System.out.println("Connected to the database!");
        } else {
            System.out.println("Failed to connect to the database.");
        }
        java.awt.EventQueue.invokeLater(new Runnable() {
        public void run() {
            new mysqlGUI().setVisible(true);  // Launch the GUI
        }
        });
        // Optionally, close the connection when you're done
        //dbConnection.close();
    }
}