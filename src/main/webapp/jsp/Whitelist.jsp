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
<div class="layui-fluid">
	<div class="layui-card">
		<div class="layui-form layui-card-header layuiadmin-card-header-auto">
			<div class="layui-form-item">
				<div class="demoTable" >
					车牌号：
					<div class="layui-inline">
						<input class="layui-input" name="carnum" id="carnum" autocomplete="off">
					</div>
					<button class="layui-btn" data-type="reload">搜索</button>
					<button class="layui-btn" data-type="add">白名单车牌号添加</button>
				</div>
			</div>
		</div>
		<div class="layui-card-body">
			<table id="user" lay-filter="test"></table>
		</div>
	</div>
</div>

<script type="text/html" id="barDemo">
	<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
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
				{field:'whiteid',  title: '白名单ID',align: 'center'}
				,{field:'carnum',  title: '车牌号',align: 'center'}
				,{fixed: 'right', title:'操作', toolbar: '#barDemo',align: 'center'}
			]]

		});

		// 白名单新增车牌
		var $ = layui.$, active = {
			// 搜索重载
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
			},
			add: function(){
				layer.prompt({
					formType: 3,
					title:"请输入白名单新增车牌",
					yes: function(index, layero){
						// 获取文本框输入的值
						var value = layero.find(".layui-layer-input").val();
						if (value) {
							$.post(
								'add',
								{
									carnum:value
								},
								function(res){
									layer.msg(res.msg,function(index){
										layer.closeAll(index); //关闭当前窗口
										location.reload();
									});
								}
							);
							// alert("输入值为：" + value);
							// layer.close(index);
						} else {
							alert("输入值不能为空");
						}
					}
				})
			}

		};

		//监听行工具事件
		table.on('tool(test)', function(obj){

			var data = obj.data;
			if(obj.event === 'del'){
				layer.confirm('确认删除？', function(index){
					obj.del();
					$.post(
						'delete',
						{
							carnum:data.carnum
						},
						function(res){
							layer.msg(res.msg,function(index){
								layer.closeAll(index); //关闭当前窗口
								location.reload();
							});
						}
					);
					layer.close(index);
				});
			}
		});

		$('.demoTable .layui-btn').on('click', function(){
			var type = $(this).data('type');
			active[type] ? active[type].call(this) : '';
		});
	});
</script>

</body>
</html>
