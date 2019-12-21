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
	<title>月缴产品新增小界面</title>


	<link rel="stylesheet" href=<%=uiPath+"layui/css/layui.css"%>>
	<link rel="stylesheet" href=<%=uiPath+"style/admin.css"%> media="all">
<%--	<script src=<%=jspath+"/js/jquery-3.4.1.js"%>></script>--%>
	<script src=<%=uiPath+"layui/layui.js"%>></script>

</head>
<body>




<div class="layui-form" lay-filter="layuiadmin-form-useradmin" id="layuiadmin-form-useradmin" style="padding: 20px 0 0 0;">


	<div class="layui-form-item" lay-filter="sex">
		<label class="layui-form-label">月缴产品名</label>
		<div class="layui-inline">
			<select name="combotime"  id="combotime" lay-filter="LAY-user-adminrole-type">
				<option value=""></option>
				<option value="一个月">一个月</option>
				<option value="三个月">三个月</option>
				<option value="六个月">六个月</option>
				<option value="十二个月">十二个月</option>
			</select>
		</div>
	</div>


	<div class="layui-form-item">
		<label class="layui-form-label">月缴产品价格</label>
		<div class="layui-input-inline">
			<input type="text" name="combomoney" lay-verify="combomoney" id="combomoney" placeholder="月缴产品价格" autocomplete="off" class="layui-input">
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