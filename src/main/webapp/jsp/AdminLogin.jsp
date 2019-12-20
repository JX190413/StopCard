
<%--
  Created by IntelliJ IDEA.
  User: 21
  Date: 2019/12/18
  Time: 18:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%
	String path = request.getContextPath();
	String jsPath=request.getContextPath()+"/js/";
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width-device-width,initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="sie-edge" />
	<link rel="stylesheet" type="text/css" href=<%=path+"/css/style.css"%> />
	<%--	<script type="text/javascript" src=<%=jsPath+"login.js" %>></script>--%>
	<script type="text/javascript" src=<%=jsPath+"jquery-1.4.4.min.js" %>></script>
	<link rel="stylesheet" type="text/css" href=<%=path+"/css/style1.css"%> />
	<title>Title</title>
	<style>
		body {
			height: 100%;
			background: #213838;
			overflow: hidden;
		}

		canvas {
			z-index: -1;
			position: absolute;
		}
	</style>
	<script src=<%=jsPath+"jquery.js" %>></script>
	<script src=<%=jsPath+"verificationNumbers.js" %>></script>
	<script src=<%=jsPath+"Particleground.js" %>></script>
	<script>
		$(document).ready(function() {
			//粒子背景特效
			$('body').particleground({
				dotColor: '#5cbdaa',
				lineColor: '#5cbdaa'
			});
			//验证码
			createCode();
			//测试提交，对接程序删除即可
			$(".submit_btn").click(function(){
				location.href="index.html";
			});
		});
	</script>


	<style type="text/css">
		* {
			margin: 0;
			padding: 0;
		}

		body {
			height: 100vh;
			background-position: center;
			overflow: hidden;
		}

		h1 {
			color: #fff;
			text-align: center;
			font-weight: 100;
			margin-top: 40px;
		}

		#media {
			width: 294px;
			height: 282px;
			margin: 5px auto 0;
			border-radius: 168px;
			overflow: hidden;
			opacity: 50.7;
		}

		#video {
			width: 294px;
			height: 226px;
			margin-top: 3px;
			border-radius: 60%;
		}

		#canvas {
			display: none;
		}

		#btn {
			width: 160px;
			height: 50px;
			background: #03a9f4;
			margin: 70px auto 0;
			text-align: center;
			line-height: 50px;
			color: #fff;
			border-radius: 40px;
		}
	</style>
</head>
<body>

<div class="container" id="container">
	<div class="form-container sign-up-container">
		<form id="login" action="Login">
			<h1>人脸识别登录</h1>
			<div class="social-container"> <a href="#" class="social">
				<ion-icon name="logo-facebook"></ion-icon>
			</a> <a href="#" class="social">
				<ion-icon name="logo-googleplus"></ion-icon>
			</a> <a href="#" class="social">
				<ion-icon name="logo-linkedin"></ion-icon>
			</a> </div>
			<div id="media">
				<video id="video" width="530" height="300" autoplay></video>
				<canvas id="canvas" width="400" height="300"></canvas>
			</div>
			<dd>
				<input type="button" onclick="query()" value="立即登录"
				       class="submit_btn" />
			</dd>

			<%--			<button  onclick="query()">登录</button>--%>
		</form>
	</div>
	<div class="form-container sign-in-container">
		<form action="Login"    method="post">
			<h1>后台登录</h1>
			<div class="social-container"> <a href="#" class="social">
				<ion-icon name="logo-facebook"></ion-icon>
			</a> <a href="#" class="social">
				<ion-icon name="logo-googleplus"></ion-icon>
			</a> <a href="#" class="social">
				<ion-icon name="logo-linkedin"></ion-icon>
			</a> </div>
			<%--			<span>或用邮箱登录</span>--%>
			<input type="text" id="workeraccount" name="workeraccount" placeholder="账号">
			<input type="password" id="workerpass" name="workerpass" placeholder="密码">
			<button  >登录</button>
		</form>
	</div>
	<div class="overlay-container">
		<div class="overlay">
			<div class="overlay-panel overlay-left">
				<h1>账号密码</h1>
				<br>
				<button class="ghost" id="signIn">登录</button>
			</div>
			<div class="overlay-panel overlay-right">
				<h1>人脸识别</h1>
				<br>
				<button class="ghost" id="signUp" >人脸识别</button>
			</div>
		</div>
	</div>
	<div style="display:none;">
		<c:choose>
			<c:when test="${requestScope.flage == '3'}">
				out.print("<script type='text/javascript'>alert('账号已经被封了');</script>");
			</c:when>
			<c:otherwise>
				<%--			<span><a href="Admin.jsp">登录</a></span>--%>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${requestScope.flage == '2'}">
				out.print("<script type='text/javascript'>alert('登录失败,账号或密码出错！');</script>");
			</c:when>
			<c:otherwise>
				<%--			<span><a href="Admin.jsp">登录</a></span>--%>
			</c:otherwise>
		</c:choose>

	</div>
