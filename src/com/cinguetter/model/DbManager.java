package com.cinguetter.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbManager {

	private static DbManager singleton;
	private static final String URL_DB = "jdbc:oracle:thin:@localhost:1521:xe";
	private static final String USER = "SYSTEM";
	private static final String PASSWORD = "crusaders";

	private DbManager() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {

			e.printStackTrace();
		}
	}

	public Connection getDbConnection() {
		try {
			Connection conn = DriverManager.getConnection(URL_DB, USER, PASSWORD);
			return conn;
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return null;
	}

	public static DbManager getInstance() {
		if (singleton == null) {
			singleton = new DbManager();
		}
		return singleton;
	}

}
