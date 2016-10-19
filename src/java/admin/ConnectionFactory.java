/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin;

import java.sql.*;


/**
 *
 * @author Breno Antunes
 */
public class ConnectionFactory {
    public Connection getConnection() throws ClassNotFoundException {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            return DriverManager.getConnection("jdbc:mysql://sql9.freemysqlhosting.net:3306/sql9140751", "sql9140751", "pU95ckzMlc");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}
