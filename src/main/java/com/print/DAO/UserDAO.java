package com.print.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;

import com.print.model.User;

public class UserDAO {
	Connection con=null;
	PreparedStatement ps;
	
	public int registerUser(User u) {
		
		int i = 0;
		Timestamp date = new Timestamp(new Date().getTime());
		con = DBConnection.getConnection();
		try {
			ps = con.prepareStatement(
					"insert into user(email,password,full_name,phone,degree,branch,registration_timestamp,verified) values(?,?,?,?,?,?,?,?)");
			ps.setString(1, u.getEmail());
			ps.setString(2, u.getPassword());
			ps.setString(3, u.getName());
			ps.setString(4, u.getPhone());
			ps.setString(5, u.getDegree());
			ps.setString(6,u.getBranch());
			ps.setTimestamp(7, date);
			ps.setString(8, "No");
			i = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
	
	public int updateVerifiedStatus(String email) {
		int i=0;
		con = DBConnection.getConnection();
		try {
			ps = con.prepareStatement(
					"update user set verified=? where email=?");
			ps.setString(1, "Yes");
			ps.setString(2, email);
			
			i = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
	
	public String sendotp(String name,String email) {
        com.print.email.SendMail sm=new com.print.email.SendMail();
		
		String otp=sm.generateOTP();
		
		final String subject = "Verify Your Account | ePrint Software";
		final String messg = "Dear "+name+",\n\n"
				+"Thank you for choosing ePrint Software! To ensure the security of your account, we require a verification process to activate your ePrint account. Please follow the instructions below to verify your account and complete the registration process.\r\n"
				+ "\r\n"
				+ "Step 1: Retrieve the OTP (One-Time Password)\r\n"
				+ "This email contais a six-digit OTP (One-Time Password). Please keep this email secure and do not share the OTP with anyone.\r\n"
				+ "\r\n"
				+ "Step 2: Account Verification \nEnter the six-digit OTP you received in the email.\r\n"
				+ "Click on the \"Verify\" or \"Submit\" button to complete the verification process.\r\n"
				+ "Please note that the OTP is valid for a limited time. If you do not enter the OTP within [time frame], you will need to request a new OTP.\r\n"
				+ "\r\n"
				+ "OTP- "+otp+"\n\nIf you did not request this verification, please disregard this email. However, we highly recommend contacting our support team immediately for further assistance.\r\n"
				+ "\r\n"
				+ "If you have any questions or encounter any issues during the verification process, please don't hesitate to reach out to our customer support team at [support email/phone number].\r\n"
				+ "\r\n"
				+ "Thank you for choosing ePrint Software. We look forward to providing you with a seamless and secure printing experience!\r\n"
				+ "\r\n"
				+ "Best regards,\r\n"
				+ "\r\n"
				+ "ePrint Software Team\r\n"
				+ "\r\n"
				+ "\r\n"
				+ "\r\n"
				+ "\r\n"
				+ "\r\n"
				+ "\r\n"
				+ "";
		sm.sendEmail(email, messg, subject);
		return otp;
	}
}
