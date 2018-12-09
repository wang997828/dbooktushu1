<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>大类</title>
<!-- 告诉浏览器不要说话 -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- bootstrap css 样式 -->
<!--  <link href="bower_components/bootstrap/dist/css/bootstrap.css" rel="stylesheet" type="text/css" />-->

<!-- 主题css -->
<link href="bower_components/bootswatch/dist/cerulean/bootstrap.css" rel="stylesheet" type="text/css" />

</head>
<form method="post" action="BookAdd">
	<div class="form-group row">
		<label for="inputEmail3" class="col-sm-2 col-form-label">大类</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="inputEmail3" name="name">
		</div>
	</div>

	<div class="form-group row">
		<div class="col-sm-10">
			<button type="submit" class="btn btn-primary">添加</button>
		</div>
	</div>
</form>

<body>
	<!-- bootstrap js 行为 -->
	<script type="text/javascript" src="bower_components/jquery/dist/jquery.slim.js"></script>
	<!-- jquery js行为 -->
	<script type="text/javascript" src="bower_components/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
