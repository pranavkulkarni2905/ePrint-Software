package com.print.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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

	public ResultSet getFileNameByToken(int token) {
		ResultSet rs = null;
		con = DBConnection.getConnection();
		try {
			ps = con.prepareStatement("select * from document where token_no=?");
			ps.setInt(1, token);

			rs = ps.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;

	}

}
