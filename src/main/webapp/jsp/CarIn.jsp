<%--
  Created by IntelliJ IDEA.
  User: 14506
  Date: 2019/12/14
  Time: 12:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String path=application.getContextPath();
%>
<link rel="stylesheet" href="../layuiadmin/layui/css/layui.css" media="all">
<script src="../layuiadmin/layui/layui.js"></script>
<script src="../js/jquery-3.4.1.js"></script>
<html>
<head>
	<title>Title</title>
</head>
<body style="background-image: url('../img/bg1.jpg')">


<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
	<legend>匝道监控</legend>
</fieldset>

<div class="layui-container">
	<div class="layui-main" style="font-size: 30px" >
		<div class="layui-form-item" >
			车牌号：<span id="car"></span>
		</div>
		<div class="layui-form-item">
			空闲车位数：<span id="port"></span>
		</div>
		<div class="layui-form-item">
			当前时间：<span id="nowtime"></span>
		</div>
	</div>
</div>
<div class="layui-fluid">

		<div class="layui-upload">
			<button type="button" class="layui-btn" id="test1">上传图片</button>
			<a class="layui-btn" href="CarIn1.jsp">车库停车</a>
			<div class="layui-upload-list">
				<img class="layui-upload-img" id="demo1">
				<p id="demoText"></p>
			</div>
		</div>

</div>



<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
	$(function () {
		freePort();
		setInterval("freePort()",5000);
	});
	
	function freePort(){
		$.post("<%=path+"/searchFreeCarPort"%>",function (data) {
			$("#port").html(data+"个")
		})
	}
	//实时刷新时间
	$(function () {
		setInterval("NowTime()",1000);
	});
	//获取时间
	function NowTime(){
		//获取年月日
		var time=new Date();
		var year=time.getFullYear();
		var month=time.getMonth();
		var day=time.getDate();

		//获取时分秒
		var h=time.getHours();
		var m=time.getMinutes();
		var s=time.getSeconds();

		//检查是否小于10
		h=check(h);
		m=check(m);
		s=check(s);
		document.getElementById("nowtime").innerHTML=year+"年"+month+"月"+day+"日  "+h+":"+m+":"+s;
	}
	//时间数字小于10，则在之前加个“0”补位。
	function check(i){
		//方法一，用三元运算符
		var num;
		i<10?num="0"+i:num=i;
		return num;

		//方法二，if语句判断
		//if(i<10){
		//    i="0"+i;
		//}
		//return i;
	}

	layui.use('upload', function () {
		var $ = layui.jquery
			, upload = layui.upload;

		//普通图片上传
		var uploadInst = upload.render({
			elem: '#test1'
			, url: '/StopCard/cardIn'
			, before: function (obj) {
				//预读本地文件示例，不支持ie8
				obj.preview(function (index, file, result) {
					$('#demo1').attr('src', result); //图片链接（base64）
				});
			}
			, done: function (res) {
				//如果上传失败
				if (res.code == 0) {
					return layer.msg("上传失败！")
				}
				if (res.code > 0) {
					console.log(res.msg);
					$("#car").html(res.msg)
				//	return layer.msg("上传成功！")

				}

			}
			, error: function () {
				//演示失败状态，并实现重传
				var demoText = $('#demoText');
				demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
				demoText.find('.demo-reload').on('click', function () {
					uploadInst.upload();
				});
			}
		});


	});
</script>
</body>
</html>
