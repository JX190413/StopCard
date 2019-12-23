<%--
  Created by IntelliJ IDEA.
  User: 14506
  Date: 2019/12/8
  Time: 11:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>添加角色</title>
	<script src="../js/jquery-3.4.1.js"></script>
<%--	<link rel="stylesheet" href="../layuiadmin/layui/css/layui.css" media="all">--%>
	<link rel="stylesheet" href="../layui/css/layui.css" media="all">

</head>
<body>

<div class="layui-form" lay-filter="layuiadmin-form-role" id="layuiadmin-form-role" style="padding: 20px 30px 0 0;">
	<div class="layui-form-item">
		<label class="layui-form-label"><span style="color: red">*</span>菜单名称</label>
		<div class="layui-input-block">
			<input type="text" name="menuname" onblur="checkRole(this)" lay-verify="required" placeholder="请输入菜单名称" autocomplete="off" class="layui-input">
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">上级菜单</label>
		<div class="layui-input-block">
			<select id="rolename" name="fatherid" lay-search lay-filter="LAY-user-adminrole-type">
			</select>
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">菜单连接</label>
		<div class="layui-input-block">
			<input type="text" name="menuurl"  placeholder="请输入菜单连接"  autocomplete="off" class="layui-input">
		</div>
	</div>
	<div class="layui-form-item" align="center" >
		(带<span style="color: red">*</span>为必填项)
	</div>
	<div class="layui-form-item layui-hide">
		<button class="layui-btn" lay-submit lay-filter="LAY-user-role-submit" id="LAY-user-role-submit">提交</button>
	</div>
</div>

<script src="../layui/layui.js" charset="utf-8"></script>
<script>

	// function checkRole(node){
	// 	var role=$(node).val();
	// 	$.post("/StopCard/checkRole", { role: role},
	// 		function(data){
	// 			if(eval(data)===0){
	// 				layer.msg(role+"角色已存在！请重新输入！");
	// 				$(node).val("")
	// 			}
	// 		});
	// }
	//角色下拉框动态赋值
	function selectRender(form) {
		$.post("/StopCard/queryMenu", function (obj) {
			console.log(obj.data);
			if (obj != undefined && obj != null && obj != "") {
				var data=obj.data;
				var html = "<option ></option>";
				for (var i = 0; i < data.length; i++) {
					html += "<option value=" + data[i].menuid + ">" + data[i].menuid+"."+data[i].menuname + "</option>";
				}
				$("#rolename").append(html);
			}
			//重新渲染select
			form.render();
		});
	}
	layui.config({
		base: '../layuiadmin/' //静态资源所在路径
	}).extend({
		index: 'lib/index' //主入口模块
	}).use(['index', 'form'], function () {
		var $ = layui.$
			, form = layui.form;
		selectRender(form)
	});
</script>
</body>
</html>
