package com.controller;

import com.database.DatabaseConnector;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;



public class LoginController {
    private DatabaseConnector databaseConnector;

    public LoginController() {
        try {
            databaseConnector = new DatabaseConnector();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public boolean authenticateUser(String email, String password) {
        String query = "SELECT * FROM login WHERE email = ? AND password = ?";
        try (PreparedStatement statement = databaseConnector.getConnection().prepareStatement(query)) {
            statement.setString(1, email);
            statement.setString(2, password);
            try (ResultSet resultSet = statement.executeQuery()) {
                return resultSet.next();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
