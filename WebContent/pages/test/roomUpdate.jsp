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
	<div class="col-md-6 column" style="background: #eeeeee">
		<h4 align="center">更新房间信息</h4>
		<form action="<%=request.getContextPath()%>/RoomUpdate" method="POST"
			class="form-horizontal">
			<div class="form-group">
				<label for="roomType" class="col-sm-2 control-label">房间类型</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" id=""
						name="roomType" />
				</div>
			</div>
			<div class="form-group">
				<label for="update_goods_name" class="col-sm-2 control-label">货物名</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" id=""
						name="update_goods_name" />
				</div>
			</div>
			<div class="form-group">
				<label for="update_goods_price" class="col-sm-2 control-label">单价</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" id="" name="update_price" />
				</div>
			</div>
			<div class="form-group">
				<label for="update_goods_quantity" class="col-sm-2 control-label">数量</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" id=""
						name="update_quantity" />
				</div>
			</div>
			<div class="form-group">
				<label for="update_owner_id" class="col-sm-2 control-label">货主ID</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" id=""
						name="update_owner_id" />
				</div>
			</div>
			<div class="form-group">
				<label for="update_warehouse_id" class="col-sm-2 control-label">仓库ID</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" id=""
						name="update_warehouse_id" />
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-4">
					<button type="submit" value="提交" class="btn btn-default">提交表单</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>