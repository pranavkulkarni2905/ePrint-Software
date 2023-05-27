package com.print.controller.user;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.print.DAO.UserDAO;
import com.print.model.User;

/**
 * Servlet implementation class UserLoginController
 */
@WebServlet("/UserLoginController")
public class UserLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserLoginController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		String password = request.getParameter("password");

		UserDAO uDao = new UserDAO();

		User u = uDao.loginUser(email, password);

		HttpSession session = request.getSession();

		ServletContext sc=request.getServletContext();
		
		try {

			if (u != null) {
				if (u.getVerified().equals("yes") || u.getVerified().equals("Yes")) {
					session.setAttribute("login-success", true);
					session.setAttribute("user1", u);
					sc.setAttribute("user", u);
					response.sendRedirect("user/index.jsp");
					System.out.println("logged..");
				} else {

					String otp = uDao.sendotp(u.getName(), email);

					session.setAttribute("otp", otp);
					session.setAttribute("not-check", false);
					response.sendRedirect("otp-verification.jsp");
				}
			} else {
				session.setAttribute("login-fail", false);
				response.sendRedirect("login.jsp");
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
