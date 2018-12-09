<%@ page import="com.oracledp.book.model.BookTuShu" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>图书修改</title>
<!-- 告诉浏览器不要说话 -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- bootstrap css 样式 -->
<!--  <link href="bower_components/bootstrap/dist/css/bootstrap.css" rel="stylesheet" type="text/css" />-->

<!-- 主题css -->
<link href="bower_components/bootswatch/dist/cerulean/bootstrap.css" rel="stylesheet" type="text/css" />
<!-- 日期css -->
<link href="bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker3.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.custom-file-label::after {

	content: "浏览";
}
</style>


</head>
<body>
	<form method="post" action="dobook" enctype="multipart/form-data">
        <%
		 BookTuShu book = (BookTuShu)request.getAttribute("book");

		%>
		<input type="hidden" name="id" value="<%=book.getId()%>">

		<div class="form-group row">
			<label for="inputBid" class="col-sm-2 col-form-label">大类</label>
			<div class="col-sm-10">
				<select name="bid" class="form-control" id="inputBia">
					<option value="-1">---请选着-----</option>



				</select>
			</div>
		</div>

		<div class="form-group row">
			<label for="inputsid" class="col-sm-2 col-form-label">小类</label>
			<div class="col-sm-10">
				<select name="sib" class="form-control" id="inputSia">


				</select>
			</div>
		</div>

		<div class="form-group row">
			<label for="inputname" class="col-sm-2 col-form-label">书名</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="inputName" placeholder="书名" name="name" value="<%= book.getName()%>">
			</div>
		</div>

		<div class="form-group row">
			<label for="inputPrice" class="col-sm-2 col-form-label">价格</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="inputPrice" placeholder="价格" name="price" value="<%= book.getPrice()%>">
			</div>
		</div>

		<div class="form-group row">
			<label for="inputauthor" class="col-sm-2 col-form-label">作者</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="inputauthor" placeholder="作者" name="author" value="<%= book.getAuthor()%>">
			</div>
		</div>

		<div class="form-group row">
			<label for="inputcbs" class="col-sm-2 col-form-label">出版设</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="inputcbs" placeholder="出版设" name="cbs" value="<%= book.getCbs()%>">
			</div>
		</div>



		<div class="form-group row">
			<label for="inpucbdate" class="col-sm-2 col-form-label">日期</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="inpucbdate" placeholder="日期" name="cbdate" value="<%= book.getCbdate()%>">
			</div>
		</div>

		<div class="form-group row">
			<label for="inpuczishu" class="col-sm-2 col-form-label">字数</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="inpuczishu" placeholder="字数" name="zishu" value="<%= book.getZishu()%>">
			</div>
		</div>

		<div class="form-group row">
			<label for="inputPhoto" class="col-sm-2 col-form-label">图片</label>
			<div class="col-sm-10">
				<div class="input-group">
					<div class="custom-file">
						<input type="file" class="custom-file-input" id="inputPhoto" aria-describedby="inputGroupFileAddon04" name="photo">
						<label class="custom-file-label" for="inputGroupFile04">请选择文件</label>


					</div>


				</div>
				<img src="upload/<%= book.getTupian()%>" width="100px" height="100px">
			</div>
		</div>
		
		<div class="form-group row">
			<div class="col-sm-10">
				<button type="submit" class="btn btn-primary">修改</button>
			</div>
		</div>
	</form>


</body>
<!-- bootstrap js 行为 -->
<script type="text/javascript" src="bower_components/jquery/dist/jquery.js"></script>
<!-- jquery js行为 -->
<script type="text/javascript" src="bower_components/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<!--必填 js-->
<script type="text/javascript" src="bower_components/jquery-validation/dist/jquery.validate.js"></script>

<script type="text/javascript" src="bower_components/jquery-validation/dist/additional-methods.js"></script>



	
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
			document.getElementById("inputBia").appendChild(op);
		}
		$("#inputBia").val('<%=request.getAttribute("bid")%>')
		//让小类填充
        $("#inputBia").trigger("change")
	}

	function bookcheckSm(types) {

		for (var i = 0; i < types.length; i++) {
			var op = new Option(types[i].name, types[i].id);
			document.getElementById("inputSia").appendChild(op);
		}
		$("#inputSia").val('<%= book.getSib()%>')
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
		jsonpCallback : "fillsel", //大类的方法
		dataType : "jsonp"

	})
	//给大类change
	$("#inputBia").change(function() {
		document.getElementById("inputSia").innerHTML = "";
		$.ajax({
			type : "GET", //GET 请求  不写默认GET
			url : "bookcheckSma", //url 请求
			jsonpCallback : "bookcheckSm",
			data : "bid=" + $(this).val(),
			dataType : "jsonp"

		})

	});
</script>
<script type="text/javascript" src="bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.js"></script>

<script type="text/javascript" src="bower_components/bootstrap-datepicker/js/locales/bootstrap-datepicker.zh-CN.js" charset="UTF-8"></script>

<script type="text/javascript">
	$('#inpucbdate').datepicker({
		language : 'zh-CN',
		format : 'yyyy-mm-dd',
		autoclose : true,
		defaultViewDate : {
			year : new Date().getFullYear() - 18
		}
	});
	</script>
     



</html>