package team.hotel.servlet.room;

import team.hotel.dao.RoomDao;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RoomServlet
 */
@WebServlet("/RoomSelect")
public class RoomSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoomSelectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("进入RoomSelect，doGet函数");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		// 接受表单内容
		String roomNum = request.getParameter("roomNum");
		String roomType = request.getParameter("roomType");
		String maxnum = request.getParameter("roomMaxnumOfPeople");
		String  isStay = request.getParameter("roomIsStay");
	
		/* 向页面传值
		System.out.println("接受表单内容后，向页面传值: roomNum="+roomNum);
		request.setAttribute("roomNum", roomNum);
		request.setAttribute("roomType",roomType);
		request.setAttribute("roomMaxnumOfPeople",roomMaxnumOfPeople);
		request.setAttribute("roomIsStay ",roomIsStay );
		 */
				
		// 业务需要
		//RoomDao DB = new RoomDao();
		RoomDao DB=new RoomDao();
		// 查询消息列表并传给页面
		//request.setAttribute("roomList", DB.RoomList(roomNum, roomType, roomMaxnumOfPeople, roomIsStay));
		
		request.setAttribute("roomList", DB.RoomList(roomNum, roomType, maxnum, isStay));
		
		// 向页面跳转(刷新页面)
		request.getRequestDispatcher("pages/test/roomSelect.jsp").forward(request, response);
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
