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

import team.hotel.dao.RoomDao;
import team.hotel.domain.Room;

/**
 * Servlet implementation class RoomServlet
 */
// @WebServlet("/RoomServlet")
public class RoomServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RoomServlet() {
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
		String method = request.getParameter("method");
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		PrintWriter out = response.getWriter();

		RoomDao db = new RoomDao();

		/**
		 * 增加
		 */
		if(method.endsWith("index"))
			request.getRequestDispatcher("pages/test/roomindex.jsp").forward(request, response);
		
		if (method.endsWith("add")) {
			String roomNum = request.getParameter("roomNum");
			String roomType = request.getParameter("roomType");
			String maxnum = request.getParameter("roomMaxnumOfPeople");
			String area = request.getParameter("roomArea");
			String price = request.getParameter("roomPrice");
			boolean success = db.RoomAdd(null, roomNum, roomType, area, maxnum, price, null, null, null, null, "0");
			if (success)
				out.print("<script>alert('新增成功!');window.location='RoomServlet?method=index'</script>");
			else
				out.print("<script>alert('新增失败!');window.location='RoomServlet?method=index</script>");
			
			
		}
		/**
		 * 查询
		 */
		else if (method.endsWith("select")) {
			System.out.println("进入RoomSelect");
			// 接受表单内容
			String roomNum = request.getParameter("roomNum");
			String roomType = request.getParameter("roomType");
			String maxnum = request.getParameter("roomMaxnumOfPeople");
			String isStay = request.getParameter("roomIsStay");

			/*
			 * 向页面传值 request.setAttribute("roomNum", roomNum);
			 * request.setAttribute("roomType",roomType);
			 * request.setAttribute("roomMaxnumOfPeople",roomMaxnumOfPeople);
			 * request.setAttribute("roomIsStay ",roomIsStay );
			 */
			// 业务需要
			RoomDao DB = new RoomDao();
			// 查询消息列表并传给页面
			request.setAttribute("roomList", DB.RoomList(roomNum, roomType, maxnum, isStay));
			// 向页面跳转(刷新页面)
			request.getRequestDispatcher("pages/test/roomindex.jsp").forward(request, response);
		} else if (method.endsWith("update")) {

			request.getRequestDispatcher("pages/test/roomUpdate.jsp").forward(request, response);
		} else if (method.endsWith("delete")) {
			String num = request.getParameter("num");
			db.RoomDelete(num);
			out.print("<script>alert('删除成功！');window.location='RoomSerlvet?method=index';</script>");
			return;
		}
	}

}
