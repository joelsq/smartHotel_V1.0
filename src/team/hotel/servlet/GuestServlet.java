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

import team.hotel.dao.GuestDao;
import team.hotel.domain.Guest;

/**
 * Servlet implementation class GuestServlet
 */
@WebServlet("/GuestServlet")
public class GuestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GuestServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		GuestDao db = new GuestDao();

		String method = request.getParameter("method");//请求的操作
		if (method == null || method.equals("")) {
			method = "index";
		}

		/******************* 管理员查看所有客人信息 ******************/
		if (method.endsWith("index")) {
			List<Guest> guestlist = db.GuestRead();
			session.setAttribute("guestlist", guestlist);
			response.sendRedirect("pages/test/guestindex.jsp");
			return;
		}
		
		/******************* 添加客人 ******************/
		else if (method.endsWith("add")) {
			String guestName = request.getParameter("guestName");
			String guestPhone = request.getParameter("guestPhone");
			String docNum = request.getParameter("docNum");
			String gender = request.getParameter("gender");
			Guest guest=new Guest(null, guestName, guestPhone, null, docNum, gender, null, null);
			boolean success = db.GuestAdd(guest);
			System.out.println("新增客人：" + success);
			if (success)
				out.print("<script>alert('新增成功!');window.location='GuestServlet?method=index';</script>");
			else
				out.print("<script>alert('编号重复，新增失败!');window.location='GuestServlet?method=index';</script>");
			return;
		}
		/******************* 查询 ******************/
		else if (method.endsWith("select")) {
			System.out.println("进入GuestSelect");
			// 接受表单内容
			String guestName = request.getParameter("guestName");
			String phoneNum = request.getParameter("guestphoneNum");
			String docNum = request.getParameter("guestDocNum");
			String gender=request.getParameter("gender");
			Guest guest=new Guest(null, guestName,phoneNum, "123456", docNum,gender,null, null);
			
			// 查询消息列表并传给页面
			request.setAttribute("guestlist", db.GuestSelect(guest));
			// 向页面跳转(刷新页面)
			request.getRequestDispatcher("pages/test/guestindex.jsp").forward(request, response);
		}
		/*******************更新页面跳转和数据传输 ******************/
		else if (method.endsWith("updateBefore")) {
			String phoneNum = request.getParameter("phoneNum");
			System.out.println("edit处理中！客人编号为：" + phoneNum);
			Guest guest=new Guest(null, null,phoneNum, null,null,null,null, null);
			List<Guest> guestlist = db.GuestSelect(guest);
			System.out.println(guestlist.get(0));
			session.setAttribute("updateGuest", guestlist.get(0));// 传到页面的实体，用于提取当前的值
			response.sendRedirect("pages/test/guestUpdate.jsp");
			return;
		}
		/******************* 更新操作 ******************/
		else if (method.endsWith("update")) {
			System.out.println("update处理中！");
			String guestName = request.getParameter("guestName");
			String guestPhone = request.getParameter("guestPhone");
			String docNum = request.getParameter("docNum");
			String gender = request.getParameter("gender");
			Guest guest=new Guest(null, guestName, guestPhone, null, docNum, gender, null, null);

			boolean canUpdate = db.GuestUpdate(guest);
			if (canUpdate) {// 根据登陆情况，跳转页面
				out.print("<script>alert('修改成功！');window.location='GuestServlet?method=index';</script>");
			} else {
				out.print("<script>alert('修改失败！');window.location='GuestServlet?method=index';</script>");
			}
			return;
		}
		/******************* 删除******************/
		else if (method.endsWith("delete")) {
			String phoneNum = request.getParameter("phoneNum");
			boolean success = db.GuestDelete(phoneNum);
			if (success)
				out.print("<script>alert('删除成功!');window.location='GuestServlet?method=index'</script>");
			else
				out.print("<script>alert('删除失败!');window.location='GuestServlet?method=index</script>");
		}
	}

}
