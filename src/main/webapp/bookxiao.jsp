<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>图书简介</title>
<!-- 告诉浏览器不要说话 -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- bootstrap css 样式 -->
<!--  <link href="bower_components/bootstrap/dist/css/bootstrap.css" rel="stylesheet" type="text/css" />-->

<!-- 主题css -->
<link href="bower_components/bootswatch/dist/cerulean/bootstrap.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<form method="post" action="small">
		<div class="form-group row">
			<label for="inputBid" class="col-sm-2 col-form-label">大类</label>
			<div class="col-sm-10">
				<select name="bid" class="form-control" id="inputTia">
				<option>----请选着---</option>


				</select>
			</div>
		</div>

		<div class="form-group row">
			<label for="inputEmail3" class="col-sm-2 col-form-label">小说</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="inputEmail3" placeholder="小类名" name="name">
			</div>
		</div>

		<div class="form-group row">
			<div class="col-sm-10">
				<button type="submit" class="btn btn-primary">添加</button>
			</div>
		</div>
	</form>
	
</body>
<!-- bootstrap js 行为 -->
<script type="text/javascript" src="bower_components/jquery/dist/jquery.js"></script>
<!-- jquery js行为 -->
<script type="text/javascript" src="bower_components/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

<script type="text/javascript">
	//
	var xhr = new XMLHttpRequest();

	xhr.open("GET", "bookcheck"); //	开启拨号

	xhr.send();//点击拨打

	/*xhr.onreadystatechange=function(){
		if(xhr.readyState==4){//请求完全收到
			if(xhr.status==200){//请求成功
				//console.dir(xhr.responseText);
				//javascrinpt代码执行
				//eval(xhr.responseText);
				eval(xhr.responseText);
				}
			}

		}*/
	function fillsel(types) {

		for (var i = 0; i < types.length; i++) {
			var op = new Option(types[i].name, types[i].id);
			document.getElementById("inputTia").appendChild(op);
		}
	}
	//动态创建script元素

	/*var script=document.createAttribute("script");
	script.src="bookcheck";
	document.body.appendChild(script);*/

	/*var script=document.createElement("script");
	script.src="bookcheck";
	document.body.appendChild(script);*/

	$.ajax({
		type : "GET", //GET 请求  不写默认GET
		url : "bookcheck", //url 请求
		jsonpCallback :"fillsel",
		dataType :"jsonp"
			

	})
</script>



</html>