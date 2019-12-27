<%--
  Created by IntelliJ IDEA.
  User: 21
  Date: 2019/12/26
  Time: 18:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String layuicsspath = request.getContextPath()+"/layuiadmin/layui/css/";
	String layuistyle = request.getContextPath()+"/layuiadmin/style/";
	String layuipath = request.getContextPath()+"/layuiadmin/layui/";
	String path =application.getContextPath();
	String jsPath=request.getContextPath()+"/js/";
	String cssPath=request.getContextPath()+"/css/";
%>
<html>
<head>
	<title>车主与管理员的通讯</title>

	<link href=<%=cssPath+"socketChart.css"%> rel="stylesheet" type="text/css"/>
	<script type="text/javascript" src=<%=jsPath+"jquery-3.4.1.js" %>></script>
	<script type="text/javascript" src=<%=jsPath+"jquery.js" %>></script>

</head>
<body>
<div id="hz-main">
	<div id="hz-message">
		<!-- 头部 -->
		正在与<span id="toUserName"></span>聊天
		<hr style="margin: 0px;"/>
		<!-- 主体 -->
		<div id="hz-message-body">
		</div>
		<!-- 功能条 -->
		<div id="">
			<button>表情</button>
			<button>图片</button>
			<button id="videoBut" >视频</button>
			<button onclick="send()" style="float: right;">发送</button>
		</div>
		<!-- 输入框 -->
		<div contenteditable="true" id="hz-message-input">

		</div>
	</div>
	<div id="hz-group">
		<input type="hidden" id="username" name="username" value="${sessionScope.name}">
		登录用户：<span id="talks" >${sessionScope.name}</span>
		<br/>
		在线人数:<span id="onlineCount">0</span>
		<!-- 主体 -->
		<div id="hz-group-body">

		</div>
	</div>
</div>
<script type="text/javascript" src=<%=jsPath+"socketChart.js" %>></script>





</body>
</html>
