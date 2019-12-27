<%--
  Created by IntelliJ IDEA.
  User: 14506
  Date: 2019/12/23
  Time: 16:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String path=application.getContextPath();
%>
<html>
<head>
	<title>Title</title>
	<link rel="stylesheet" href="../layuiadmin/layui/css/layui.css" media="all">
	<link rel="stylesheet" href="../layuiadmin/style/admin.css" media="all">
	<script type="text/javascript" src="../js/jquery-3.4.1.js" ></script>
</head>
<body>

<div class="layui-fluid">
	<div class="layui-row layui-col-space15">
		<div class="layui-col-md12">
			<div class="layui-card">
				<div class="layui-card-header">网站设置</div>
				<div class="layui-card-body" pad15>

<%--					<form id="myform" action="<%=path+"/updateParameter"%>">--%>
						<div class="layui-form-item">
							<label class="layui-form-label">网站名称</label>
							<div class="layui-input-block">
								<input type="text" name="webname" id="webname" lay-verify="title" autocomplete="off" placeholder="请输入标题" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">网站邮箱</label>
							<div class="layui-input-block">
								<input type="text" name="mail" id="mail" lay-verify="required" lay-reqtext="用户名是必填项，岂能为空？" placeholder="请输入" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-input-block">
							<button class="layui-btn"  id="up">确认保存</button>
						</div>
<%--					</form>--%>

				</div>
			</div>
		</div>
	</div>
</div>


<script src="../layuiadmin/layui/layui.js"></script>
<script>
	//数据显示
	$.post('<%=path+"/queryParameter"%>',function (msg) {
		if(msg!=null){
			$("#webname").val(msg.webname);
			$("#mail").val(msg.mail)
		}

	});

	$("#up").click(function () {
		$.post('<%=path+"/updateParameter"%>',{webname:$("#webname").val(),mail:$("#mail").val()},function (msg) {
			if(eval(msg)==200){layer.msg("修改成功！")}
			else layer.msg("修改失败！")
		})
	});

	layui.config({
		base: '../layuiadmin/' //静态资源所在路径
	}).extend({
		index: 'lib/index' //主入口模块
	}).use(['index', 'set']);
</script>
</body>
</html>