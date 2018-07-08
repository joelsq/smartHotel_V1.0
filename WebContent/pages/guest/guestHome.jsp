<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>客人信息</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/media/css/guestHome.css">
</head>
<body>
	<div class="contain">
		<div class="bgimg">
			<img src="../../media/image/bgimg1.jpg" />
		</div>
		<div class="ordermMessage">
			<div class="ordernav">客人信息</div>
			<table>
				<tr>
					<td>姓名</td>
					<td><input type="text" name="username" placeholder="请输入姓名" /></td>
				</tr>
				<tr>
					<td>性别</td>
					<td align="left">男<input type="radio" name="sex" value="man" />
						女<input type="radio" name="sex" value="woman" /> 保密<input
						type="radio" name="sex" value="bm" checked />
					</td>
				</tr>
				<tr>
					<td>手机号码</td>
					<td><input type="text" name="telephone" placeholder="请输入手机号码" /></td>
				</tr>
				<tr>
					<td>房间数量</td>
					<td><input type="text" name="roomsum" placeholder="请输入房间数量" />
				</tr>
				<tr>
					<td>入住人数</td>
					<td><input type="text" name="intakesum" placeholder="请输入入住人数" />
				</tr>
				<tr>
					<td>预定天数</td>
					<td><input type="text" name="bookday" placeholder="请输入预定天数" />
				</tr>
				<tr>
					<td>入住时间</td>
					<td><input type="date"></td>
				</tr>
				<tr>
					<td>餐饮类型</td>
					<td><select name="foodtype">
							<option value="xz">--请选择--</option>
							<option value="breakfirst" selected>早餐</option>
							<option value="lunch">午餐</option>
							<option value="dinner">晚餐</option>
					</select></td>
				</tr>
				<tr>
					<td colspan="2"><input type="button" class="btn" name="bt"
						value="确认信息" /></td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>