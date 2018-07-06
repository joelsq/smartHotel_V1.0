package team.hotel.servlet;

import team.hotel.dao.DBRoom;
//import team.hotel.dao.DBUtil;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("进入RoomServlet，doGet函数");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		// 接受表单内容
		String roomId = request.getParameter("roomId");
		String roomNum = request.getParameter("roomNum");
	
		// 向页面传值
		System.out.println("接受表单内容后，向页面传值: roomId="+roomId+",roomNum="+roomNum);
		request.setAttribute("roomId", roomId);
		request.setAttribute("roomNum", roomNum);

		// 业务需要
		DBRoom DB = new DBRoom();
		
		// 查询消息列表并传给页面
		request.setAttribute("roomList", DB.queryRoomList(roomNum));

		// 向页面跳转
		request.getRequestDispatcher("pages/manager/roomlist.jsp").forward(request, response);
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
