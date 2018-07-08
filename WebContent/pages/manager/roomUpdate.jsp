<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page
	import="team.hotel.dao.RoomDao,	team.hotel.domain.Room,	java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>房间更新</title>
<base href="<%=basePath%>">
</head>
<body>
	<!-- 新增房间 -->
	<h3>更新房间信息</h3>
	<form action="RoomServlet?method=update" method="post">
		编号<input readonly name="roomNum" value="${updateRoom.getRoomNum()}">
		<br> 类型<input name="roomType"
			value="${updateRoom.getRoomType() }"> <br> 面积<input
			name="roomArea" value="${updateRoom.getRoomArea() }"> <br>
		最大可容纳人数<input name="roomMaxnumOfPeople"
			value="${updateRoom.getRoomMaxnumOfPeople()}"> <br> 价格<input
			name="roomPrice" value="${updateRoom.getRoomPrice()}"> <br>
		空调<input type="checkbox" name="checkbox1"
			value="${updateRoom.getRoomAircondition()}"> 电视<input
			type="checkbox" name="checkbox2" value="${updateRoom.getRoomTV()}">
		Wifi<input type="checkbox" name="checkbox3"
			value="${updateRoom.getRoomWifi()}"> 浴室<input type="checkbox"
			name="checkbox4" value="${updateRoom.getRoomWashroom()}"> <br>
		<button type="submit" class="tabSub" value="update">更新</button>
	</form>

</body>
</html>