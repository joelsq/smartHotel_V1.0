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
@WebServlet("/RoomListServlet")
public class RoomListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoomListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("进入RoomListServlet，doGet函数");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		// 接受表单内容
		//String roomId = request.getParameter("roomId");
		String roomNum = request.getParameter("roomNum");
		String roomType = request.getParameter("roomType");
		String roomMaxnumOfPeople = request.getParameter("roomMaxnumOfPeople");
		String roomIsStay = request.getParameter("roomIsStay");
	
		// 向页面传值
		System.out.println("接受表单内容后，向页面传值: roomNum="+roomNum);
		request.setAttribute("roomNum", roomNum);
		request.setAttribute("roomType",roomType);
		request.setAttribute("roomMaxnumOfPeople",roomMaxnumOfPeople);
		request.setAttribute("roomIsStay ",roomIsStay );

		// 业务需要
		DBRoom DB = new DBRoom();
		
		// 查询消息列表并传给页面
		request.setAttribute("roomList", DB.RoomList(roomNum, roomType, roomMaxnumOfPeople, roomIsStay));

		// 向页面跳转
		//request.getRequestDispatcher("pages/manager/roomlist.jsp").forward(request, response);
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
