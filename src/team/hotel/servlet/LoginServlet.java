package team.hotel.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import team.hotel.dao.DBLogin;

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
		request.setCharacterEncoding("utf-8");
		String adminName = request.getParameter("adminName");// 取得用户名
		String password = request.getParameter("password");// 取得密码
		DBLogin db = new DBLogin();// 构建数据库对象
		//boolean canLogin = db.loginSuccess(adminName, password);
		
		String loginState=(String) db.loginSuccess(adminName, password);
		//String[] states= {"loginNameError","loginPasswordError","loginManager","loginUser","loginGuest","loginUnknowAu"};
		if (loginState.equalsIgnoreCase("loginManager")){// 待实现根据不同权限登陆，跳转不同页面
			System.out.println("manager登录成功！");
			response.sendRedirect("pages/manager/managerHome.jsp");
		} 
		else if(loginState.equalsIgnoreCase("loginUser"))
		{
			System.out.println("user登录成功！");
			response.sendRedirect("pages/user/userHome.jsp");
		}
		else if(loginState.equalsIgnoreCase("loginGuest")){
			System.out.println("guest登录成功！");
			response.sendRedirect("pages/guest/guestHome.jsp");
		}
		else {
			System.out.println("登录失败！");
			response.sendRedirect("login.jsp?error=yes");
		}
}

}
