<%--
  Created by IntelliJ IDEA.
  User: 14506
  Date: 2019/12/8
  Time: 10:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
	<title>角色管理</title>
	<link rel="stylesheet" href="../layuiadmin/layui/css/layui.css" media="all">
	<link rel="stylesheet" href="../layuiadmin/style/admin.css" media="all">
	<script src="../js/jquery-3.4.1.js"></script>
	<script src="../layui/layui.js"></script>
	<style>
		#prevModal {width:100%; height:100%; text-align:center; display:none;}
		#img_prev {max-width:98%; max-height:98%; margin: 10px auto}
	</style>
</head>
<body>
<div class="layui-fluid">
	<div class="layui-card">
		<div class="layui-form layui-card-header layuiadmin-card-header-auto">
			<div class="layui-form-item">
				<div class="layui-inline">
					广告位
				</div>
				<div class="layui-inline">
					<select id="rolename" name="rolename" lay-search lay-filter="LAY-user-adminrole-type">
						<option ></option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
					</select>
				</div>
			</div>
		</div>
		<div class="layui-card-body">
<%--			<div style="padding-bottom: 10px;">--%>
<%--				<button class="layui-btn layuiadmin-btn-role" data-type="add">添加</button>--%>
<%--			</div>--%>

			<table id="demo" lay-filter="demo"></table>

		</div>
		<div id='prevModal'>
			<img id='img_prev' class="layui-circle" width="535" height="535"/>
		</div>
	</div>
</div>

<script type="text/html" id="barDemo">
	<a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit"><i class="layui-icon layui-icon-edit"></i>编辑</a>
</script>
<script type="text/html" id="adimg">
<%--	<div><img src="${pageContext.request.contextPath}{{d.roleid}}"></div>--%>
<%--	<div><img src="../img/thumbs/kb_0{{d.adid}}.jpg"></div>--%>
	<div><img src="../{{d.adimg}}"></div>
