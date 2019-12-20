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
	<title>用户管理</title>
	<link rel="stylesheet" href=<%=layuicsspath+"layui.css"%>>
	<link rel="stylesheet" href=<%=layuistyle+"admin.css"%>>
	<script type="text/javascript" src="<%=layuipath+"layui.all.js"%>"></script>
	<script type="text/javascript" src="<%=layuipath+"layui.js"%>"></script>

</head>
<body>

<div class="layui-fluid">
	<div class="layui-card">
		<div class="layui-form layui-card-header layuiadmin-card-header-auto">
			<div class="layui-form-item">
				<div class="demoTable" style="padding-left: 15%;padding-top: 8%;">
					用户名：
					<div class="layui-inline">
						<input class="layui-input" name="username" id="username" autocomplete="off">
					</div>
					注册时间：
					<div class="layui-inline">
						<input type="date" class="layui-input" name="usertime" id="beginTime" autocomplete="off">
					</div>
					至
					<div class="layui-inline">
						<input type="date" class="layui-input" name="usertime" id="endTime" autocomplete="off">
					</div>

					车牌号：
					<div class="layui-inline">
						<input class="layui-input" name="carnum" id="carnum" autocomplete="off">
					</div>
					<button class="layui-btn" data-type="reload">搜索</button>
				</div>
			</div>
		</div>
		<div class="layui-card-body">
			<table id="user" lay-filter="test"></table>
		</div>
	</div>
</div>



<%--<table class="layui-hide" id="user" style="width: 49%"></table>--%>


<script>
	layui.use('table', function(){
		var table = layui.table;
		// 数据表格数据加载
		table.render({
			elem: '#user'
			,url:'userQuery'
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
				{field:'username', title: '用户名',align: 'center'}
				,{field:'userpass', title: '密码',align: 'center'}
				,{field:'userphone', title: '手机号',align: 'center'}
				,{field:'useraddress', title: '地址',align: 'center'}
				,{field:'carnum', title: '车牌号',align: 'center'}
				,{field:'usertime', title: '注册时间',align: 'center'}
			]]

		});
		// 搜索重载
		var $ = layui.$, active = {
			reload: function(){
				var username = $('#username').val();
				var beginTime = $('#beginTime').val();
				var endTime = $('#endTime').val();
				var carnum = $('#carnum').val();
				//执行重载
				table.reload('testReload', {
					page: {
						curr: 1 //重新从第 1 页开始
					}
					,where: {
						// key: {
						username: username,
						beginTime:beginTime,
						endTime:endTime,
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
