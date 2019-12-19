<%--
  Created by IntelliJ IDEA.
  User: 21
  Date: 2019/11/17
  Time: 22:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%
	String css=request.getContextPath()+"/css/";
	String Jspath=request.getContextPath()+"/js/";
	String servletpath=request.getContextPath();

%>
<html>
<head>
	<meta charset="utf-8">
	<title>Layui</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel="stylesheet" href=<%=servletpath+"/layuiadmin/layui/css/layui.css"%> media="all">
	<script type="text/javascript" src=<%=Jspath+"jquery-3.4.1.js" %>></script>
	<!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>
<div class="demoTable">
	搜索ID：
	<div class="layui-inline">
		<input class="layui-input" name="id" id="demoReload" autocomplete="off">
	</div>
	<button class="layui-btn" data-type="reload">搜索</button>
</div>
<div class="layui-card-body">
	<div style="padding-bottom: 10px;">
		<%--		<button class="layui-btn layuiadmin-btn-useradmin" data-type="batchdel">删除</button>--%>
		<button class="layui-btn layuiadmin-btn-useradmin" data-type="add">添加</button>

	</div>

	<div style="text-align: center;font-family: 'Adobe 楷体 Std R'">
		<div class="layui-inline" style="text-align: center;">
			<table class="layui-hide" id="LAY_table_user"  lay-filter="useruv" style="text-align: center;" ></table>
		</div>
	</div>

	<script type="text/html" id="table-useradmin-admin">

		<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
		<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
		<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
		<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="power">权限管理</a>

	</script>
