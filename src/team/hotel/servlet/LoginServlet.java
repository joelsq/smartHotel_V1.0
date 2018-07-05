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

	public LoginServlet() {
		super();
	}
protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String adminName = request.getParameter("adminName");// 取得用户名
		String password = request.getParameter("password");// 取得密码
		DBUtil db = new DBUtil();// 构建数据库对象
		boolean canLogin = db.loginSuccess(adminName, password);
		if (canLogin) {// 待实现根据不同权限登陆，跳转不同页面
			System.out.println("登录成功！");
			response.sendRedirect("pages/manager/managerHome.jsp");
			
			//response.sendRedirect("mainPage.jsp");
			
		} else {
			System.out.println("登录失败！");
			response.sendRedirect("login.jsp?error=yes");
		}
	}

}
