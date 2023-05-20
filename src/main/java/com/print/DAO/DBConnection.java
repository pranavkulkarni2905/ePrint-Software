package com.print.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	public static void main(String args[]){  

	//public static Connection getConnection() {
		Connection con = null;
		try {
			// load drivers
			Class.forName("com.mysql.cj.jdbc.Driver");  
			// connection to data Base

			con=DriverManager.getConnection(  
					"jdbc:mysql://localhost:3306/eprint","root","root");  
			System.out.println("connection...");

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//return con;
	//}
	}
}
