package team.hotel.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import team.hotel.dao.UserDao;
import team.hotel.domain.User;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	//	doGet(request, response);
		
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		UserDao db = new UserDao();

		String method = request.getParameter("method");//请求的操作
		if (method == null || method.equals("")) {
			method = "index";
		}

		/******************* 管理员查看所有用户信息 ******************/
		if (method.endsWith("index")) {
			List<User> userlist = db.UserRead();
			session.setAttribute("userlist", userlist);
			response.sendRedirect("pages/test/userindex.jsp");
			return;
		}
		
		/******************* 添加用户 ******************/
		else if (method.endsWith("add")) {
			String userId = request.getParameter("userId");
			String userName = request.getParameter("userName");
			String password = request.getParameter("password");
			String credits = request.getParameter("credits");
			String authority = request.getParameter("authority");
			User user=new User(userId, userName, password, credits, authority, null, null);
			boolean success = db.UserAdd(user);
			System.out.println("新增用户：" + success);
			if (success)
				out.print("<script>alert('新增成功!');window.location='UserServlet?method=index';</script>");
			else
				out.print("<script>alert('编号重复，新增失败!');window.location='UserServlet?method=index';</script>");
			return;
		}
		/******************* 查询 ******************/
		else if (method.endsWith("select")) {
			System.out.println("进入UserSelect");
			// 接受表单内容
			String userId = request.getParameter("userId");
			String userName = request.getParameter("userName");
			String password = request.getParameter("password");
			String credits = request.getParameter("credits");
			String authority = request.getParameter("authority");
			User user=new User(userId, userName, password, credits, authority, null, null);
			
			// 查询消息列表并传给页面
			request.setAttribute("userlist", db.UserSelect(user));
			// 向页面跳转(刷新页面)
			request.getRequestDispatcher("pages/test/userindex.jsp").forward(request, response);
		}
		/*******************更新页面跳转和数据传输 ******************/
		else if (method.endsWith("updateBefore")) {
			String userId = request.getParameter("userId");
			System.out.println("edit处理中！用户编号为：" + userId);
			User user=new User(userId, null, null,null,null,null, null);
			List<User> userlist = db.UserSelect(user);
			System.out.println(userlist.get(0));
			session.setAttribute("updateUser", userlist.get(0));// 传到页面的实体，用于提取当前的值
			response.sendRedirect("pages/test/userUpdate.jsp");
			return;
		}
		/******************* 更新操作 ******************/
		else if (method.endsWith("update")) {
			System.out.println("update处理中！");
			String userId = request.getParameter("userId");
			String userName = request.getParameter("userName");
			String password = request.getParameter("password");
			String credits = request.getParameter("credits");
			String authority = request.getParameter("authority");
			User user=new User(userId, userName,password, credits, authority, null, null);

			boolean canUpdate = db.UserUpdate(user);
			if (canUpdate) {// 根据登陆情况，跳转页面
				out.print("<script>alert('修改成功！');window.location='UserServlet?method=index';</script>");
			} else {
				out.print("<script>alert('修改失败！');window.location='UserServlet?method=index';</script>");
			}
			return;
		}
		/******************* 删除******************/
		else if (method.endsWith("delete")) {
			String userId = request.getParameter("userId");
			boolean success = db.UserDelete(userId);
			if (success)
				out.print("<script>alert('删除成功!');window.location='UserServlet?method=index'</script>");
			else
				out.print("<script>alert('删除失败!');window.location='UserServlet?method=index</script>");
		}
		
	}

}
