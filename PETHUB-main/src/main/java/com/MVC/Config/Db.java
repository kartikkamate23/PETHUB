package com.MVC.Config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public final class Db {
    private Db() {
    }

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL JDBC driver is not available", e);
        }
        return DriverManager.getConnection(
                AppConfig.dbUrl(),
                AppConfig.dbUser(),
                AppConfig.dbPassword()
        );
    }
}
