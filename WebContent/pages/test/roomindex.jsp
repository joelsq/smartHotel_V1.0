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
<title>Good servelt</title>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<h3 class="text-center">Room Select 测试 Good Luck</h3>


	<form action="<%=request.getContextPath()%>/RoomSelect" id="RoomForm"
		method="post">
		<!-- 查询输入栏 -->
		<table class="tab1">
			<tbody>
				<tr>
					<td width="60" align="right">房间编号</td>
					<td><input name="roomNum" type="text" class="allInput"
						value="${roomNum}" /></td>

					<td width="60" align="right">房间类型</td>
					<td><input name="roomType" type="text" class="allInput"
						value="${roomType}" /></td>

					<td width="60" align="right">房间可容纳人数</td>
					<td><input name="roomMaxnumOfPeople" type="text"
						class="allInput" value="${roomMaxnumOfPeople}" /></td>

					<td width="60" align="right">是否入住</td>
					<td><input name="roomIsStay" type="text" class="allInput"
						value="${roomIsStay}" /></td>

					<td width="85" align="right">
						<button type="submit" class="tabSub" value="查 询">查询</button>
				</tr>
			</tbody>
		</table>
		<br>
		<!-- 查询结果 -->
		<div class="zixun fix">
			<table class="tab2" width="100%">
				<tbody>
				<!-- 表格首行 -->
					<tr>
						<th><input type="checkbox" id="all" onclick="#" /></th>
						<th>序号</th>
						<th>房间编号</th>
						<th>房间类型</th>
						<th>可容纳人数</th>
						<th>是否入住</th>
					</tr>
					<!-- 表格主体，显示查询结果 -->
					<c:forEach items="${roomList}" var="room" varStatus="status">
						<tr
							<c:if test="${status.index % 2!= 0}">style="background-color:#81DAF5;"</c:if>>
							<td><input type="checkbox" /></td>
							<td>${status.index+1}</td>
							<td>${room.roomNum}</td>
							<td>${room.roomType}</td>
							<td>${room.roomMaxnumOfPeople}</td>
							<td>${room.roomIsStay}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

		</div>
	</form>


</body>

</html>