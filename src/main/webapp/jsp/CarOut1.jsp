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
	<link rel="stylesheet" href="<%=path+"/layuiadmin/layui/css/layui.css"%>" media="all">
	<script src="<%=path+"/layuiadmin/layui/layui.js"%>"></script>
	<script src="<%=path+"/js/jquery-3.4.1.js"%>"></script>
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
		background-image: url("<%=path+"/images/onepgscr-3.jpg"%>");
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

<script type="text/javascript" src="<%=path+"/js/vue.min.js"%>"></script>

<div style="padding-right: 50px;position: absolute;margin-left: 20;">
	<br><br>
</div>
<div style="left: 95%;padding-left: 10px;position: absolute;">
	<br><br>
	<a type="button" class="layui-btn" href="jsp/Reception.jsp">返回</a>
</div>
<div id="clock">
	<p class="date">{{ date }}</p>
	<p class="time">{{ time }}</p>
	<br><br><br><br><br><br><br><br><br><br>
	<p class="test"><span class="port" id="time">一路顺风！</span></p>
	<br><br><br><br><br><br>
	<p class="test">应缴费用：<span class="port" id="money">缴费成功！</span></p>
	<br><br><br><br><br><br>
	<p class="test">车牌号：<span  class="car" id="car">${carNum}</span></p>
	<br><br><br><br><br><br>
</div>

<form method="post" id="myform" action="<%=path+"/alipay.action"%>">
	<input hidden id="carnum1" name="carnum">
	<input hidden id="money1"  name="money">
	<input hidden id="inoutid1"  name="inoutid">
</form>


<script>



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

</script>
</body>
</html>