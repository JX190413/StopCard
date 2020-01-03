<%--
  Created by IntelliJ IDEA.
  User: 14506
  Date: 2019/12/18
  Time: 16:47
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String layuicsspath = request.getContextPath()+"/layuiadmin/layui/css/";
	String layuistyle = request.getContextPath()+"/layuiadmin/style/";
	String layuipath = request.getContextPath()+"/layuiadmin/layui/";
	String path =application.getContextPath();
	String jsPath=request.getContextPath()+"/js/";
	String cssPath=request.getContextPath()+"/css/";
	String uiPath = request.getContextPath() + "/layuiadmin/";
%>
<html>
<head>
	<title>Title</title>
	<link rel="stylesheet" href=<%=uiPath+"layui/css/layui.css"%>>
</head>
<body>
<form class="layui-form">
	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
		<legend>当前时间</legend>
	</fieldset>
<div id="div1" style="font-size: 18px"> </div>
<div class="layui-row" style="padding-top: 200px">
	<div class="layui-col-md4">
		<div class="grid-demo grid-demo-bg1" >
			<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
				<legend>0:00 --8:00 共收款 :${morning} 元</legend>
			</fieldset>
		</div>
	</div>
	<div class="layui-col-md4">
		<div class="grid-demo" >
			<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
				<legend>8:00 --16:00 共收款 : ${noon} 元</legend>
			</fieldset>
		</div>
	</div>
	<div class="layui-col-md4">
		<div class="grid-demo grid-demo-bg1" >
			<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
				<legend>16:00 --24:00 共收款 : ${night} 元</legend>
			</fieldset>
		</div>
	</div>
</div>>
</form>
<script>
	window.onload = function(){
		var oDiv = document.getElementById('div1');
		function timego(){
			var now = new Date();
			var year = now.getFullYear();
			var month = now.getMonth()+1;
			var date = now.getDate();
			var week = now.getDay();
			var hour = now.getHours();
			var minute = now.getMinutes();
			var second = now.getSeconds();
			oDiv.innerHTML =year+'年'+todou(month)+'月'+todou(date)+'日'+' '+toweek(week)+'  '+ todou(hour) +':'+ todou(minute)+':'+todou(second);
		}

		timego();


		setInterval(timego,1000);

	}


	function toweek(num){

		switch(num){
			case 0:
				return '星期天';
				break;
			case 1:
				return '星期一';
				break;
			case 2:
				return '星期二';
				break;
			case 3:
				return '星期三';
				break;
			case 4:
				return '星期四';
				break;
			case 5:
				return '星期五';
				break;
			case 6:
				return '星期六';
				break;
		}
	}

	function todou(num){

		if(num<10){
			return '0'+num;
		}
		else
		{
			return num;
		}

	}

</script>
</body>
</html>
