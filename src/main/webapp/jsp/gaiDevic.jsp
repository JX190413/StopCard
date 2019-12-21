<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/10/24
  Time: 17:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String jspath = application.getContextPath();
	String path=request.getContextPath();
	String uiPath = request.getContextPath() + "/layuiadmin/";



%>
<html>
<head>
	<title>自助设备管理修改小界面</title>


	<link rel="stylesheet" href=<%=uiPath+"layui/css/layui.css"%>>
	<link rel="stylesheet" href=<%=uiPath+"style/admin.css"%> media="all">
<%--	<script src=<%=jspath+"/js/jquery-3.4.1.js"%>></script>--%>
	<script src=<%=uiPath+"layui/layui.js"%>></script>

</head>
<body>




<div class="layui-form" lay-filter="layuiadmin-form-useradmin" id="layuiadmin-form-useradmin" style="padding: 20px 0 0 0;">


	<div class="layui-form-item">
		<label class="layui-form-label">设备序号 </label>
		<div class="layui-input-inline">
			<input type="text" name="devicid" lay-verify="email" id="devicid" autocomplete="off" class="layui-input">
		</div>
	</div>



	<div class="layui-form-item" lay-filter="sex">
		<label class="layui-form-label">设备区域</label>
		<div class="layui-inline">
			<select name="devicearea"  id="devicearea" lay-filter="LAY-user-adminrole-type">
				<option value=""></option>
				<option value="A区">A区</option>
				<option value="B区">B区</option>
				<option value="C区">C区</option>
				<option value="D区">D区</option>
			</select>
		</div>
	</div>



	<div class="layui-form-item">
		<label class="layui-form-label">设备名字</label>
		<div class="layui-input-inline">
			<input type="text" name="devicname" lay-verify="email" id="devicname" placeholder="请输入设备名字" autocomplete="off" class="layui-input">
		</div>
	</div>





	<div class="layui-form-item layui-hide">
		<input type="button" lay-submit lay-filter="LAY-user-front-submit" id="LAY-user-front-submit" value="确认">
	</div>
</div>

<script src="../layuiadmin/layui/layui.js"></script>

<script>
	layui.use('form', function(){
		var form = layui.form; //只有执行了这一步，部分表单元素才会自动修饰成功

		//……

		//但是，如果你的HTML是动态生成的，自动渲染就会失效
		//因此你需要在相应的地方，执行下述方法来进行渲染
		form.render();
	});





</script>
</body>
</html>