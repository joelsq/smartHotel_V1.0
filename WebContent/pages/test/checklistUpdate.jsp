<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page
	import="team.hotel.dao.GuestDao,	team.hotel.domain.Guest,	java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/media/css/mainPageStyle.css">
<link
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">

<!-- 可选的Bootstrap主题文件（一般不使用） -->
<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"></script>

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="<%=basePath%>">
<title>入住表更新</title>
<base href="<%=basePath%>">
</head>
<body>

	<h3>更新入住表信息</h3>
	<form
		action="<%=request.getContextPath()%>/CheckListServlet?method=update"
		id="CheckListForm" method="post">
		<!-- 更新输入栏 -->
		<table class="tab2">
			<tbody>
				<tr>
					<td align="justify">客人编号</td>
					<td><input readonly name="id" type="text" class="allInput"
						value="${updateCheckList.getGuestId()}" /></td>

					<td align="justify">房间号</td>
					<td><input name="Roomid" type="text" class="allInput"
						value="${updateCheckList.getGuestPhone()}" /></td>
				</tr>
				<td align="justify">入住时间</td>
				<td><input name="InDate" type="text" class="allInput"
					value="${updateCheckList.getCheckInDate()}" /></td>

				<td align="justify">入住天数</td>
				<td><input name="days" type="text" class="allInput"
					value="${updateCheckList.getCheckDays()}" /></td>

				<td align="justify">退房时间</td>
				<td><input name="outDate" type="text" class="allInput"
					value="${updateCheckList.getCheckOutDate()}" /></td>
				<tr>
					<td align="justify">餐饮类型</td>
					<td><input name="mealType" type="text" class="allInput"
						value="${updateCheckList.getCheckMealType()}" /></td>

					<td align="justify">入住人数</td>
					<td><input name="numOfPeople" type="text" class="allInput"
						value="${updateCheckList.getCheckNumOfPeople()}" /></td>

					<td align="justify">房间消费</td>
					<td><input name="roomConsume" type="text" class="allInput"
						value="${updateCheckList.getCheckRoomConsume()}" /></td>
				</tr>
				<td align="justify">总消费</td>
				<td><input name="totalConsume" type="text" class="allInput"
					value="${updateCheckList.getCheckTotalConsume()}" /></td>

				<td align="justify">
					<button type="submit" class="tabSub" value="update">更新</button>
				</tr>
			</tbody>
		</table>
	</form>

</body>
</html>