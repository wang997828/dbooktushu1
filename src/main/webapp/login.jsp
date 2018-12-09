
<%@ page import="com.oracledp.book.model.Admin" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Set" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="charset=UTF-8">
<head>
<title>登陆</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="bower_components/bootswatch/dist/materia/bootstrap.css"
	rel="stylesheet" type="text/css" />
</head>
<body>

	<div class="container-fluid" style="width: 80%;">
		<div class="row">
			<div class="col-md-12">
				<div class="card">

					<div class="card-body">
						<%--
							Map<String,String> map = (Map<String, String>) request.getAttribute("map");

							if(map!=null){
								Set<String> keSet=map.keySet();
								for (String set: keSet){
									out.print(set + "------" + map.get(set));
								}
							}
						--%>
						<%
							Map<String,String> map = (Map<String, String>) request.getAttribute("map");
							Admin admin = (Admin) request.getAttribute("admin");

							if (admin != null) {
						%>
						<form method="post" action="admin" autocomplete="off">
							<div class="form-group row">

								<label for="inputPwd" class="col-sm-2 col-form-label text-right">用户名</label>

								<div class="col-sm-10">
									<%
                                        if(map.get("name")!=null&&map!=null){
									%>
									<input type="text" class="form-control is-invalid" id="inputname" placeholder="用户名" name="name" value="<%=admin.getName()%>">
									<div class="invalid-feedback">
										<%=map.get("name")%>
									</div>
									<%
									}else{
									%>
									<input type="password" class="form-control" id="inputname" placeholder="用户名" name="name" value="<%=admin.getName()%>">
									<%
										}
									%>
								</div>
							</div>
							<div class="form-group row">

								<label for="inputPwd" class="col-sm-2 col-form-label text-right">密码</label>

								<div class="col-sm-10">
									<%if(map.get("pwd")!=null&&map!=null){
									%>
									<input type="password" class="form-control is-invalid" id="inputPwd" placeholder="密码" name="pwd" value="<%=admin.getPwd()%>">
									<div class="invalid-feedback">
										<%=map.get("pwd")%>
									</div>
									<%
									}else{
									    %>
									<input type="password" class="form-control" id="inputPwd" placeholder="密码" name="pwd" value="<%=admin.getName()%>">
									<%
									}
									%>
								</div>
							</div>
							<div class="form-group row">
								<label for="inputPwd" class="col-sm-2 col-form-label text-right">验证码</label>
								<div class="col-sm-5">
                                    <%
                                    if(map.get("vcode")!=null&&map!=null){


                                        %>
                                    <input  class="form-control is-invalid" id="inputYanzheng"
                                            placeholder="验证码" name="vcode">
                                    <div class="invalid-feedback">
                                      <%= map.get("vcode")%>

                                    </div>

                                    <%

                                    }else{

							    %>
                                    <input  class="form-control invalid-feedback" id="inputYanzheng"
                                            placeholder="验证码" name="vcode">
                                    <%
                                    }
                                    %>

								<%

								if(request.getAttribute("msg")!=null){
								    %>

									<%=request.getAttribute("msg")%>
									<%
								}
								%>

								</div>

								<div class="col-sm-5">
									<img src="vcode.png" id="inputyanzheng" title="看不清点一点">
								</div>
							</div>

							<div class="form-group row">
								<div class="col-sm-2"></div>
								<div class="col-sm-10">
									<button type="submit" class="btn btn-primary">登陆</button>
								</div>
							</div>
						</form>
						<%
							} else {
						%>
						<form method="post" action="admin">
							<div class="form-group row">
								<label for="inputEmail3"
									class="col-sm-2 col-form-label text-right">用户名</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputEmail3"
										placeholder="用户名" name="name">
								</div>
							</div>
							<div class="form-group row">
								<label for="inputPwd" class="col-sm-2 col-form-label text-right">密码</label>
								<div class="col-sm-10">
									<input type="password" class="form-control" id="inputPwd"
										placeholder="密码" name="pwd">
								</div>
							</div>

							<div class="form-group row">
								<label for="inputPwd" class="col-sm-2 col-form-label text-right">验证码</label>
								<div class="col-sm-5">
									<input  class="form-control" id="inputYanzheng"
											placeholder="验证码" name="vcode">
								</div>

								<div class="col-sm-5" >
									<img src="vcode.png" id="inputyanzheng" title="看不清点一点">
								</div>
							</div>
							<div class="form-group row">
								<div class="col-sm-2"></div>
								<div class="col-sm-10">
									<button type="submit" class="btn btn-primary">登陆</button>
								</div>
							</div>
						</form>
						<%
							}
						%>

					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript"
		src="bower_components/bootstrap/dist/js/bootstrap.js"></script>
	<script type="text/javascript"
		src="bower_components/jquery/dist/jquery.slim.js"></script>

	<script type="text/javascript">
		$(function () {
			$("#inputyanzheng").click(function () {
				$("#inputyanzheng").attr("src","vcode.png?T=" + Math.random());
            })
        });



	</script>
</body>

</html>