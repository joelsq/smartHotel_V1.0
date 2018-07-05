package team.hotel.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import team.hotel.dao.DBUtil;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/Login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// System.out.println("表单数据处理中！");
		String adminName = request.getParameter("adminName");// 取得用户名
		String password = request.getParameter("password");// 取得密码
		DBUtil db = new DBUtil();// 构建数据库对象
		boolean canLogin = db.loginSuccess(adminName, password);
		if (canLogin) {// 根据登陆情况，跳转页面
			System.out.println("验证成功！");
			response.sendRedirect("mainPage.jsp");
		} else {
			System.out.println("验证失败！");
			response.sendRedirect("login.jsp?error=yes");
		}
	}

}
