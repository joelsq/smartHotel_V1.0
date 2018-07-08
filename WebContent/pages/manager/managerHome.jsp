<%@ page language="java" contentType="text/html; charset=UTF-8"
<<<<<<< HEAD
    pageEncoding="UTF-8"%>
<%@page
	import="team.hotel.dao.RoomDao,	team.hotel.domain.Room,	java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
=======
	pageEncoding="UTF-8"%>
>>>>>>> 550e013a90ee2e8f61052e4deae62c516b48b9a3
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>酒店</title>
    <style type="text/css">
        .nav{
            border-radius: 4px;
        }
        .list-group-item{
            position: relative;
        }
        .list-group-item > input{
            position: absolute;
            left:200px;
        }
        .tabSub{
            width:80px;
            height:30px;
            background: #337ab7;
            color:#fff;
            margin-left:280px;
            border:none;
        }
    </style>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<<<<<<< HEAD

    <div class="container">
        <div class="row clearfix">
            <div class="col-md-12 column">
                <div class="tabbable" id="tabs-672275">
                    <ul class="nav nav-tabs">
                        <li class="active">
                             <a href="#panel-633686" data-toggle="tab">客房标准管理</a>
                        </li>
                        <li>
                             <a href="#panel-314816" data-toggle="tab">酒店信息管理</a>
                        </li>
                        <li>
                             <a href="#panel-314817" data-toggle="tab">用户管理</a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="panel-633686">
                            <div class="row clearfix">
                                <div class="col-md-12 column">
                                    <div class="list-group">
                                        <div class="panel-group" id="panel-177841">
                                        
                                        	<!-- 增加功能 -->
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    <a class="panel-title list-group-item collapsed active" data-toggle="collapse" data-parent="#panel-177841" href="#panel-element-45716">增加客房信息</a>
                                                </div>
                                                <!-- 新增房间 -->
                                                <div id="panel-element-45716" class="panel-collapse collapse">
                                                    <form action="<%=request.getContextPath()%>/RoomServlet?method=add"
                                                        id="RoomForm" method="post">
                                                        <!-- 输入栏 -->
                                                        <div class="list-group-item">
                                                            房间编号<input name="roomNum" type="text" class="allInput" value="${roomNum}" />
                                                        </div>
                                                        <div class="list-group-item">
                                                            房间类型<input name="roomType" type="text" class="allInput" value="${roomType}" />
                                                        </div>
                                                        <div class="list-group-item">
                                                            房间可容纳人数<input name="roomMaxnumOfPeople" type="text" class="allInput" value="${roomMaxnumOfPeople}" />
                                                        </div>
                                                        <div class="list-group-item">
                                                            面积<input name="roomArea" type="text" class="allInput" value="${roomArea}" />
                                                        </div>
                                                        <div class="list-group-item">
                                                            价格<input name="roomPrice" type="text" class="allInput" value="${roomPrice}" />
                                                        </div>
                                                        <div class="list-group-item">
                                                            <button type="submit" class="tabSub" value="add">新增</button>
                                                        </div>
                                                    </form>                        
                                                </div>
                                            </div>               
                                         	
                                         	<!-- 查询功能 -->
                                         	<div class="panel panel-default">
                                                <div class="panel-heading">
                                                    <a class="panel-title list-group-item collapsed active" data-toggle="collapse" data-parent="#panel-177841" href="#panel-element-45717">查询客房信息</a>
                                                </div>
                                                <!-- 新增房间 -->
                                                <div id="panel-element-45717" class="panel-collapse collapse">
                                                  <form action="<%=request.getContextPath()%>/RoomServlet?method=select"
                                                        id="RoomForm" method="post">
                                                        <!-- 查询输入栏 -->
                                                        <!-- 输入栏 -->
                                                        <div class="list-group-item">
                                                            房间编号<input name="roomNum" type="text" class="allInput" value="${roomNum}" />
                                                        </div>
                                                        <div class="list-group-item">
                                                            房间类型<input name="roomType" type="text" class="allInput" value="${roomType}" />
                                                        </div>
                                                        <div class="list-group-item">
                                                            房间可容纳人数<input name="roomMaxnumOfPeople" type="text" class="allInput" value="${roomMaxnumOfPeople}" />
                                                        </div>
                                                        <div class="list-group-item">
                                                            是否入住<input name="roomIsStay" type="text" class="allInput" value="${roomIsStay}" />
                                                        </div>
                                                        <div class="list-group-item">
                                                            <button type="submit" class="tabSub" value="select">查询</button>
                                                        </div>
                                                      </form>        
                                                </div>
                                            </div>
                                        	
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
					href="<%=request.getContextPath()%>/RoomServlet?method=detail&num=${data.getRoomNum()}">详细</a>
					<a
					href="<%=request.getContextPath()%>/RoomServlet?method=update&num=${data.getRoomNum()}">修改</a>
					<a
					href="<%=request.getContextPath()%>/RoomServlet?method=delete&num=${data.getRoomNum()}"
					onclick="javascript:return confirm('确认删除吗？');">删除</a></td>
			</tr>
		</c:forEach>
	</table>
	<%-- <table class="table">
		<thead>
			<tr>
				<th>序号</th>
				<th>房间编号</th>
				<th>类型</th>
				<th>可容纳人数</th>
				<th>是否入住</th>
				<th>操作</th>
			</tr>
		</thead>
		<%
			RoomDao db = new RoomDao();
			List<Room> list = db.readRoom();
			int state = 1;
			for (Room room : list) {
		%>
		<tbody>
			<tr>
				<td><%=state++%></td>
				<td><%=room.getRoomNum()%></td>
				<td><%=room.getRoomType()%></td>
				<td><%=room.getRoomMaxnumOfPeople()%></td>
				<td><%=room.getRoomIsStay()%></td>
				<td><a
					href="<%=request.getContextPath()%>/RoomServlet?method=detail&num=<%=room.getRoomNum()%>">详细</a>
					<a
					href="<%=request.getContextPath()%>/RoomServlet?method=update&num=<%=room.getRoomNum()%>">修改</a>
					<a
					href="<%=request.getContextPath()%>/RoomServlet?method=delete&num=<%=room.getRoomNum()%>"
					onclick="javascript:return confirm('确认删除吗？');">删除</a></td>
			</tr>
		</tbody>
		<%
			}
		%>
	</table> --%>
                                        	
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="panel-314816">

                            <hr/>
                        </div>
                        <div class="tab-pane" id="panel-314817">
                            <p>
                                Howdy, I'm in Section 3.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
=======
	<h3>经理管理页面</h3>
>>>>>>> 550e013a90ee2e8f61052e4deae62c516b48b9a3
</body>
</html>