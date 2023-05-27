package com.print.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class AdminDao {
	Connection con = null;
	PreparedStatement ps;

	public int loginAdmin(String email, String password) {

		int i = 0;

		if (email.equals("admin") && password.equals("admin")) {
			i = 1;
		}

		return i;
	}

}
