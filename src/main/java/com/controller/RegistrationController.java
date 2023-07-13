package com.controller;

import com.database.DatabaseConnector;

import java.sql.ResultSet;
import java.sql.SQLException;

public class RegistrationController {
    private static DatabaseConnector databaseConnector;

    static {
        try {
            databaseConnector = DatabaseConnector.getInstance();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static int addUser( String fullName, String address, String phoneNumber, String nicNumber, String birthday, Integer age, String gender, String email) throws SQLException {
        String cleanedPhoneNumber = phoneNumber.replaceAll("\\D", "");

        if (cleanedPhoneNumber.startsWith("947")) {
            // Phone number is already in the desired format (947********)
            if (cleanedPhoneNumber.length() >= 12) {
                cleanedPhoneNumber = cleanedPhoneNumber.substring(0, 12);
            }
        } else if (cleanedPhoneNumber.startsWith("+947")) {
            // Remove the leading "+" and keep the rest of the digits
            if (cleanedPhoneNumber.length() >= 15) {
                cleanedPhoneNumber = "947" + cleanedPhoneNumber.substring(4, 15);
            }
        } else if (cleanedPhoneNumber.startsWith("07")) {
            // Convert the format 07******** to 947******** (replace 0 with 94)
            if (cleanedPhoneNumber.length() >= 10) {
                cleanedPhoneNumber = "947" + cleanedPhoneNumber.substring(2);
            }
        } else if (cleanedPhoneNumber.startsWith("7")) {
            // Convert the format 7******** to 947******** (replace 7 with 947)
            if (cleanedPhoneNumber.length() >= 9) {
                cleanedPhoneNumber = "947" + cleanedPhoneNumber.substring(1);
            }
        }

        String serviceProvider;
        if (cleanedPhoneNumber.startsWith("9477") || cleanedPhoneNumber.startsWith("9474") || cleanedPhoneNumber.startsWith("9476")) {
            serviceProvider = "Dialog";
        } else if (cleanedPhoneNumber.startsWith("9471") || cleanedPhoneNumber.startsWith("9470")) {
            serviceProvider = "Mobitel";
        } else if (cleanedPhoneNumber.startsWith("9478") || cleanedPhoneNumber.startsWith("9472")) {
            serviceProvider = "Hutch";
        } else if (cleanedPhoneNumber.startsWith("9475")) {
            serviceProvider = "Airtel";
        } else {
            throw new IllegalArgumentException("Unsupported service provider. Please enter a valid Sri Lankan phone number.");
        }

        String genderCode;
        if (gender.equalsIgnoreCase("Male")) {
            genderCode = "M";
        } else if (gender.equalsIgnoreCase("Female")) {
            genderCode = "F";
        } else {
            throw new IllegalArgumentException("Invalid gender value. Please enter either 'Male' or 'Female'.");
        }
        // Get the adminID from the login table
        String adminID = null;
        DatabaseConnector connector = null;
        try {
            connector = DatabaseConnector.getInstance();
            String adminIDQuery = "SELECT adminID FROM login WHERE email = '" + email + "'";
//            System.out.println(email);
            ResultSet adminIDResult = connector.query(adminIDQuery);

            if (adminIDResult.next()) {
                adminID = adminIDResult.getString("adminID");
            } else {
                throw new IllegalArgumentException("Invalid email or admin not found.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        } finally {
            if (connector != null) {
                connector.getConnection().close();
            }
        }

        // Insert the values into the user table
        String query = "INSERT INTO user (nic, fullName, address, birthday, age, gender, phoneNumber, serviceProvider, createdBy, createdTime) " +
                "VALUES('" + nicNumber + "','" + fullName + "','" + address + "','" + birthday + "','" + age + "','" + genderCode + "','" + cleanedPhoneNumber + "','" + serviceProvider + "','" + adminID + "',CURRENT_TIMESTAMP)";

        try {
            connector = DatabaseConnector.getInstance();
            return connector.insert(query);
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        } finally {
            if (connector != null) {
                connector.getConnection().close();
            }
        }
    }




    //Delete method
    public static int deleteUser(Integer userID) throws SQLException {
        String query = "UPDATE user SET isDeleted = 1 WHERE uid = '" + userID + "'";

        try {
            DatabaseConnector connector = DatabaseConnector.getInstance();
            return connector.update(query);
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
    }


    //Update
public static int updateUser(Integer userID , String fullName, String address, String phoneNumber, String nicNumber, String birthday, Integer age, String gender, String email) throws SQLException {
    String cleanedPhoneNumber = phoneNumber.replaceAll("\\D", "");

    if (cleanedPhoneNumber.startsWith("947")) {
        // Phone number is already in the desired format (947********)
        if (cleanedPhoneNumber.length() >= 12) {
            cleanedPhoneNumber = cleanedPhoneNumber.substring(0, 12);
        }
    } else if (cleanedPhoneNumber.startsWith("+947")) {
        // Remove the leading "+" and keep the rest of the digits
        if (cleanedPhoneNumber.length() >= 15) {
            cleanedPhoneNumber = "947" + cleanedPhoneNumber.substring(4, 15);
        }
    } else if (cleanedPhoneNumber.startsWith("07")) {
        // Convert the format 07******** to 947******** (replace 0 with 94)
        if (cleanedPhoneNumber.length() >= 10) {
            cleanedPhoneNumber = "947" + cleanedPhoneNumber.substring(2);
        }
    } else if (cleanedPhoneNumber.startsWith("7")) {
        // Convert the format 7******** to 947******** (replace 7 with 947)
        if (cleanedPhoneNumber.length() >= 9) {
            cleanedPhoneNumber = "947" + cleanedPhoneNumber.substring(1);
        }
    }

    String serviceProvider;
    if (cleanedPhoneNumber.startsWith("9477") || cleanedPhoneNumber.startsWith("9474") || cleanedPhoneNumber.startsWith("9476")) {
        serviceProvider = "Dialog";
    } else if (cleanedPhoneNumber.startsWith("9471") || cleanedPhoneNumber.startsWith("9470")) {
        serviceProvider = "Mobitel";
    } else if (cleanedPhoneNumber.startsWith("9478") || cleanedPhoneNumber.startsWith("9472")) {
        serviceProvider = "Hutch";
    } else if (cleanedPhoneNumber.startsWith("9475")) {
        serviceProvider = "Airtel";
    } else {
        throw new IllegalArgumentException("Unsupported service provider. Please enter a valid Sri Lankan phone number.");
    }

    String genderCode;
    if (gender.equalsIgnoreCase("Male")) {
        genderCode = "M";
    } else if (gender.equalsIgnoreCase("Female")) {
        genderCode = "F";
    } else {
        throw new IllegalArgumentException("Invalid gender value. Please enter either 'Male' or 'Female'.");
    }
    // Get the adminName from the login table
    String adminID = null;
    DatabaseConnector connector = null;
    try {
        connector = DatabaseConnector.getInstance();
        String adminIDQuery = "SELECT adminID FROM login WHERE email = '" + email + "'";
//        System.out.println(email);
        ResultSet adminIDResult = connector.query(adminIDQuery);

        if (adminIDResult.next()) {
            adminID = adminIDResult.getString("adminID");
        } else {
            throw new IllegalArgumentException("Invalid email or admin not found.");
        }
    } catch (SQLException e) {
        e.printStackTrace();
        throw e;
    } finally {
        if (connector != null) {
            connector.getConnection().close();
        }
    }

    // Update the values

    String query = "UPDATE user SET nic = '" + nicNumber + "', fullName = '" + fullName + "', address = '" + address + "', birthday = '" + birthday + "', age = " + age + ", gender = '" + genderCode + "', phoneNumber = '" + cleanedPhoneNumber + "', serviceProvider = '" + serviceProvider + "', updatedBy = '" + adminID + "', updatedTime = CURRENT_TIMESTAMP WHERE uid = " + userID;

    try {
        connector = DatabaseConnector.getInstance();
        return connector.insert(query);
    } catch (SQLException e) {
        e.printStackTrace();
        throw e;
    } finally {
        if (connector != null) {
            connector.getConnection().close();
        }
    }
}





}
