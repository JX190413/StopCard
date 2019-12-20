<%--
  Created by IntelliJ IDEA.
  User: 14506
  Date: 2019/12/20
  Time: 9:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String path=application.getContextPath();
%>
<html>
<head>
	<title>Title</title>
	<link rel="stylesheet" href="../layuiadmin/layui/css/layui.css" media="all">
	<script src="../layuiadmin/layui/layui.js"></script>
	<script src="../js/jquery-3.4.1.js"></script>
</head>

<style>
	html, body {
		height: 100%;
	}

	body {
		/*background: #0f3854;*/
		/*!*background: -webkit-radial-gradient(center ellipse, #0a2e38 0%, #000000 70%);*!*/
		/*background: radial-gradient(ellipse at center, #0a2e38 0%, #000000 70%);*/
		/*background-size: 100%;*/
		background-image: url("../images/onepgscr-3.jpg");
	}

	p {
		margin: 0;
		padding: 0;
	}

	#clock {
		font-family: 'Share Tech Mono', monospace;
		color: #ffffff;
		text-align: center;
		position: absolute;
		text-align: center;
		margin-top: -50px;
		left: 70%;
		top: 50%;
		-webkit-transform: translate(-50%, -50%);
		transform: translate(-50%, -50%);
		color: #daf6ff;
		text-shadow: 0 0 20px #0aafe6, 0 0 20px rgba(10, 175, 230, 0);
	}

	#clock .time {
		letter-spacing: 0.05em;
		font-size: 80px;
		padding: 5px 0;
	}
	#clock .date {
		letter-spacing: 0.1em;
		font-size: 24px;
	}
	#clock .test {
		letter-spacing: 0.1em;
		font-size: 40px;
	}
	#clock .port {
		letter-spacing: 0.1em;
		font-size: 40px;
		color: #11ff2d;
		text-shadow: 0 0 20px #1078e6, 0 0 20px rgba(10, 175, 230, 0);
	}

	#clock .car {
		background-color: #1E9FFF;
	}
</style>

</head>
<body>

<script type="text/javascript" src="../js/vue.min.js"></script>

<div class="layui-fluid">
	<br><br>
	<div class="layui-upload">
		<button type="button" class="layui-btn" id="test1">上传图片</button>

		<a class="layui-btn" id="parking"  onclick="ulrHtml(this)"> 车库停车</a>
		<div class="layui-upload-list">
			<img class="layui-upload-img" id="demo1">
			<p id="demoText"></p>
		</div>
	</div>
</div>
<div id="clock">

	<p class="date">{{ date }}</p>
	<p class="time">{{ time }}</p>
	<br><br><br><br><br><br><br><br><br><br><br><br>
	<p class="test">空闲车位：<span class="port" id="port"></span></p>
	<br><br><br><br><br><br><br><br><br><br><br><br>
	<p class="test">车牌号：<span  class="car" id="car"></span></p>

</div>




<script>
	function ulrHtml(node) {
		var toUrl = "CarIn1.jsp?car=" + $("#car").html();
		window.open(toUrl);
	}
	//每5秒从数据库获取车位情况
	$(function () {
		$("#parking").hide();
		freePort();
		setInterval("freePort()",5000);
	});
	function freePort(){
		$.post("<%=path+"/searchFreeCarPort"%>",function (data) {
			$("#port").html(data+"个")
		})
	}

	var clock = new Vue({
		el: '#clock',
		data: {
			time: '',
			date: ''
		}
	});

	var week = ['星期天', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六'];
	var timerID = setInterval(updateTime, 1000);
	updateTime();
	function updateTime() {
		var cd = new Date();
		clock.time = zeroPadding(cd.getHours(), 2) + ':' + zeroPadding(cd.getMinutes(), 2) + ':' + zeroPadding(cd.getSeconds(), 2);
		clock.date = zeroPadding(cd.getFullYear(), 4) + '-' + zeroPadding(cd.getMonth()+1, 2) + '-' + zeroPadding(cd.getDate(), 2) + ' ' + week[cd.getDay()];
	}

	function zeroPadding(num, digit) {
		var zero = '';
		for(var i = 0; i < digit; i++) {
			zero += '0';
		}
		return (zero + num).slice(-digit);
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
					$("#car").html(res.msg);
					$("#parking").show()
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