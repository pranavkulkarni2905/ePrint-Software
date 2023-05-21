package com.print.controller.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.print.DAO.UserDAO;

/**
 * Servlet implementation class OtpVerificationController
 */
@WebServlet("/OtpVerificationController")
public class OtpVerificationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OtpVerificationController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String otp=request.getParameter("otp");
		String a=request.getParameter("1");
		String b=request.getParameter("2");

		String c=request.getParameter("3");

		String d=request.getParameter("4");
		
		String email=request.getParameter("email");
		
		String inputOtp=a+b+c+d;
		
		UserDAO ud=new UserDAO();
		HttpSession session=request.getSession();
		System.out.println(otp+" "+inputOtp);
		
		if(otp.equals(inputOtp)) {
			ud.updateVerifiedStatus(email);
			session.setAttribute("verified",true);
			response.sendRedirect("login.jsp");
		}else {
			session.setAttribute("not-verified",true);
			response.sendRedirect("otp-verification.jsp");
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
