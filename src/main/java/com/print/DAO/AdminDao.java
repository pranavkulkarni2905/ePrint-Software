package com.print.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;

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
			ps = con.prepareStatement("select * from document where token_no=? and print_status=1");
			ps.setInt(1, token);

			rs = ps.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;

	}

	public void changeFileStatusByDocid(int doc_id) {

		int i = 0;
		con = DBConnection.getConnection();
		try {
			ps = con.prepareStatement("update document set print_status=0 where doc_id=?");
			ps.setInt(1, doc_id);

			i = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public int addMoney(int amount, String phone) {
		int i = 0;
		con = DBConnection.getConnection();
		try {
			ps = con.prepareStatement("update user set wallet_balance=? where phone=?");
			ps.setInt(1, amount);
			ps.setString(2, phone);

			i = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return i;
	}

	public void addTransection(int amount, String phone, String date) {
		int i = 0;
		// Timestamp date = new Timestamp(new Date().getTime());
		con = DBConnection.getConnection();
		try {
			ps = con.prepareStatement("insert into admintransection(phone,amount,date,type) values(?,?,?,?)");
			ps.setString(1, phone);
			ps.setInt(2, amount);
			ps.setString(3, date);
			ps.setString(4, "added");

			i = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public ResultSet getAdminTransectionInfo() {

		con = DBConnection.getConnection();
		ResultSet rs = null;

		try {
			ps = con.prepareStatement("select * from admintransection");

			rs = ps.executeQuery();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}

	public int deductMoney(int id, int cost, String doc) {

		con = DBConnection.getConnection();
		ResultSet rs = null;
		Timestamp date = new Timestamp(new Date().getTime());
		int i = 0;
		UserDAO uDao = new UserDAO();
		int ubal = uDao.getWalletBalanceByUserId(id);

		System.out.println("ubal:" + ubal);
		System.out.println("cost:" + cost);
		System.out.println("user_id:" + id);
		int nbal;
		if (ubal > cost) {
			nbal = ubal - cost;
			System.out.println("inside condition");
			uDao.setWalletBalanceByUserId(id, nbal);
			uDao.addUserTransectionInfo(id, cost, doc, date.toString());
			i = 1;
		}
		return i;
	}

}
