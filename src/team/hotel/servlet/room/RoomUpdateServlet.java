package team.hotel.servlet.room;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import team.hotel.dao.RoomDao;

/**
 * Servlet implementation class RoomUpdateServlet
 */
@WebServlet("/RoomUpdate")
public class RoomUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoomUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		System.out.println("updateRoom表单数据处理中！");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String type= request.getParameter("roomType");
		String area = request.getParameter("roomArea");
		String maxnum = request.getParameter("roomMaxnum");
		String price= request.getParameter("roomPrice");
		String isStay = request.getParameter("roomIsStay");
		
		RoomDao db = new RoomDao();// 构建数据库对象
		boolean canUpdate=db.RoomUpdate(null, null, type, area,maxnum, price,null,null, null,null,isStay);
		if (canUpdate) {// 根据登陆情况，跳转页面
			System.out.println("更新房间信息成功！");
			out.print("<script>alert('修改成功！')</script>");
			} else {
				out.print("<script>alert('修改失败！')</script>");
			System.out.println("更新房间信息失败！");
		}
		response.sendRedirect("pages/test/roomUpdate.jsp");
	}

}
