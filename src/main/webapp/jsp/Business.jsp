<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String layuicsspath = request.getContextPath()+"/layuiadmin/layui/css/";
	String layuistyle = request.getContextPath()+"/layuiadmin/style/";
	String layuipath = request.getContextPath()+"/layuiadmin/layui/";
	String path =application.getContextPath();
	String jsPath=request.getContextPath()+"/js/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Layui</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel="stylesheet" href=<%=layuicsspath+"layui.css"%>>
	<script type="text/javascript" src="<%=layuipath+"layui.all.js"%>"></script>
	<script type="text/javascript" src="<%=layuipath+"layui.js"%>"></script>
	<script type="text/javascript" src=<%=jsPath+"jquery-3.4.1.js" %>></script>
	<!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>
<%--车牌号:<input name="carnum" value="${UserManagement.carnum}" disabled="disabled">--%>
<form class="layui-form" action="<%=path+"/alipay1"+"?type=jiaofei"%>" method="post" target="_blank" id="banli" >
	<div class="layui-row">
		<div class="layui-form-item">
			<div class="layui-col-xs6">
				<div class="grid-demo grid-demo-bg1" style="font-size: 20px;font-style: italic;padding-left: 50px"></div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">车牌号</label>
				<div class="layui-input-block">
					<input type="text" name="carnum" lay-verify="title" autocomplete="off"  class="layui-input" value="${UserManagement.carnum}">
				</div>
			</div>

			<c:set var="now" value="<%=new java.util.Date()%>" />
			<div class="layui-col-xs6">
				<div class="grid-demo" style="font-size: 20px;font-style: italic;padding-left: 50px">办理时间:   <label ><fmt:formatDate type="date" value="${now}"/></label></div>
			</div>
		</div>
	</div>
<div class="layui-fluid"style="padding-top: 100px;padding-left: 100px">
	<div class="layui-row">
			<div class="layui-form-item">
				<label class="layui-form-label" style="font-size: 20px;font-style: italic;padding-left: 100px">月缴办理</label>
				<div class="layui-input-block" style="padding-left: 100px">
					<c:forEach items="${combos}" var="combos">
						<input type="radio" name="time" value="${combos.combotime}"  title="${combos.combotime}:${combos.combomoney}元" checked="" >
					</c:forEach>
			</div>
	</div>
</div>
	<div class="layui-form-item">
		<div class="layui-input-block" style="padding-left: 250px">
		<%--<input type="submit" value="提交" class="layui-btn" >--%>
		<%--<button class="layui-btn" lay-submit lay-filter="formDemo" >办理</button>--%>
			<input class="layui-btn" value="办理"  onclick="xufei()"></input>
	</div>
	</div>
	</div>
</form>

</body>
<script>
	layui.use('form', function(){
		var form = layui.form; //只有执行了这一步，部分表单元素才会自动修饰成功
		//但是，如果你的HTML是动态生成的，自动渲染就会失效
		//因此你需要在相应的地方，执行下述方法来进行渲染
		form.render();
		form.on('submit(formDemo)', function(data){
			alert(JSON.stringify(data.field));
			// layer.msg(JSON.stringify(data.field));
			return false;
		});
	});
	function xufei() {
		alert("222");
		$.ajax({
			type:"POST",//提交7/的方式
			url:"<%=path+"/selhuiyuan"%>",//提交的地址
			data:"carnum=${UserManagement.carnum}",//提交的数据
			dataType:"text",//希望返回的数据类型*/

			success:function (msg) {//成功的方法  msg为返回数据
				if (msg===20){
					layui.msg("已办理,请续费")
				}
				else {
					$("#banli").submit();
				}
			},
			error:function () {//错误的方法
				alert("办理失败")
			}
		});
		/*$("#banli").submit();*/
	}
</script>
<script type="text/javascript" src=<%=layuipath+"layui.js"%>></script>
</html>