</div>
<script type="text/javascript" src=<%=jsPath+"script.js" %>></script>
<script type="text/javascript" src=<%=jsPath+"jquery-3.1.1.min.js" %>></script>
<script type="text/javascript">
	//var 是定义变量
	var video = document.getElementById("video"); //获取video标签
	var context = canvas.getContext("2d");
	var con  ={
		audio:false,
		video:{
			width:1980,
			height:1024,
		}
	};

	//导航 获取用户媒体对象
	navigator.mediaDevices.getUserMedia(con)
		.then(function(stream){
			video.srcObject = stream;
			video.onloadmetadate = function(e){
				video.play();
			}
		});


	function query(){

		//把流媒体数据画到convas画布上去
		context.drawImage(video,0,0,400,300);
		var base = getBase64();


		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath}/facelogin.action",
			data:{"base":base},
			success:function(data){
				var result = eval(data);

				if(result===true){
					alert("登录成功");
					$("#login").submit();
					window.location.href = "jsp/Admin.jsp"
				} else {
					alert("登录失败");
				}
				;
			}
		});

	}
	function getBase64() {
		var imgSrc = document.getElementById("canvas").toDataURL(
			"image/png");
		alert(imgSrc);
		return imgSrc.split("base64,")[1];

	};
</script>

</body>
</html>





<%--&lt;%&ndash;--%>
<%--  Created by IntelliJ IDEA.--%>
<%--  User: 21--%>
<%--  Date: 2019/11/17--%>
<%--  Time: 20:42--%>
<%--  To change this template use File | Settings | File Templates.--%>
<%--&ndash;%&gt;--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<%@ page isELIgnored="false" %>--%>
<%--<%--%>
<%--	String css=request.getContextPath()+"/layuiadmin/";--%>
<%--	String jsPath=request.getContextPath()+"/js/";--%>
<%--	String servletPath=request.getContextPath();--%>



<%--%>--%>
<%--<html>--%>
<%--<head>--%>
<%--	<meta charset="utf-8">--%>
<%--	<title>登入 - layuiAdmin</title>--%>
<%--	&lt;%&ndash;	<meta name="renderer" content="webkit">&ndash;%&gt;--%>
<%--	&lt;%&ndash;	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">&ndash;%&gt;--%>
<%--	&lt;%&ndash;	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">&ndash;%&gt;--%>
<%--	&lt;%&ndash;	<link rel="stylesheet" href=<%=css+"layui/css/layui.css" %> media="all">&ndash;%&gt;--%>
<%--	&lt;%&ndash;	<link rel="stylesheet" href=<%=css+"style/admin.css" %> media="all">&ndash;%&gt;--%>
<%--	&lt;%&ndash;	<link rel="stylesheet" 	href=<%=css+"style/login.css" %> media="all">&ndash;%&gt;--%>
<%--	<link rel="stylesheet" href=<%=servletPath+"/layuiadmin/layui/css/layui.css"%> media="all">--%>
<%--	<link rel="stylesheet" href=<%=servletPath+"/layuiadmin/style/admin.css"%> media="all">--%>
<%--	<link rel="stylesheet" href=<%=servletPath+"/layuiadmin/style/login.css"%> media="all">--%>
<%--	<script type="text/javascript" src=<%=jsPath+"login.js" %>></script>--%>
<%--</head>--%>
<%--<body>--%>
<%--<form id="Loginform" action="Login"    method="post">--%>
<%--	<div class="layadmin-user-login layadmin-user-display-show" id="LAY-user-login" style="display: none;">--%>

