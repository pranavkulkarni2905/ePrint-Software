package com.print.controller.admin;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.print.DAO.AdminDao;

/**
 * Servlet implementation class GetFileController
 */
@WebServlet("/GetFileController")
public class GetFileController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GetFileController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int token = Integer.parseInt(request.getParameter("token"));
		ResultSet rs = null;
		AdminDao aDao = new AdminDao();
		HttpSession session = request.getSession();

		rs = aDao.getFileNameByToken(token);
		ServletContext sc5 = request.getServletContext();
		try {
			if (rs.next()) {
				session.setAttribute("get-file", rs);
				session.setAttribute("get-file-success", true);
				response.sendRedirect("admin/token-print.jsp");
			} else {
				session.setAttribute("get-file", rs);
				session.setAttribute("get-file-fail", false);
				response.sendRedirect("admin/token-print.jsp");
			}
		} catch (SQLException | IOException e) {
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
