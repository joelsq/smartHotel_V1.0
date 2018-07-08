package team.hotel.servlet;

import java.io.IOException;
//import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;

import team.hotel.dao.LoginDao;

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
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String method = request.getParameter("method");
		
		/**************登录*****************/
		if(method.endsWith("login")) {
			String loginState;
			//获取页面
			String adminName = request.getParameter("adminName");// 取得用户名
			String password = request.getParameter("password");// 取得密码
			LoginDao db = new LoginDao();// 构建数据库对象

			try {
				loginState = (String) db.loginSuccess(adminName, password);
				if (loginState.equalsIgnoreCase("loginManager")) {// 实现根据不同权限登陆，跳转不同页面
					System.out.println("manager登录成功！");
					response.sendRedirect("pages/manager/managerHome.jsp");
				} else if (loginState.equalsIgnoreCase("loginUser")) {
					System.out.println("user登录成功！");
					response.sendRedirect("pages/user/userHome.jsp");
				} else if (loginState.equalsIgnoreCase("loginGuest")) {
					System.out.println("guest登录成功！");
					response.sendRedirect("pages/guest/guestHome.jsp");
				} 
				/********* 测试页面************/
				else if (loginState.equalsIgnoreCase("test")) {
					System.out.println("test登录成功！");
					response.sendRedirect("pages/test/roomindex.jsp");
				}
				/********* 测试页面************/
				else if(loginState.equalsIgnoreCase("loginNameError")){
					System.out.println("用户名不存在！");
					response.sendRedirect("mainPage.jsp?error=noname");
				}else if(loginState.equalsIgnoreCase("loginPasswordError")){
					System.out.println("密码错误！");
					response.sendRedirect("mainPage.jsp?error=wrongPw");
				}else if(loginState.equalsIgnoreCase("loginUnknowAu")){
					System.out.println("未知权限登录！");
					response.sendRedirect("mainPage.jsp?error=loginUnknowAu");
				}
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		/**************注册*****************/
		else if(method.endsWith("register")) {
			String registerState;
			//获取页面
			String Name = request.getParameter("Name");// 取得用户名
			String pw1= request.getParameter("pw1");// 取得密码1
			String pw2= request.getParameter("pw2");// 取得密码2
			LoginDao db = new LoginDao();// 构建数据库对象

			try {
				registerState = (String) db.Register(Name, pw1,pw2);
				if (registerState.equalsIgnoreCase("nameExist")) {
					System.out.println("用户名已存在！");
					response.sendRedirect("mainPage.jsp?Eregister=nameExist");
				} else if (registerState.equalsIgnoreCase("differentPw")) {
					System.out.println("两次密码不同！");
					response.sendRedirect("mainPage.jsp?Eregister=differentPw");
				} else if (registerState.equalsIgnoreCase("registerSuccess")) {
					System.out.println("注册成功！");
					response.sendRedirect("mainPage.jsp?Eregister=registerSuccess");
				} 
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}


		/*
		//获取页面
		String adminName = request.getParameter("adminName");// 取得用户名
		String password = request.getParameter("password");// 取得密码
		LoginDao db = new LoginDao();// 构建数据库对象
		
		String loginState;
		try {
			loginState = (String) db.loginSuccess(adminName, password);
			if (loginState.equalsIgnoreCase("loginManager")) {// 实现根据不同权限登陆，跳转不同页面
				System.out.println("manager登录成功！");
				response.sendRedirect("pages/manager/managerHome.jsp");
			} else if (loginState.equalsIgnoreCase("loginUser")) {
				System.out.println("user登录成功！");
				response.sendRedirect("pages/user/userHome.jsp");
			} else if (loginState.equalsIgnoreCase("loginGuest")) {
				System.out.println("guest登录成功！");
				response.sendRedirect("pages/guest/guestHome.jsp");
			} 
			*//********* 测试页面************//*
			else if (loginState.equalsIgnoreCase("test")) {
				System.out.println("test登录成功！");
				response.sendRedirect("pages/test/roomindex.jsp");
			}
			*//********* 测试页面************//*
			else if(loginState.equalsIgnoreCase("loginNameError")){
				System.out.println("用户名不存在！");
				response.sendRedirect("mainPage.jsp?error=noname");
			}else if(loginState.equalsIgnoreCase("loginPasswordError")){
				System.out.println("密码错误！");
				response.sendRedirect("mainPage.jsp?error=wrongPw");
			}else if(loginState.equalsIgnoreCase("loginUnknowAu")){
				System.out.println("未知权限登录！");
				response.sendRedirect("mainPage.jsp?error=loginUnknowAu");
			}else {
				System.out.println("密码错误！");
				response.sendRedirect("mainPage.jsp?error=unknowError");
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
	}
}