</script>
<script>



	function hoverOpenImg(){//鼠标悬浮显示头像大图
		var img_show = null; // tips提示
		$('td img').hover(function(){
			var img = "<img class='img_msg' src='"+$(this).attr('src')+"' style='width:100%;' />";
			img_show = layer.tips(img, this,{
				tips:[2, 'rgba(41,41,41,.0)']
				,area: ['25%']
			});
		},function(){
			layer.close(img_show);
		});
		$('td img').attr('style','max-width:70px');
	}

	layui.config({
		base: '../layuiadmin/' //静态资源所在路径
	}).extend({
		index: 'lib/index' //主入口模块
	}).use(['index', 'useradmin', 'table'], function () {
		var $ = layui.$
			, form = layui.form
			, table = layui.table;


		// selectRender(form);

		//搜索角色
		form.on('select(LAY-user-adminrole-type)', function (data) {
			//执行重载
			console.log(data.value);
			table.reload('testReload', {
				where: {
					adid: data.value
				}
			});
		});

		//表格加载
		table.render({
			elem: '#demo'
			, url: '/StopCard/queryAd' //数据接口
			, page: true //开启分页
			, limit: 10
			, limits: [5, 10, 20, 30, 40]
			, id: 'testReload'
			, cols: [[ //表头
				{field: 'adid', title: '广告位', align: 'center'}
				, {field: 'adname', title: '广告名称', align: 'center'}
				, {field: 'admsg', title: '广告标语', align: 'center'}
				, {field: 'adimg', title: '广告标语', align: 'center',hide:true}
				, {field: 'image', title: '图片', align: 'center',templet:'#adimg',height: 315}
				, {field: 'adurl', title: '广告连接', align: 'center'}
				, {fixed: 'right', title: '操作', toolbar: '#barDemo', align: 'center'}
			]]
			,done:function () {
				hoverOpenImg()//显示大图
			}

		});

		//监听行工具事件查看、删除、新增
		table.on('tool(demo)', function (obj) {//注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
			var data = obj.data;//获得当前行数据

			if (obj.event === 'del') {
				layer.confirm('真的删除'+data.rolename+'么?', function (index) {
					// $.ajax({
					// 	url: "/StopCard/deleteRole",
					// 	data: "roleid=" + data.roleid,
					// 	type: "Post",
					// 	dataType: "json",
					// 	success: function (data) {
					// 		console.log(data);
					// 		if (eval(data)===1) {
					// 			table.reload('testReload');
					// 			return layer.msg("删除成功！");
					//
					// 		}else {
					// 			return layer.msg("删除失败！");
					// 		}
					// 	},
					// 	error: function (data) {
					// 		layer.msg("连接异常！");
					// 	}
					// });
					layer.close(index);
				});
			}
			//编辑角色事件
			else if (obj.event === 'edit') {
				layer.open({
					type: 2
					, title: '编辑广告'
					, content: 'AD2.jsp'
					, area: ['800px', '550px']
					, btn: ['确定', '取消']
					,success:function (layero,index) {
						var body = layer.getChildFrame('body', index);
						// 取到弹出层里的元素，并把编辑的内容放进去
						body.find("#admsg").val(data.admsg);  //设置子窗口指定元素的值
						body.find("#adname").val(data.adname);
						body.find("#adurl").val(data.adurl);
						body.find("#adid").val(data.adid);
						body.find("#adimg").val(data.adimg);
						// 记得重新渲染表单
						form.render();
					}
					, yes: function (index, layero) {
						var iframeWindow = window['layui-layer-iframe' + index]
							, submit = layero.find('iframe').contents().find("#LAY-user-role-submit");
						//监听提交
						iframeWindow.layui.form.on('submit(LAY-user-role-submit)', function (data1) {
							var field = data1.field; //获取提交的字段
							console.log(field);
							var str="adid=" + data.adid+"&adname="+field.adname+"&admsg="+field.admsg+"&adurl="+field.adurl+"&isChange=true";
							//提交 Ajax 成功后，静态更新表格中的数据
							$.ajax({
								type: "POST",//提交的方式基本上用post
								url: "/StopCard/updateAd",//提交的地址
								data: str,//提交的数据
								dataType: "Text",//希望返回的数据类型
								async: true,//异步操作
								success: function (msg) {//成功的方法  msg为返回数据
									layer.msg("修改成功!");
									// $("#role").remove();
									// selectRender(form);
									table.reload('testReload');
									layer.close(index); //关闭弹层
								},
								error: function () {//错误的方法
									alert("服务器正忙!")
								}
							});
						});
						submit.trigger('click');
					}
				});
			}
		});

		// //事件
		// var active = {
		// 	add: function () {
		// 		layer.open({
		// 			type: 2
		// 			, title: '添加新角色'
		// 			, content: 'RoleAdd.jsp'
		// 			, area: ['500px', '480px']
		// 			, btn: ['确定', '取消']
		// 			, yes: function (index, layero) {
		// 				var iframeWindow = window['layui-layer-iframe' + index]
		// 					, submit = layero.find('iframe').contents().find("#LAY-user-role-submit");
		//
		// 				//监听提交
		// 				iframeWindow.layui.form.on('submit(LAY-user-role-submit)', function (data) {
		// 					var field = data.field; //获取提交的字段
		// 					//提交 Ajax 成功后，静态更新表格中的数据
		// 					$.ajax({
		// 						type: "POST",//提交的方式基本上用post
		// 						url: "/StopCard/addRole",//提交的地址
		// 						data: "field=" + JSON.stringify(field),//提交的数据
		// 						dataType: "Text",//希望返回的数据类型
		// 						async: true,//异步操作
		// 						success: function (msg) {//成功的方法  msg为返回数据
		// 							layer.msg(msg);
		// 							$("#rolename").remove();
		// 							selectRender(form);
		// 							table.reload('testReload');
		// 							layer.close(index); //关闭弹层
		// 						},
		// 						error: function () {//错误的方法
		// 							alert("服务器正忙!")
		// 						}
		// 					});
		// 				});
		// 				submit.trigger('click');
		// 			}
		// 		});
		// 	}
		// };

		$('.layui-btn.layuiadmin-btn-role').on('click', function () {
			var type = $(this).data('type');
			active[type] ? active[type].call(this) : '';
		});
	});
</script>
</body>
</html>
