package com.database;

import com.mysql.cj.jdbc.exceptions.CommunicationsException;

import java.sql.*;

public class DatabaseConnector {

    private Connection connection;

    private String url = "jdbc:mysql://localhost:3306/";
    private String driver = "com.mysql.cj.jdbc.Driver";
    private String userName = "root";
    private String dbName = "nic_valid?rewriteBatchedStatements=true&allowLoadLocalInfile=true&allowMultiQueries=true&useUnicode=yes&characterEncoding=UTF-8&autoReconnect=true";
    private String password = "Toni1997@";

    public DatabaseConnector() throws SQLException {
        try {
            Class.forName(driver).newInstance();
            this.connection = DriverManager.getConnection(url + dbName, userName, password);
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException ex) {
            System.out.println("Database Connection Creation Failed: " + ex.getMessage());
        }
    }

    public Connection getConnection() {
        return connection;
    }

    public PreparedStatement prepareStatement(String query, int returnGeneratedKeys) throws SQLException {
        return connection.prepareStatement(query, returnGeneratedKeys);
    }

    public ResultSet query(String query) throws SQLException {
        Statement statement = connection.createStatement();
        try {
            return statement.executeQuery(query);
        } catch (CommunicationsException e) {
            reconnect();
            statement = connection.createStatement();
            return statement.executeQuery(query);
        }
    }

    public int insert(String insertQuery) throws SQLException {
        Statement statement = connection.createStatement();
        try {
            return statement.executeUpdate(insertQuery);
        } catch (CommunicationsException e) {
            reconnect();
            statement = connection.createStatement();
            return statement.executeUpdate(insertQuery);
        }
    }

    public int update(String sql) throws SQLException {
        PreparedStatement preparedStmt = connection.prepareStatement(sql);
        try {
            return preparedStmt.executeUpdate();
        } catch (CommunicationsException e) {
            reconnect();
            preparedStmt = connection.prepareStatement(sql);
            return preparedStmt.executeUpdate();
        }
    }

    private void reconnect() throws SQLException {
        if (connection != null && !connection.isClosed()) {
            connection.close();
        }
        instance = new DatabaseConnector();
    }

    private static DatabaseConnector instance;

    public static synchronized DatabaseConnector getInstance() throws SQLException {
        if (instance == null || instance.getConnection().isClosed()) {
            instance = new DatabaseConnector();
        }
        return instance;
    }
}