<%--		<div class="layadmin-user-login-main">--%>
<%--			<div class="layadmin-user-login-box layadmin-user-login-header">--%>
<%--				<h2>后台登录模块</h2>--%>

<%--			</div>--%>
<%--			<div class="layadmin-user-login-box layadmin-user-login-body layui-form">--%>
<%--				<div class="layui-form-item">--%>
<%--					<label class="layadmin-user-login-icon layui-icon layui-icon-username" for="LAY-user-login-username"></label>--%>
<%--					<input type="text" name="workeraccount" id="LAY-user-login-username" lay-verify="required" placeholder="用户名" class="layui-input">--%>
<%--				</div>--%>
<%--				<div class="layui-form-item">--%>
<%--					<label class="layadmin-user-login-icon layui-icon layui-icon-password" for="LAY-user-login-password"></label>--%>
<%--					<input type="password" name="workerpass" id="LAY-user-login-password" lay-verify="required" placeholder="密码" class="layui-input">--%>
<%--				</div>--%>
<%--&lt;%&ndash;				<div class="layui-form-item">&ndash;%&gt;--%>
<%--&lt;%&ndash;					<div class="layui-row">&ndash;%&gt;--%>
<%--&lt;%&ndash;						<div class="layui-col-xs7">&ndash;%&gt;--%>
<%--&lt;%&ndash;							<label class="layadmin-user-login-icon layui-icon layui-icon-vercode" for="LAY-user-login-vercode"></label>&ndash;%&gt;--%>
<%--&lt;%&ndash;							<input type="text" name="vercode" id="LAY-user-login-vercode" lay-verify="required" placeholder="图形验证码" class="layui-input">&ndash;%&gt;--%>
<%--&lt;%&ndash;						</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;						<div class="layui-col-xs5">&ndash;%&gt;--%>
<%--&lt;%&ndash;							<div style="margin-left: 10px;">&ndash;%&gt;--%>
<%--&lt;%&ndash;								<img src="https://www.oschina.net/action/user/captcha" class="layadmin-user-login-codeimg" id="LAY-user-get-vercode">&ndash;%&gt;--%>
<%--&lt;%&ndash;							</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;						</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;					</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;				</div>&ndash;%&gt;--%>
<%--				<div class="layui-form-item" style="margin-bottom: 20px;">--%>
<%--					<input type="checkbox" name="remember" lay-skin="primary" title="记住密码">--%>
<%--					<a href="forget.html" class="layadmin-user-jump-change layadmin-link" style="margin-top: 7px;">忘记密码？</a>--%>
<%--				</div>--%>
<%--				<div class="layui-form-item">--%>
<%--					<button class="layui-btn layui-btn-fluid" lay-submit lay-filter="LAY-user-login-submit" onclick="login()">登 入</button>--%>
<%--				</div>--%>

<%--			</div>--%>
<%--		</div>--%>




<%--	</div>--%>
<%--	<div style="display:none;">--%>
<%--		<c:choose>--%>
<%--			<c:when test="${requestScope.flage == '3'}">--%>
<%--				out.print("<script type='text/javascript'>alert('账号已经被封了');</script>");--%>
<%--			</c:when>--%>
<%--			<c:otherwise>--%>
<%--				&lt;%&ndash;			<span><a href="Admin.jsp">登录</a></span>&ndash;%&gt;--%>
<%--			</c:otherwise>--%>
<%--		</c:choose>--%>
<%--		<c:choose>--%>
<%--			<c:when test="${requestScope.flage == '2'}">--%>
<%--				out.print("<script type='text/javascript'>alert('登录失败,账号或密码出错！');</script>");--%>
<%--			</c:when>--%>
<%--			<c:otherwise>--%>
<%--				&lt;%&ndash;			<span><a href="Admin.jsp">登录</a></span>&ndash;%&gt;--%>
<%--			</c:otherwise>--%>
<%--		</c:choose>--%>

<%--	</div>--%>

<%--</form>--%>
<%--</body>--%>
<%--</html>--%>
