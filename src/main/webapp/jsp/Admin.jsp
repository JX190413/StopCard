<%--
  Created by IntelliJ IDEA.
  User: 21
  Date: 2019/10/24
  Time: 0:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%

	String jsPath=request.getContextPath()+"/js/";
	String servletPath=request.getContextPath();


%>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title>后台管理</title>


	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" href=<%=servletPath+"/layuiadmin/layui/css/layui.css"%> media="all">
	<script type="text/javascript" src=<%=jsPath+"jquery-3.4.1.js" %>></script>
	<script type="text/javascript" src=<%=jsPath+"AdminT.js" %>></script>




</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
	<div class="layui-header">
		<div class="layui-logo">文挡分享平台管理</div>

		<ul class="layui-nav layui-layout-right">
			<li class="layui-nav-item">
				<a href="javascript:;">
					<img src="//tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg" class="layui-nav-img">
					<c:choose>
						<c:when test="${requestScope.worker1 != null}">
							欢迎你<span id="user-name-label">${requestScope.worker1.workeraccount}</span>
						</c:when>
						<c:otherwise>
							<span><a href="Admin.jsp">登录</a></span>
						</c:otherwise>
					</c:choose>
				</a>
				<dl class="layui-nav-child">
					<dd><a href="">基本资料</a></dd>
					<dd><a href="">安全设置</a></dd>
				</dl>
			</li>
			<li class="layui-nav-item"><a href="">退了</a></li>
		</ul>
	</div>

	<div class="layui-side layui-bg-black">
		<div class="layui-side-scroll">
			<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
			<ul class="layui-nav layui-nav-tree"  lay-filter="test">
				<c:if test="${requestScope.map != null}">
					<c:forEach items="${requestScope.map}" begin="0" step="1" var="x">
						<li class="layui-nav-item ">
							<a class="" href="javascript:;">${x.key}</a>
							<dl class="layui-nav-child">

								<c:forEach items="${x.value}" begin="0" step="1" var="y">

									<dd><a  title="${y.menuurl}"  href="javascript:void(0)"  onclick="changeURL(this)"  target="page-view">${y.chilename}</a></dd>
								</c:forEach>

							</dl>
						</li>
					</c:forEach>
				</c:if>
			</ul>
		</div>
	</div>
	<div style="display:none;">
		<c:choose>
			<c:when test="${requestScope.flage == '1'}">
				out.print("<script type='text/javascript'>alert('登录成功');</script>");
			</c:when>
			<c:otherwise>
				<%--			<span><a href="Admin.jsp">登录</a></span>--%>
			</c:otherwise>
		</c:choose>
	</div>
	<div class="layui-body">
		<!-- 内容主体区域 -->
		<div style="padding: 15px;">
			<iframe  src=""  frameborder="0"  style="width: 100%;" height="100%;" name="page-view" id="myiframe" >

			</iframe>

		</div>
	</div>

	<div class="layui-footer">
		<!-- 底部固定区域 -->
		© layui.com - 底部固定区域
	</div>
</div>
<script src=<%=servletPath+"/layuiadmin/layui/layui.js"%> charset="utf-8"></script>

<script>
	//注意：导航 依赖 element 模块，否则无法进行功能性操作
	layui.use('element', function(){
		var element = layui.elements;

		//…
	});
</script>

</body>
</html>

