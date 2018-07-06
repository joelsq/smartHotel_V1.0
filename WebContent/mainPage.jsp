<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Smart Hotel</title>
        <!-- 新 Bootstrap 核心 CSS 文件 -->
        <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
         
        <!-- 可选的Bootstrap主题文件（一般不使用） -->
        <script src="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"></script>
         
        <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
        <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
         
        <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
        <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="container">
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <ul class="nav nav-tabs">
                        <li class="active">
                             <a href="#">首页</a>
                        </li>
                        <li>
                             <a href="#">简介</a>
                        </li>
                        <li class="disabled">
                             <a href="#">信息</a>
                        </li>
                        
                        <ul class="nav navbar-nav navbar-right">
                          <li> <a id="modal-269755" href="#modal-container-269754" role="button" class="btn" data-toggle="modal"><span class="glyphicon glyphicon-user"></span> 注册</a>
                          <li><a id="modal-269755" href="#modal-container-269755" role="button" class="btn" data-toggle="modal"><span class="glyphicon glyphicon-log-in"></span> 登录</a>
                        </ul>
                    </ul>
                </div>
            </div>


            <!--登陆窗口遮罩层-->
            <div class="modal fade" id="modal-container-269755" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
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


            <!--注册窗口遮罩层，两个遮罩层结构一样，需要改注册的操作-->
            <div class="modal fade" id="modal-container-269754" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
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
                                    <button type="submit" class="btn btn-default">注册</button>

                                </div>
                            </div>
                        </form>
                    </div>
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