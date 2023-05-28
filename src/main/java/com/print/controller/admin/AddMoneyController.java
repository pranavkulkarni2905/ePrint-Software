package com.print.controller.admin;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.print.DAO.AdminDao;
import com.print.DAO.UserDAO;

/**
 * Servlet implementation class AddMoneyController
 */
@WebServlet("/AddMoneyController")
public class AddMoneyController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddMoneyController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		UserDAO uDao = new UserDAO();
		int amount = Integer.parseInt(request.getParameter("amount"));

		String phone = request.getParameter("phone");
		int uAmount = uDao.getWalletBalanceByPhone(phone);

		int famount = amount + uAmount;
		HttpSession session = request.getSession();
		Timestamp date = new Timestamp(new Date().getTime());

		AdminDao aDao = new AdminDao();

		int i = aDao.addMoney(famount, phone);

		if (i > 0) {
			aDao.addTransection(amount, phone, date.toString());
			session.setAttribute("add-money-success", true);
			response.sendRedirect("admin/add-money.jsp");
		} else {
			session.setAttribute("add-money-fail", false);
			response.sendRedirect("admin/add-money.jsp");
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
