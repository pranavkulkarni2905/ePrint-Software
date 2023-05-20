package com.print.controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.print.DAO.UserDAO;
import com.print.model.User;

/**
 * Servlet implementation class RegistrationController
 */
@WebServlet("/RegistrationController")
public class RegistrationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrationController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String password=request.getParameter("passowrd");
		String phone=request.getParameter("phone");
		String degree=request.getParameter("degree");
		String branch=request.getParameter("branch");
		
		User uModel=new User(email, password, name, degree, branch, phone);
		UserDAO ud=new UserDAO();
		ud.sendotp(name,email);
		
		HttpSession session=request.getSession();

		int i=ud.registerUser(uModel);
		if(i>0) {
			session.setAttribute("register-success",true);
			response.sendRedirect("login.jsp");
		}else {
			session.setAttribute("register-fail",false);
			response.sendRedirect("sign-up.jsp");
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
