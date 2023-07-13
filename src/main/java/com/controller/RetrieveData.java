package com.controller;

import com.database.DatabaseConnector;
import com.model.User;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class RetrieveData {
    public ArrayList<User> getAllUsers() throws SQLException {
        ArrayList<User> userList = new ArrayList<>();

        Connection connection = null;
        ResultSet resultSet = null;

        try {
            DatabaseConnector databaseConnector = DatabaseConnector.getInstance();
            connection = databaseConnector.getConnection();
            Statement statement = connection.createStatement();

            String sql = "SELECT * FROM user WHERE isDeleted = 0";
            resultSet = statement.executeQuery(sql);

            while (resultSet.next()) {
                int userId = resultSet.getInt("uid");
                String fullName = resultSet.getString("fullName");
                String nic = resultSet.getString("nic");
                String address = resultSet.getString("address");
                String phoneNumber = resultSet.getString("phoneNumber");

                //
                String birthday = resultSet.getString("birthday");
                int age = resultSet.getInt("age");
                String gender = resultSet.getString("gender");
                //

                User user = new User(userId, fullName, nic, address, phoneNumber, birthday, age, gender);
                userList.add(user);
            }
        } finally {
            if (resultSet != null) {
                resultSet.close();
            }
            if (connection != null) {
                connection.close();
            }
        }

        return userList;
    }

    public int[] countGenders() throws SQLException {
        int[] genderCount = new int[2]; // Index 0 for females, Index 1 for males

        Connection connection = null;
        ResultSet resultSet = null;

        try {
            DatabaseConnector databaseConnector = DatabaseConnector.getInstance();
            connection = databaseConnector.getConnection();
            Statement statement = connection.createStatement();

            String sql = "SELECT gender, COUNT(*) as count FROM user WHERE isDeleted = 0 GROUP BY gender";
            resultSet = statement.executeQuery(sql);

            while (resultSet.next()) {
                String gender = resultSet.getString("gender");
                int count = resultSet.getInt("count");

                if (gender.equalsIgnoreCase("F")) {
                    genderCount[0] = count; // Female count
                } else if (gender.equalsIgnoreCase("M")) {
                    genderCount[1] = count; // Male count
                }
            }
        } finally {
            if (resultSet != null) {
                resultSet.close();
            }
            if (connection != null) {
                connection.close();
            }
        }

        return genderCount;
    }

    public static int[] countServiceProviders() throws SQLException {
        int[] serviceProviderCount = new int[4]; // Index 0 for Hutch, Index 1 for Mobitel, Index 2 for Dialog, Index 3 for Airtel

        Connection connection = null;
        ResultSet resultSet = null;

        try {
            DatabaseConnector databaseConnector = DatabaseConnector.getInstance();
            connection = databaseConnector.getConnection();
            Statement statement = connection.createStatement();

            String sql = "SELECT serviceProvider, COUNT(*) AS count FROM user WHERE isDeleted = 0 GROUP BY serviceProvider";
            resultSet = statement.executeQuery(sql);

            while (resultSet.next()) {
                String serviceProvider = resultSet.getString("serviceProvider");
                int count = resultSet.getInt("count");

                if (serviceProvider.equalsIgnoreCase("Hutch")) {
                    serviceProviderCount[0] = count; // Hutch count
                } else if (serviceProvider.equalsIgnoreCase("Mobitel")) {
                    serviceProviderCount[1] = count; // Mobitel count
                } else if (serviceProvider.equalsIgnoreCase("Dialog")) {
                    serviceProviderCount[2] = count; // Dialog count
                } else if (serviceProvider.equalsIgnoreCase("Airtel")) {
                    serviceProviderCount[3] = count; // Airtel count
                }
            }
        } finally {
            if (resultSet != null) {
                resultSet.close();
            }
            if (connection != null) {
                connection.close();
            }
        }

        return serviceProviderCount;
    }


    public int getInactiveUserCount() throws SQLException {
        int inactiveCount = 0;

        Connection connection = null;
        ResultSet resultSet = null;

        try {
            DatabaseConnector databaseConnector = DatabaseConnector.getInstance();
            connection = databaseConnector.getConnection();
            Statement statement = connection.createStatement();

            String sql = "SELECT COUNT(*) AS count FROM user WHERE isDeleted = 1";
            resultSet = statement.executeQuery(sql);

            if (resultSet.next()) {
                inactiveCount = resultSet.getInt("count");
            }
        } finally {
            if (resultSet != null) {
                resultSet.close();
            }
            if (connection != null) {
                connection.close();
            }
        }

        return inactiveCount;
    }

}
