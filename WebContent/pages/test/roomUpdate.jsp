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
</head>
<body>
	<!-- 新增房间 -->
	<form action="<%=request.getContextPath()%>/RoomServlet?method=update"
		id="RoomForm" method="post">
		<!-- 输入栏 -->
		<table class="tab1">
			<tbody>
				<tr>
					<td align="justify">房间编号</td>
					<td><input name="roomNum" type="text" class="allInput"
						value="${roomNum}" /></td>

					<td align="justify">房间类型</td>
					<td><input name="roomType" type="text" class="allInput"
						value="${roomType}" /></td>

					<td align="justify">房间可容纳人数</td>
					<td><input name="roomMaxnumOfPeople" type="text"
						class="allInput" value="${roomMaxnumOfPeople}" /></td>

					<td align="justify">面积</td>
					<td><input name="roomArea" type="text" class="allInput"
						value="${roomArea}" /></td>

					<td align="justify">价格</td>
					<td><input name="roomPrice" type="text" class="allInput"
						value="${roomPrice}" /></td>
					<td align="justify">
						<button type="submit" class="tabSub" value="update">修改</button>
				</tr>
			</tbody>
		</table>
	</form>
</body>
</html>