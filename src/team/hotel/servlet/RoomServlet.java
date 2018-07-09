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
@WebServlet("/RoomServlet")
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
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		RoomDao db = new RoomDao();

		String method = request.getParameter("method");// 请求的操作
		if (method == null || method.equals("")) {
			method = "index";
		}

		/******************* 主页index ******************/
		if (method.endsWith("index")) {
			List<Room> roomlist = db.readRoom();
			session.setAttribute("roomlist", roomlist);
			
			response.sendRedirect("pages/manager/managerHome.jsp");
			//测试页面
			//response.sendRedirect("pages/test/roomindex.jsp");
			return;
		}
		/******************* 添加 ******************/
		else if (method.endsWith("add")) {
			String roomNum = request.getParameter("roomNum");
			String roomType = request.getParameter("roomType");
			String maxnum = request.getParameter("roomMaxnumOfPeople");
			String area = request.getParameter("roomArea");
			String price = request.getParameter("roomPrice");
			Room room = new Room(null, roomNum, roomType,area, maxnum, price, null, null, null, null, "0");
			boolean success = db.RoomAdd(room);
			System.out.println("新增房间：" + success);
			if (success)
				out.print("<script>alert('新增成功!');window.location='RoomServlet?method=index';</script>");
			else
				out.print("<script>alert('编号重复，新增失败!');window.location='RoomServlet?method=index';</script>");
			return;
		}
		/******************* 查询 ******************/
		else if (method.endsWith("select")) {
			System.out.println("进入RoomSelect");
			// 接受表单内容
			String roomNum = request.getParameter("roomNum");
			String roomType = request.getParameter("roomType");
			String maxnum = request.getParameter("roomMaxnumOfPeople");
			String isStay = request.getParameter("roomIsStay");
			Room r = new Room(null, roomNum, roomType, maxnum, null, null, null, null, null, null, isStay);
			// 查询消息列表并传给页面
			request.setAttribute("roomlist", db.RoomList(r));
			// 向页面跳转(刷新页面)
			request.getRequestDispatcher("pages/manager/managerHome.jsp").forward(request, response);
		}
		/******************* 更新页面跳转和数据传输 ******************/
		else if (method.endsWith("updateBefore")) {
			String num = request.getParameter("num");
			System.out.println("edit处理中！房间编号为：" + num);
			Room r = new Room(null, num, null, null, null, null, null, null, null, null, "0");
			List<Room> room = db.RoomList(r);
			System.out.println(room.get(0));
			session.setAttribute("updateRoom", room.get(0));// 传到页面的实体，用于提取当前的值
			request.getRequestDispatcher("pages/manager/managerHome.jsp").forward(request, response);
			//测试页面
			//response.sendRedirect("pages/test/roomUpdate.jsp");
			return;
		}
		/******************* 更新操作 ******************/
		else if (method.endsWith("update")) {
			System.out.println("update处理中！");
			String roomNum = request.getParameter("roomNum");
			String roomType = request.getParameter("roomType");
			String roomArea = request.getParameter("roomArea");
			String maxnum = request.getParameter("roomMaxnumOfPeople");
			String roomPrice = request.getParameter("roomPrice");
			Room r = new Room(null, roomNum, roomType, roomArea, maxnum, roomPrice, null, null, null, null, null);
			boolean canUpdate = db.RoomUpdate(r);
			if (canUpdate) {// 根据登陆情况，跳转页面
				out.print("<script>alert('修改成功！');window.location='RoomServlet?method=index';</script>");
			} else {
				out.print("<script>alert('修改失败！');window.location='RoomServlet?method=index';</script>");
			}
			return;
		}
		/******************* 删除 ******************/
		else if (method.endsWith("delete")) {
			String num = request.getParameter("num");
			boolean success = db.RoomDelete(num);
			if (success)
				out.print("<script>alert('删除成功!');window.location='RoomServlet?method=index'</script>");
			else
				out.print("<script>alert('删除失败!');window.location='RoomServlet?method=index</script>");
		}
	}

}
