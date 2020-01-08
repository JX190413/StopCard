<%--
  Created by IntelliJ IDEA.
  User: 14506
  Date: 2019/11/19
  Time: 10:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

	String jsPath = application.getContextPath() + "/js/";
	String path = application.getContextPath();
	String layui = application.getContextPath() + "/layuiadmin/";
%>
<html>
<head>
	<title>Title</title>
	<link rel="stylesheet" href="<%=layui+"layui/css/layui.css"%>" media="all">
	<link rel="stylesheet" href="<%=layui+"style/admin.css"%>" media="all">
	<script src=<%=jsPath + "jquery-3.4.1.js"%>></script>
	<script src=<%=layui + "layui/layui.js"%>></script>
</head>
<body>
<div class="layui-fluid">
	<div class="layui-card">
		<div class="layui-form layui-card-header layuiadmin-card-header-auto">
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">菜单名称</label>
					<div class="layui-input-block">
						<input type="text" name="menuname" id="menuname" placeholder="请输入菜单名称" class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<button class="layui-btn layuiadmin-btn-useradmin"  id="clear">
						清除
					</button>
				</div>
				<div class="layui-inline">
					<button class="layui-btn layuiadmin-btn-useradmin" id="search" lay-submit
					        lay-filter="LAY-user-front-search">
						<i class="layui-icon layui-icon-search layuiadmin-button-btn"></i>
					</button>
				</div>
			</div>
		</div>

		<div class="layui-card-body">
			<div style="padding-bottom: 10px;">
				<button class="layui-btn layuiadmin-btn-menu" data-type="add">添加菜单</button>
			</div>
			<table id="demo" lay-filter="test"></table>
		</div>
	</div>
</div>
<script>

	layui.use('laydate', function () {
		var laydate = layui.laydate;

		//常规用法
		laydate.render({
			elem: '#date1'
		});
		laydate.render({
			elem: '#date2'
		});
	})
</script>

<script type="text/html" id="barDemo">
	<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
	<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<script>

		//清除搜索条件
		$("#clear").click(function () {
			$("#menuname").val("");
		});


	layui.use('table', function () {
		var table = layui.table
			, form = layui.form;


		//第一个实例
		table.render({
			elem: '#demo'
			, url: '/StopCard/queryMenu' //数据接口
			, page: true //开启分页
			, limit: 10
			, limits: [5, 10, 20, 30, 40]
			, id: 'testReload'
			, defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
				title: '提示'
				, layEvent: 'LAYTABLE_TIPS'
				, icon: 'layui-icon-tips'
			}]
			, cols: [[ //表头
				 {field: 'menuid', title: '编号', align: 'center'}
				, {field: 'menuname', title: '菜单名称', align: 'center'}
				, {field: 'fatherid', title: '父级菜单', align: 'center'}
				, {field: 'menuurl', title: '菜单连接', align: 'center'}
				, {fixed: 'right', title: '操作', toolbar: '#barDemo', align: 'center'}
			]]
		});

		//监听行工具事件查看、删除、新增
		table.on('tool(test)', function (obj) {//注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
			var data = obj.data;//获得当前行数据
			if (obj.event === 'detail') {
				layer.msg('用户名：' + data.userName + ' 的查看操作');
			} else if (obj.event === 'del') {
				layer.confirm('真的删除行么', function (index) {
					$.ajax({
						url: "<%=path+"/deleteMenu"%>",
						data: "menuid=" + data.menuid,
						type: "Post",
						dataType: "json",
						success: function (data) {
							console.log(data);
							if (eval(data) === 200) {
								obj.del();
								return layer.msg("删除成功！");
							}else{
								return layer.msg("删除失败！");
							}

						},
						error: function (data) {
							layer.msg("连接异常！");
						}
					});
					layer.close(index);
				});
			} else if (obj.event === 'edit') {
					layer.open({
						type: 2
						, title: '编辑菜单'
						, content: 'MenuEdit.jsp'
						, area: ['500px', '480px']
						, btn: ['确定', '取消']
						,success:function (layero,index) {
							var body = layer.getChildFrame('body', index);
							// 取到弹出层里的元素，并把编辑的内容放进去
							body.find("#menuid").val(data.menuid);  //设置子窗口指定元素的值
							body.find("#menuname").val(data.menuname);  //设置子窗口指定元素的值
							body.find("#menuurl").val(data.menuurl);  //设置子窗口指定元素的值
							body.find("#father").val(data.fatherid);  //设置子窗口指定元素的值
							// 记得重新渲染表单
							form.render();
						}
						, yes: function (index, layero) {
							var iframeWindow = window['layui-layer-iframe' + index]
								, submit = layero.find('iframe').contents().find("#LAY-user-role-submit");
							//监听提交
							iframeWindow.layui.form.on('submit(LAY-user-role-submit)', function (msg) {
								var field = msg.field; //获取提交的字段\
								console.log(field);
								//提交 Ajax 成功后，静态更新表格中的数据
								$.post('<%=path+"/updateMenu"%>',{menuid:data.menuid,menuname:field.menuname,fatherid:field.father,menuurl:field.menuurl},function (msg) {
									if(eval(msg)>0){
										layer.msg("修改成功！");
									}else{layer.msg("修改失败！");}
									table.reload('testReload');
									layer.close(index); //关闭弹层
								});

							});
							submit.trigger('click');
						}
					});
			}
		});
	});

	layui.config({
		base: '<%=layui%>' //静态资源所在路径
	}).extend({
		index: 'lib/index' //主入口模块
	}).use(['index', 'useradmin', 'table'], function () {
		var $ = layui.$
			, form = layui.form
			, table = layui.table;

		//监听搜索
		form.on('submit(LAY-user-front-search)', function () {
			//执行重载
			table.reload('testReload', {
				page: {
					curr: 1 //重新从第 1 页开始
				}
				, where: {
					menuname: $('#menuname').val()
				}
			}, 'data');
		});

		//事件
		var active = {
			add: function () {
				layer.open({
					type: 2
					, title: '添加新菜单'
					, content: 'MenuAdd.jsp'
					, area: ['500px', '480px']
					, btn: ['确定', '取消']
					, yes: function (index, layero){
						var iframeWindow = window['layui-layer-iframe' + index]
							, submit = layero.find('iframe').contents().find("#LAY-user-role-submit");
						//监听提交
						iframeWindow.layui.form.on('submit(LAY-user-role-submit)', function (data) {
							var field = data.field; //获取提交的字段\
							console.log(field);
							//提交 Ajax 成功后，静态更新表格中的数据
							$.post('<%=path+"/addMenu"%>',{menuname:field.menuname,fatherid:field.father,menuurl:field.menuurl},function (msg) {
								if(eval(msg)>0){
									layer.msg("添加成功！");
								}else{layer.msg("添加失败！");}
								table.reload('testReload');
								layer.close(index); //关闭弹层
							});

						});
						submit.trigger('click');
					}
				});
			}
		};

		$('.layui-btn.layuiadmin-btn-menu').on('click', function () {
			var type = $(this).data('type');
			active[type] ? active[type].call(this) : '';
		});

	});


</script>
</body>
</html>
