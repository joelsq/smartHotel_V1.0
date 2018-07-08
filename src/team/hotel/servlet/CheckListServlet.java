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

import team.hotel.dao.CheckListDao;
import team.hotel.domain.CheckList;

/**
 * Servlet implementation class CheckListServlet
 */
@WebServlet("/CheckListServlet")
public class CheckListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckListServlet() {
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
		//doGet(request, response);
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		CheckListDao db = new CheckListDao();

		String method = request.getParameter("method");//请求的操作
		if (method == null || method.equals("")) {
			method = "index";
		}

		/******************* 管理员查看所有客人入住登记信息 ******************/
		if (method.endsWith("index")) {
			List<CheckList> checklist = db.CheckListRead();
			session.setAttribute("guestlist", checklist);
			response.sendRedirect("pages/test/checklistindex.jsp");
			return;
		}
		
		/******************* 添加客人入住登记信息 ******************/
		else if (method.endsWith("add")) {
			String checklistId = request.getParameter("checklistId");
			String guestId = request.getParameter("guestId");
			String roomId = request.getParameter("roomId");
			String checkInDate = request.getParameter("checkInDate");
			String checkDays = request.getParameter("checkDays");
			String checkOutDate = request.getParameter("checkOutDate");
			String checkMealType = request.getParameter("checkMealType");
			String checkNumOfPeople = request.getParameter("checkNumOfPeople");
			String checkRoomConsume = request.getParameter("checkRoomConsume");
			String checkTotalConsume = request.getParameter("checkTotalConsume");
			
			CheckList checklist=new CheckList(checklistId, guestId, roomId, checkInDate, checkDays, checkOutDate, 
					                          checkMealType, checkNumOfPeople,checkRoomConsume,checkTotalConsume);
			
			boolean success = db.CheckListAdd(checklist);
			System.out.println("新增客人入住登记信息：" + success);
			if (success)
				out.print("<script>alert('新增成功!');window.location='CheckListServlet?method=index';</script>");
			else
				out.print("<script>alert('编号重复，新增失败!');window.location='CheckListServlet?method=index';</script>");
			return;
		}
		/******************* 查询客人入住登记信息 ******************/
		else if (method.endsWith("select")) {
			System.out.println("进入CheckListSelect");
			// 接受表单内容
			String checklistId = request.getParameter("checklistId");
			String guestId = request.getParameter("guestId");
			String roomId = request.getParameter("roomId");
			String checkInDate = request.getParameter("checkInDate");
			String checkDays = request.getParameter("checkDays");
			String checkOutDate = request.getParameter("checkOutDate");
			String checkMealType = request.getParameter("checkMealType");
			String checkNumOfPeople = request.getParameter("checkNumOfPeople");
			String checkRoomConsume = request.getParameter("checkRoomConsume");
			String checkTotalConsume = request.getParameter("checkTotalConsume");
			
			CheckList checklist=new CheckList(checklistId, guestId, roomId, checkInDate, checkDays, checkOutDate, 
					                          checkMealType, checkNumOfPeople,checkRoomConsume,checkTotalConsume);
			
			// 查询消息列表并传给页面
			request.setAttribute("checklist", db.CheckListSelect(checklist));
			// 向页面跳转(刷新页面)
			request.getRequestDispatcher("pages/test/checklistindex.jsp").forward(request, response);
		}
		/*******************更新页面跳转和数据传输 ******************/
		else if (method.endsWith("updateBefore")) {
			String checklistId= request.getParameter("num");
			System.out.println("edit处理中！客人入住登记信息编号为：" + checklistId);
			CheckList checklist=new CheckList(checklistId, null,null, null,null,null,null, null,null, null);
			List<CheckList> checklist = db.CheckListSelect(checklist);
			System.out.println(checklist.get(0));
			session.setAttribute("updateCheckList", checklist.get(0));// 传到页面的实体，用于提取当前的值
			response.sendRedirect("pages/test/checklistUpdate.jsp");
			return;
		}
		/******************* 入住登记信息更新操作 ******************/
		else if (method.endsWith("update")) {
			System.out.println("update处理中！");
			String checklistId = request.getParameter("checklistId");
			String guestId = request.getParameter("guestId");
			String roomId = request.getParameter("roomId");
			String checkInDate = request.getParameter("checkInDate");
			String checkDays = request.getParameter("checkDays");
			String checkOutDate = request.getParameter("checkOutDate");
			String checkMealType = request.getParameter("checkMealType");
			String checkNumOfPeople = request.getParameter("checkNumOfPeople");
			String checkRoomConsume = request.getParameter("checkRoomConsume");
			String checkTotalConsume = request.getParameter("checkTotalConsume");
			
			CheckList checklist=new CheckList(checklistId, guestId, roomId, checkInDate, checkDays, checkOutDate, 
					                          checkMealType, checkNumOfPeople,checkRoomConsume,checkTotalConsume);

			boolean canUpdate = db.CheckListUpdate(checklist);
			if (canUpdate) {// 根据登陆情况，跳转页面
				out.print("<script>alert('修改成功！');window.location='CheckListServlet?method=index';</script>");
			} else {
				out.print("<script>alert('修改失败！');window.location='CheckListServlet?method=index';</script>");
			}
			return;
		}
		/******************* 删除客人入住登记信息******************/
		else if (method.endsWith("delete")) {
			String id = request.getParameter("num");
			boolean success = db.CheckListDelete(id);
			if (success)
				out.print("<script>alert('删除成功!');window.location='CheckListServlet?method=index'</script>");
			else
				out.print("<script>alert('删除失败!');window.location='CheckListServlet?method=index</script>");
		}
	}

}
