<%--
  Created by IntelliJ IDEA.
  User: 21
  Date: 2019/11/18
  Time: 11:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%

	String jsPath=request.getContextPath()+"/js/";
	String servletPath=request.getContextPath();


%>
<html>
<head>
	<meta charset="utf-8">
	<title>layuiAdmin 网站用户 iframe 框</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<link rel="stylesheet" href=<%=servletPath+"/layui/css/layui.css"%> media="all">
	<script type="text/javascript" src=<%=jsPath+"jquery-3.4.1.js" %>></script>
</head>
<body>
<form>
	<div class="layui-form" lay-filter="layuiadmin-form-useradmin" id="layuiadmin-form-useradmin" style="padding: 20px 0 0 0;">
<%--		<div class="layui-form-item">--%>
<%--			<label class="layui-form-label">ID</label>--%>
<%--			<div class="layui-input-inline">--%>
<%--				<input type="text" name="USERID" id="USERID" lay-verify="required"  autocomplete="off" class="layui-input" disabled="disabled" >--%>
<%--			</div>--%>
<%--		</div>--%>
		<div class="layui-form-item">
			<label class="layui-form-label">管理员id</label>
			<div class="layui-input-inline">
				<input type="text" name="workerid" id="workerid" lay-verify="required"  autocomplete="off" class="layui-input"  >
			</div>
		</div>
	<div class="layui-form-item">
		<label class="layui-form-label">管理员名</label>
		<div class="layui-input-inline">
			<input type="text" name="workeraccount" id="workeraccount" lay-verify="required"  autocomplete="off" class="layui-input"  >
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">角色</label>
		<div class="layui-input-block">
			<select id="roleid" name="roleid"  lay-filter="LAY-user-adminrole-type">
			</select>
		</div>
	</div>




	<div class="layui-form-item layui-hide">
			<input type="button" lay-submit lay-filter="LAY-user-front-submit" id="LAY-user-front-submit" value="确认">
		</div>
<%--		<div align="center">--%>
<%--		<button type="button" class="layui-btn layui-btn-radius" onclick="ok()">确定</button>--%>
<%--		<button type="button" class="layui-btn layui-btn-radius" onclick="no()">取消</button>--%>
<%--		</div>--%>
	</div>

	<script src=<%=servletPath+"/layui/layui.js"%>></script>
	<script>
		layui.use( 'form',  function(){
			var $ = layui.$
				,form = layui.form
				,upload = layui.upload ; //只有执行了这一步，部分表单元素才会自动修饰成功

		  // var ob={workid:workid}
		  //
		  //
			$.ajax({
				type:"POST",//提交的方式
				url:"/StopCard/selectRole",//提交的地址
				// data:ob,//提交的数据
				dataType:"json",//希望返回的数据类型
				async: true,//异步操作
				success:function (obj) {//成功的方法  msg为返回数据

					if (obj != undefined && obj != null && obj != "") {

						var html = "<option ></option>";

						for (var i = 0; i < obj.length; i++) {
									html += "<option selected value=" + obj[i].roleid + " >" + obj[i].roleid+"."+obj[i].rolename + "</option>";

						}
						$("#roleid").append(html);
						form.render();
					}
				},
				error:function () {//错误的方法
					alert("服务器正忙")
				}
			});









			// form.on('switch(switchTest)', function(data){
			// 	var check=data.elem.checked;
			// 	if(check===true){
			// 		$("#TYPE").val("启用")
			// 	}else if(check===false){
			// 		$("#TYPE").val("禁用")
			// 	}
			// 	layer.msg('修改状态：'+ (this.checked ? '启用' : '禁用'), {
			//
			// 		offset: '6px'
			// 	});
			// 	// layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
			// });

		});

	</script>
</form>
</body>
</html>
