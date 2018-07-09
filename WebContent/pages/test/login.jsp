<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员登陆</title>
<!-- 注意事项 -->
<!-- 请勿更改action、method、id、name等有关数据和控制的命名 -->
<!-- 注意事项 -->
<body>
	<div class="container" style="text-align: center">
		<div class="row clearfix">
			<div class="col-md-5 column"></div>
			<div class="col-md-7 column">
				<br>
				<form action="Login" method="post" class="form-horizontal"
					role="form">
					<div style="text-align: center" class="form-group">
						<label for="adminName" class="col-sm-2 control-label">管理员姓名</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="adminName"
								name="adminName" />
						</div>
					</div>
					<div style="text-align: center" class="form-group">
						<label for="adminPassword" class="col-sm-2 control-label">管理员密码</label>
						<div class="col-sm-4">
							<input type="password" class="form-control" id="password"
								name="password" />
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-2">
							<div class="checkbox">
								<label><input type="checkbox" />记住我</label>
							</div>
						</div>


						<div class="col-sm-offset-0 col-sm-1">
							<button type="submit" class="btn btn-default">Sign in</button>

						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

</body>

<script> 
  var errori ='<%=request.getParameter("error")%>';
	if (errori == 'yes') {
		alert("登录失败!");

	}
</script>
</html>