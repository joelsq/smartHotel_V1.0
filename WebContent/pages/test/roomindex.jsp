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
<title>房间操作</title>
</head>
<body>
	<h3 class="text-center">Room 增删查改 测试 Good Luck</h3>

	<!-- 新增房间 -->
	<form action="<%=request.getContextPath()%>/RoomServlet?method=add"
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
						<button type="submit" class="tabSub" value="add">新增</button>
				</tr>
			</tbody>
		</table>
	</form>


	<!-- 查询房间 -->
	<h3>所有房间</h3>
	<!-- 房间查询 -->
	<form action="<%=request.getContextPath()%>/RoomServlet?method=select"
		id="RoomForm" method="post">
		<!-- 查询输入栏 -->
		<table class="tab2">
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

					<td align="justify">是否入住</td>
					<td><input name="roomIsStay" type="text" class="allInput"
						value="${roomIsStay}" /></td>

					<td align="justify">
						<button type="submit" class="tabSub" value="select">查询</button>
				</tr>
			</tbody>
		</table>
	</form>

	<table border="1px">
		<tr>
			<th>序号</th>
			<th>房间编号</th>
			<th>类型</th>
			<th>可容纳人数</th>
			<th>是否入住</th>
			<th>操作</th>
		</tr>
		<c:forEach items="${roomlist}" var="data" varStatus="status">
			<tr>
				<td>${status.index+1}</td>
				<td>${data.getRoomNum()}</td>
				<td>${data.getRoomType()}</td>
				<td>${data.getRoomMaxnumOfPeople()}</td>
				<td>${data.getRoomIsStay()}</td>
				<td><a
					href="RoomServlet?method=detail&num=${data.getRoomNum()}">详细</a> <a
					href="RoomServlet?method=updateBefore&num=${data.getRoomNum()}">更新</a>
					<a href="RoomServlet?method=delete&num=${data.getRoomNum()}"
					onclick="javascript:return confirm('确认删除吗？');">删除</a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>