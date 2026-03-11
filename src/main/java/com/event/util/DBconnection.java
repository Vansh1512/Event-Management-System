
package com.event.util;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

public class DBconnection {

    public static Connection getConnection() {

        Connection con = null;

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            Properties props = new Properties();
            try (var in = DBconnection.class.getClassLoader().getResourceAsStream("db.properties")) {
                if (in == null) {
                    throw new IllegalStateException("Missing db.properties in src/main/resources");
                }
                props.load(in);
            }

            String url = props.getProperty("db.url");
            String user = props.getProperty("db.user");
            String password = props.getProperty("db.password");

            con = DriverManager.getConnection(url, user, password);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return con;
    }
}