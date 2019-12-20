<%--
  Created by IntelliJ IDEA.
  User: 14506
  Date: 2019/12/8
  Time: 10:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String layuicsspath = request.getContextPath()+"/layuiadmin/layui/css/";
	String layuistyle = request.getContextPath()+"/layuiadmin/style/";
	String layuipath = request.getContextPath()+"/layuiadmin/layui/";

%>
<html>
<head>
	<meta charset="utf-8">
	<title>白名单管理</title>
	<link rel="stylesheet" href=<%=layuicsspath+"layui.css"%>>
	<link rel="stylesheet" href=<%=layuistyle+"admin.css"%>>
	<script type="text/javascript" src="<%=layuipath+"layui.all.js"%>"></script>
	<script type="text/javascript" src="<%=layuipath+"layui.js"%>"></script>

</head>
<body>

<div class="demoTable" style="padding-left: 26%;padding-top: 8%;">
	车牌号：
	<div class="layui-inline">
		<input class="layui-input" name="carnum" id="carnum" autocomplete="off">
	</div>
	<button class="layui-btn" data-type="reload">搜索</button>
</div>

<div id="table" style="width: 26%;padding-left: 24%;padding-top: 0.5%;">
	<table id="user" lay-filter="test"></table>
</div>

<script>
	layui.use('table', function(){
		var table = layui.table;
		// 数据表格数据加载
		table.render({
			elem: '#user'
			,url:'WhitelistQuery'
			,id: 'testReload'
			,limit: 5 //每页默认显示的数量
			,page: { //支持传入 laypage 组件的所有参数（某些参数除外，如：jump/elem） - 详见文档
				layout: ['count', 'prev', 'page', 'next', 'skip'] //自定义分页布局
				//,curr: 5 //设定初始在第 5 页
				,groups: 1 //只显示 1 个连续页码
				,first: false //不显示首页
				,last: false //不显示尾页
			}
			,cols: [[
				{field:'whiteid', width:150, title: '白名单ID'}
				,{field:'carnum', width:182, title: '车牌号'}
			]]

		});
		// 搜索重载
		var $ = layui.$, active = {
			reload: function(){
				var carnum = $('#carnum').val();
				//执行重载
				table.reload('testReload', {
					page: {
						curr: 1 //重新从第 1 页开始
					}
					,where: {
						// key: {
						carnum:carnum
						// }
					}
				}, 'data');
			}
		};

		$('.demoTable .layui-btn').on('click', function(){
			var type = $(this).data('type');
			active[type] ? active[type].call(this) : '';
		});
	});
</script>

</body>
</html>