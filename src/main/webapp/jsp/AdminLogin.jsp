<%--
  Created by IntelliJ IDEA.
  User: 21
  Date: 2019/11/17
  Time: 20:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%
	String css=request.getContextPath()+"/layuiadmin/";
	String jsPath=request.getContextPath()+"/js/";
	String servletPath=request.getContextPath();



%>
<html>
<head>
	<meta charset="utf-8">
	<title>登入 - layuiAdmin</title>
	<%--	<meta name="renderer" content="webkit">--%>
	<%--	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">--%>
	<%--	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">--%>
	<%--	<link rel="stylesheet" href=<%=css+"layui/css/layui.css" %> media="all">--%>
	<%--	<link rel="stylesheet" href=<%=css+"style/admin.css" %> media="all">--%>
	<%--	<link rel="stylesheet" 	href=<%=css+"style/login.css" %> media="all">--%>
	<link rel="stylesheet" href=<%=servletPath+"/layuiadmin/layui/css/layui.css"%> media="all">
	<link rel="stylesheet" href=<%=servletPath+"/layuiadmin/style/admin.css"%> media="all">
	<link rel="stylesheet" href=<%=servletPath+"/layuiadmin/style/login.css"%> media="all">
	<script type="text/javascript" src=<%=jsPath+"login.js" %>></script>
</head>
<body>
<form id="Loginform" action="Login"    method="post">
	<div class="layadmin-user-login layadmin-user-display-show" id="LAY-user-login" style="display: none;">

		<div class="layadmin-user-login-main">
			<div class="layadmin-user-login-box layadmin-user-login-header">
				<h2>后台登录模块</h2>

			</div>
			<div class="layadmin-user-login-box layadmin-user-login-body layui-form">
				<div class="layui-form-item">
					<label class="layadmin-user-login-icon layui-icon layui-icon-username" for="LAY-user-login-username"></label>
					<input type="text" name="workeraccount" id="LAY-user-login-username" lay-verify="required" placeholder="用户名" class="layui-input">
				</div>
				<div class="layui-form-item">
					<label class="layadmin-user-login-icon layui-icon layui-icon-password" for="LAY-user-login-password"></label>
					<input type="password" name="workerpass" id="LAY-user-login-password" lay-verify="required" placeholder="密码" class="layui-input">
				</div>
<%--				<div class="layui-form-item">--%>
<%--					<div class="layui-row">--%>
<%--						<div class="layui-col-xs7">--%>
<%--							<label class="layadmin-user-login-icon layui-icon layui-icon-vercode" for="LAY-user-login-vercode"></label>--%>
<%--							<input type="text" name="vercode" id="LAY-user-login-vercode" lay-verify="required" placeholder="图形验证码" class="layui-input">--%>
<%--						</div>--%>
<%--						<div class="layui-col-xs5">--%>
<%--							<div style="margin-left: 10px;">--%>
<%--								<img src="https://www.oschina.net/action/user/captcha" class="layadmin-user-login-codeimg" id="LAY-user-get-vercode">--%>
<%--							</div>--%>
<%--						</div>--%>
<%--					</div>--%>
<%--				</div>--%>
				<div class="layui-form-item" style="margin-bottom: 20px;">
					<input type="checkbox" name="remember" lay-skin="primary" title="记住密码">
					<a href="forget.html" class="layadmin-user-jump-change layadmin-link" style="margin-top: 7px;">忘记密码？</a>
				</div>
				<div class="layui-form-item">
					<button class="layui-btn layui-btn-fluid" lay-submit lay-filter="LAY-user-login-submit" onclick="login()">登 入</button>
				</div>

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

</form>
</body>
</html>