</div>
<script src=<%=servletpath+"/layuiadmin/layui/layui.js"%>  charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
	var dicTable=null;
	layui.use('table', function(){
		var table = layui.table;

		//方法级渲染
		dicTable =	table.render({
			elem: '#LAY_table_user'
			,url:'/StopCard/WorkerTable'
			,cellMinWidth: 200
			,page: true
			,limit:5
			,cols: [[
				{checkbox: true, fixed: true}
				, {field:'workeraccount', align:"center", title: '管理员名字'}
				,{field:'rolename', align:"center", title: '职位', sort: true}
				,{field:'statename', align:"center", title: '状态', sort: true}
				,{field:'worktime', align:"center", title: '入职时间', sort: true}

				,{field:'right', title: '操作', align:"center",toolbar:"#table-useradmin-admin"}
			]]
			,height: 300
		});
		var $ = layui.$, active = {
			reload: function(){
				//执行重载
				table.reload('LAY_table_user', {
					method:"get",
					page: {
						curr: 1 //重新从第 1 页开始
					}
					,where: {
						workeraccount:$('#demoReload').val()
					}
				}, 'data');
			}
		};

		$('.demoTable .layui-btn').on('click', function() {

			var type = $(this).data('type');
			active[type] ? active[type].call(this) : '';
		});
		table.on('tool(useruv)', function(obj){
			var data = obj.data;

			if(obj.event === 'detail'){
				layer.open({
					type: 2
					,title: '查看'
					,content: 'jsp/userform.jsp'
					,maxmin: true
					,area: ['480px', '570px']
					,btn: ['确定', '取消']
					, success : function(layero, index) {
						var body = layer.getChildFrame('body', index);

						// body.find("#USERID").val(data.USERID);
						body.find("#USERNAME").val(data.tb_name);
						body.find("#REGISTTIME").val(data.tb_time);
						body.find("#INTEGRAL").val(data.tb_integral);
						body.find("#UPLOAD").val(data.tb_upload);
						body.find("#DOWNLOAD").val(data.tb_dowload);
						if(data.tt_name=='启用'){
							body.find("#TYPE").prop("checked",true);
						}else if(data.tt_name=='禁用'){
							body.find("#TYPE").prop("checked",false);

						}
					}
					// ,value: data.USERNAME
				});
			} else if(obj.event === 'del'){
				layer.confirm('真的删除行么', function(index){
					var tb_name=data.tb_name;

					var ob = {tb_name:tb_name};
					$.ajax({
						type:"POST",//提交的方式
						url:"deleteServlet.action",//提交的地址
						data:ob,//提交的数据
						dataType:"json",//希望返回的数据类型
						async: true,//异步操作
						success:function (msg) {//成功的方法  msg为返回数据
							if(msg.msg==="1"){
								alert("删除成功")
								dicTable.reload();
								layer.close(index); //关闭弹窗
							}else if(msg.msg==="2"){
								alert("删除失败");

							}

						},
						error:function () {//错误的方法
							alert("服务器正忙")
						}
					});



				});
			} else
			if(obj.event === 'edit'){
				layer.open({
					skin: 'demo-class'
					,type: 2
					,title: '编辑'
					,content: 'jsp/Update.jsp'
					,maxmin: false
					,area: ['480px', '570px']
					,btn: ['确定', '取消']
					, success : function(layero, index) {
						var body = layer.getChildFrame('body', index);
						// body.find("#USERID").val(data.USERID);
						body.find("#USERNAME").val(data.tb_name);
						body.find("#REGISTTIME").val(data.tb_time);
						body.find("#INTEGRAL").val(data.tb_integral);
						body.find("#UPLOAD").val(data.tb_upload);
						body.find("#DOWNLOAD").val(data.tb_dowload);
						if(data.tt_name=='启用'){
							body.find("#TYPE").prop("checked",true);
						}else if(data.tt_name=='禁用'){
							body.find("#TYPE").prop("checked",false);

						}

					}
					,yes:function (index, layero) {
						var tb_name=$(layero).find('iframe')[0].contentWindow.USERNAME.value;
						var tt_name=$(layero).find('iframe')[0].contentWindow.TYPE.value;
						if(tt_name==='on'){
							layer.close(index); //关闭弹窗
						}else {
							var ob = {tb_name:tb_name,tt_name:tt_name};

							$.ajax({
								type:"POST",//提交的方式
								url:"UpdateServlet.action",//提交的地址
								data:ob,//提交的数据
								dataType:"json",//希望返回的数据类型
								async: true,//异步操作
								success:function (msg) {//成功的方法  msg为返回数据
									if(msg.msg==="1"){
										alert("修改成功")
										dicTable.reload();
										layer.close(index); //关闭弹窗
									}else if(msg.msg==="2"){
										alert("修改失败");

									}

								},
								error:function () {//错误的方法
									alert("服务器正忙")
								}
							});


						}



						// var index = parent.layer.getFrameIndex(window.name);




					}
					// ,value: data.USERNAME
				}, function(value, index){
					//这里一般是发送修改的Ajax请求
					EidtUv(data,value,index,obj);



				});



			}else if(obj.event === 'power'){

				alert("权限管理");


			}
		});



	});



	layui.config({
		// base: '../../../layuiadmin/' //静态资源所在路径
	}).extend({
		// index: 'lib/index' //主入口模块
	}).use(['table'], function(){
		var $ = layui.$
			// ,form = layui.form
			,table = layui.table;



		//事件
		var active = {
			batchdel: function(){
				var checkStatus = table.checkStatus('LAY-user-manage')
					,checkData = checkStatus.data; //得到选中的数据

				if(checkData.length === 0){
					return layer.msg('请选择数据');
				}

				layer.prompt({
					formType: 1
					,title: '敏感操作，请验证口令'
				}, function(value, index){
					layer.close(index);

					layer.confirm('确定删除吗？', function(index) {

						//执行 Ajax 后重载
						/*
						admin.req({
						  url: 'xxx'
						  //,……
						});
						*/
						table.reload('LAY-user-manage');
						layer.msg('已删除');
					});
				});
			}
			,add: function(){
				layer.open({
					type: 2
					,title: '添加用户'
					,content: 'jsp/AddWorker.jsp'
					,maxmin: true
					,area: ['800px', '800px']
					,btn: ['确定', '取消']
					,yes: function(index, layero){
						var tb_name=$(layero).find('iframe')[0].contentWindow.USERNAME.value;
						var tb_pass=$(layero).find('iframe')[0].contentWindow.USERPASS.value;
						var tb_pass2=$(layero).find('iframe')[0].contentWindow.PASS.value;
						var tb_sex=$(layero).find('iframe')[0].contentWindow.sex.value;
						var tb_study=$(layero).find('iframe')[0].contentWindow.tb_study.value;
						var tb_professional=$(layero).find('iframe')[0].contentWindow.tb_professional.value;
						var tb_phone=$(layero).find('iframe')[0].contentWindow.tb_phone.value;
						var email=$(layero).find('iframe')[0].contentWindow.Email.value;
						var myDate = new Date();
						var tb_time= myDate.toLocaleDateString();

						if(tb_pass!==tb_pass2){
							alert("两次输入的密码不对")
						}else{
							var ob = {tb_name:tb_name,tb_pass:tb_pass,tb_sex:tb_sex,tb_study:tb_study,tb_professional:tb_professional,tb_phone:tb_phone,email:email,tb_time:tb_time};

							$.ajax({
								type:"POST",//提交的方式
								url:"AddServlet.action",//提交的地址
								data:ob,//提交的数据
								dataType:"json",//希望返回的数据类型
								async: true,//异步操作
								success:function (msg) {//成功的方法  msg为返回数据
									if(msg.msg==="1"){
										alert("增加成功")
										dicTable.reload();
										layer.close(index); //关闭弹窗
									}else if(msg.msg==="2"){
										alert("增加失败");

									}

								},
								error:function () {//错误的方法
									alert("服务器正忙")
								}
							});


						}
					}
				});
			},
			uploadFile:function(){
				layer.open({
					type: 2
					,title: '选择文件'
					,content: 'jsp/uploadFile.jsp'
					,maxmin: true
					,area: ['500px', '500px']
					// ,btn: ['确定', '取消']
					// ,yes: function(index, layero){
					// 	var tb_name=$(layero).find('iframe')[0].contentWindow.USERNAME.value;
					// 	var tb_pass=$(layero).find('iframe')[0].contentWindow.USERPASS.value;
					// 	var tb_pass2=$(layero).find('iframe')[0].contentWindow.PASS.value;
					// 	var tb_sex=$(layero).find('iframe')[0].contentWindow.sex.value;
					// 	var tb_study=$(layero).find('iframe')[0].contentWindow.tb_study.value;
					// 	var tb_professional=$(layero).find('iframe')[0].contentWindow.tb_professional.value;
					// 	var tb_phone=$(layero).find('iframe')[0].contentWindow.tb_phone.value;
					// 	var email=$(layero).find('iframe')[0].contentWindow.Email.value;
					// 	var myDate = new Date();
					// 	var tb_time= myDate.toLocaleDateString();
					//
					// 	if(tb_pass!==tb_pass2){
					// 		alert("两次输入的密码不对")
					// 	}else{
					// 		var ob = {tb_name:tb_name,tb_pass:tb_pass,tb_sex:tb_sex,tb_study:tb_study,tb_professional:tb_professional,tb_phone:tb_phone,email:email,tb_time:tb_time};
					//
					// 		$.ajax({
					// 			type:"POST",//提交的方式
					// 			url:"AddServlet.action",//提交的地址
					// 			data:ob,//提交的数据
					// 			dataType:"json",//希望返回的数据类型
					// 			async: true,//异步操作
					// 			success:function (msg) {//成功的方法  msg为返回数据
					// 				if(msg.msg==="1"){
					// 					alert("增加成功")
					// 					dicTable.reload();
					// 					layer.close(index); //关闭弹窗
					// 				}else if(msg.msg==="2"){
					// 					alert("增加失败");
					//
					// 				}
					//
					// 			},
					// 			error:function () {//错误的方法
					// 				alert("服务器正忙")
					// 			}
					// 		});
					//
					//
					// 	}
					// }
				});
			}





		};





		$('.layui-btn.layuiadmin-btn-useradmin').on('click', function(){
			var type = $(this).data('type');
			active[type] ? active[type].call(this) : '';
		});





	});







	layui.use('upload', function(){
		var upload = layui.upload;

		//执行实例
		var uploadInst = upload.render({
			elem: '#test1' //绑定元素
			,url: '/Demo5/FileServlet.action' //上传接口
			,accept:'file'
			,exts:'doc|csv|txt|docx'
			,done: function(res){
				alert("上传成功")
				// if(res.msg==="1"){
				// 	alert("上传成功")
				//
				//
				// }else if(res.msg==="2"){
				// 	alert("增加失败");
				//
				// }
			}
			,error: function(){
				//请求异常回调
			}
		});
	});



</script>

</body>
</html>
