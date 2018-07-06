<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<h3 class="text-center">Room Servlet 测试。Good Luck</h3>
				<div class="row clearfix">
					<div class="col-md-6 column">

						<!-- -左上 -->
						<form action="RoomListServlet" id="RoomForm" method="post">
							<br>

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
										<td><input name="roomMaxnumOfPeople" type="text" class="allInput"
											value="${roomMaxnumOfPeople}" /></td>

										<td width="60" align="right">是否入住</td>
										<td><input name="roomIsStay" type="text"
											class="allInput" value="${roomIsStay}" /></td>

										<td width="85" align="right">
											<button type="submit" class="tabSub" value="查 询">查询</button>
									</tr>
								</tbody>
							</table>
							<br>
							<div class="zixun fix">
								<table class="tab2" width="100%">
									<tbody>
										<tr>
											<th><input type="checkbox" id="all" onclick="#" /></th>
											<th>房间编号</th>
											<th>房间类型</th>
											<th>可容纳人数</th>
											<th>是否入住</th>
										</tr>
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
					</div>
					<!-- -左右分界线 -->
					<div class="col-md-6 column">
						<table class="table">
							<thead>
								<tr>
									<th>编号</th>
									<th>产品</th>
									<th>交付时间</th>
									<th>状态</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>TB - Monthly</td>
									<td>01/04/2012</td>
									<td>Default</td>
								</tr>
								<tr class="success">
									<td>1</td>
									<td>TB - Monthly</td>
									<td>01/04/2012</td>
									<td>Approved</td>
								</tr>
								<tr class="error">
									<td>2</td>
									<td>TB - Monthly</td>
									<td>02/04/2012</td>
									<td>Declined</td>
								</tr>
								<tr class="warning">
									<td>3</td>
									<td>TB - Monthly</td>
									<td>03/04/2012</td>
									<td>Pending</td>
								</tr>
								<tr class="info">
									<td>4</td>
									<td>TB - Monthly</td>
									<td>04/04/2012</td>
									<td>Call in to confirm</td>
								</tr>
							</tbody>
						</table>
						<button type="button" class="btn btn-default">Delete</button>
					</div>
				</div>


				<!-- -------------中部分界线 ---------------->
				<div class="row clearfix">
					<div class="col-md-6 column">
						<table class="table">
							<thead>
								<tr>
									<th>编号</th>
									<th>产品</th>
									<th>交付时间</th>
									<th>状态</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>TB - Monthly</td>
									<td>01/04/2012</td>
									<td>Default</td>
								</tr>
								<tr class="success">
									<td>1</td>
									<td>TB - Monthly</td>
									<td>01/04/2012</td>
									<td>Approved</td>
								</tr>
								<tr class="error">
									<td>2</td>
									<td>TB - Monthly</td>
									<td>02/04/2012</td>
									<td>Declined</td>
								</tr>
								<tr class="warning">
									<td>3</td>
									<td>TB - Monthly</td>
									<td>03/04/2012</td>
									<td>Pending</td>
								</tr>
								<tr class="info">
									<td>4</td>
									<td>TB - Monthly</td>
									<td>04/04/2012</td>
									<td>Call in to confirm</td>
								</tr>
							</tbody>
						</table>
						<button type="button" class="btn btn-default">Update</button>
					</div>
					<!-- -左右分界线 -->
					<div class="col-md-6 column">
						<table class="table">
							<thead>
								<tr>
									<th>编号</th>
									<th>产品</th>
									<th>交付时间</th>
									<th>状态</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>TB - Monthly</td>
									<td>01/04/2012</td>
									<td>Default</td>
								</tr>
								<tr class="success">
									<td>1</td>
									<td>TB - Monthly</td>
									<td>01/04/2012</td>
									<td>Approved</td>
								</tr>
								<tr class="error">
									<td>2</td>
									<td>TB - Monthly</td>
									<td>02/04/2012</td>
									<td>Declined</td>
								</tr>
								<tr class="warning">
									<td>3</td>
									<td>TB - Monthly</td>
									<td>03/04/2012</td>
									<td>Pending</td>
								</tr>
								<tr class="info">
									<td>4</td>
									<td>TB - Monthly</td>
									<td>04/04/2012</td>
									<td>Call in to confirm</td>
								</tr>
							</tbody>
						</table>
						<button type="button" class="btn btn-default">Select</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>