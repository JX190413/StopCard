<%--
  Created by IntelliJ IDEA.
  User: 21
  Date: 2019/10/24
  Time: 0:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page isELIgnored="false" %>
<%

	String jsPath = request.getContextPath() + "/js/";
	String servletPath = request.getContextPath();
	String cssPath = request.getContextPath() + "/css/";


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
	<script type="text/javascript" src=<%=jsPath + "jquery-3.4.1.js" %>></script>
	<script type="text/javascript" src=<%=jsPath + "AdminT.js" %>></script>
	<link rel="stylesheet" href=<%=cssPath+"style9.css" %>>


</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
	<div class="layui-header">
		<div class="layui-logo">${map2.get('webname')}</div>


		<div class="consult_contact">
			<div class="consult_wrap"><a href="jsp/text1.jsp" rel="nofollow" target="_blank">
				<div class="tip">Hello,欢迎来咨询~</div>
				<img src="img/ball.png" class="ball" alt="">
				<img src="img/bg_0.png" class="staff_img" alt="">
				<img src="img/bg_1.png" class="bg-1" alt="">
				<img src="img/bg_2.png" class="bg-2" alt="">
				<img src="img/bg_3.png" class="bg-3" alt=""></a></div>
		</div>
		<ul class="layui-nav layui-layout-right">
			<li class="layui-nav-item">
				<a href="javascript:;">
					<img src="//tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg"
					     class="layui-nav-img">
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

	<!-- 侧边菜单 -->
	<div class="layui-side layui-bg-black">
		<div id="navBarId" class="layui-side-scroll"></div>
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
	<div >
		<iframe src="jsp/Default.jsp" frameborder="0"  style="width: 100%;" height="100%;" name="page-view" id="myiframe">

		</iframe>

	</div>
</div>

<div class="layui-footer">
	<!-- 底部固定区域 -->
	${map2.get('mail')}
</div>
</div>
<script src=<%=servletPath+"/layuiadmin/layui/layui.js"%> charset="utf-8"></script>

<script>

	//注意：导航 依赖 element 模块，否则无法进行功能性操作
	layui.use('element', function () {
		var element = layui.elements;

		//…
	});


	$.get("selectTreeParent", function (data) {
		console.log(JSON.stringify(data));
		console.log(data);
		var jsonDataTree = data;
		var aaa=initMenuHtml(data);
		console.log(aaa);
		$("#navBarId").html(aaa);
		layui.element.render();
	}, "json");



	// 导航菜单的间隔像素
	var menuCell = 15;
	function initMenuHtml(listData) {
		var data = listData;
		var liStr = "";
		// 遍历生成主菜单
		for (var i = 0; i < data.length; i++) {
			// 判断是否存在子菜单
			if (data[i].children != null && data[i].children.length > 0) {
				liStr += "<li class='layui-nav-item'><a class=\"\" href=\"javascript:;\">" + data[i].title + "</a>" +
					"<dl class=\"layui-nav-child\">";
				// 遍历获取子菜单
				for (var k = 0; k < data[i].children.length; k++) {
					liStr += getChildMenu(data[i].children[k], 0);
				}
				liStr += "</dl></li>";
			} else {
				liStr += "<li class=\"layui-nav-item\"><a class=\"\" href="+data[i].url+" onclick=\"changeURL(this)\"  target=\"page-view\">" + data[i].title + "</a></li>";
			}
		}
		console.log("-------------------");
		console.log(liStr);
		return "<ul class='layui-nav layui-nav-tree'  lay-filter='test'>" + liStr + "</ul>";
	}


	// 递归生成子菜单
	function getChildMenu(subMenu,num) {
		num++;
		var subStr = "";
		if (subMenu.children != null && subMenu.children.length > 0) {
			subStr += "<dd><a style=\"margin-Left:"+num*menuCell+"px\" class=\"\"  href=\"javascript:;\">" + subMenu.title + "</a>" + "<dl class=\"layui-nav-child\">";
			for (var j = 0; j < subMenu.children.length; j++) {
				subStr +=getChildMenu(subMenu.children[j],num);
			}
			subStr += "</dl></dd>";
		} else {
			subStr += "<dd><a style=\"margin-Left:"+num*menuCell+"px\" class=\"\" href=\""+subMenu.url+"\" onclick=\"changeURL(this)\"  target=\"page-view\">" + subMenu.title + "</a></dd>";
		}
		return subStr;
	}
</script>

</body>
</html>

