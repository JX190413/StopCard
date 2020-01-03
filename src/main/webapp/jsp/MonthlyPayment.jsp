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
	String uiPath = request.getContextPath() + "/layuiadmin/";
%>
<html>
<head>
	<link rel="stylesheet" href=<%=uiPath+"layui/css/layui.css"%>>
	<link rel="stylesheet" href="<%=uiPath+"style/admin.css"%>" media="all">
	<script src=<%=jspath+"/js/jquery-3.4.1.js"%>></script>
	<script src=<%=jspath+"/layui/layui.js"%>></script>
	<title>月缴产品表格界面</title>
</head>

<body>

<div class="demoTable">
	<div class="layui-card">
		<div class="layui-form layui-card-header layuiadmin-card-header-auto">
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">产品名字</label>
					<div class="layui-input-block">
						<input type="text" name="combotime" placeholder="请输入" id="demoReload" autocomplete="off" class="layui-input">
					</div>
				</div>


				<div class="layui-inline">
					<button class="layui-btn" data-type="reload">
						<i class="layui-icon layui-icon-search layuiadmin-button-btn"></i>
					</button>
					<button class="layui-btn layuiadmin-btn-useradmin" data-type="add">添加</button>
				</div>


			</div>
		</div>


		<div class="layui-card-body">
			<table class="layui-hide" id="demo" lay-filter="test"></table>
			<script type="text/html" id="barDemo">
<%--                    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">修改</a>--%>
<%--                    <a class="layui-btn layui-btn-xs" lay-event="edit">状态</a>--%>
                    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>

			</script>
		</div>
	</div>
</div>





<script>
	var dicTabel=null;


	layui.use('table', function(){
		var table = layui.table;
		//展示已知数据
		dicTabel =table.render({
			elem: '#demo'
			,height:400
			,limit:5
			,limits:[5]
			,url:'/StopCard/MonthlyPayment.action'
			// ,method:'post'
			,page: true
			,id:'testReload'
			,cols: [[ //标题栏
				{field: 'comboid', title: '产品序号', sort: true ,align:'center'}
				,{field: 'combotime', title: '产品名字',align:'center' }
				,{field: 'combomoney', title: '产品价格',align:'center'}
				,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:200}

			]]
		});

		var $ = layui.$, active = {
			reload: function(){
				var demoReload = $('#demoReload');
				//执行重载
				table.reload('testReload', {
					page: {
						curr: 1 //重新从第 1 页开始
					}
					,where: {
						combotime: demoReload.val()
					}
				}, 'data');
			}


			,add: function(){
				layer.open({
					type: 2
					,title: '添加月缴产品'
					,content: 'jsp/AddMonthlyPayment.jsp'
					,maxmin: true
					,area: ['500px', '450px']
					,btn: ['确定', '取消']
					,yes: function(index, layero){
						//alert("增加");
					    //设备区域
						var combotime = $(layero).find('iframe')[0].contentWindow.combotime.value;
                       alert("月缴产品名-----"+combotime);


						//设备名字
						var combomoney = $(layero).find('iframe')[0].contentWindow.combomoney.value;
						alert("月缴产品价格-----"+combomoney);

						var ob = {
							combotime: combotime,
							combomoney:combomoney

						};

						$.ajax({
							type: "POST",//提交的方式
							url: "/StopCard/addMonthlyPayment.action",//提交的地址
							data: ob,//提交的数据
							dataType: "json",//希望返回的数据类型
							async: true,//异步操作
							success: function (msg) {//成功的方法  msg为返回数据
								if (msg.msg === "1") {
									alert("增加成功！！！");

									dicTabel.reload();
									layer.close(index);
								}else if(msg.msg === "2"){
									alert("增加失败！！！");
									dicTabel.reload();
									layer.close(index);
								}else if(msg.msg === "3"){
									alert("增加重复了！！！");
									dicTabel.reload();
									layer.close(index);
								}
							},
							error: function () {//错误的方法
								alert("服务器未找到")
							}
						});

					}
				});


			}

		};



		//修改
		table.on('tool(test)', function(obj){
			var data = obj.data;
			if(obj.event === 'detail'){
				layer.open({
					type: 2
					,title: '修改'
					,content: 'jsp/gaiDevic.jsp'
					,maxmin: true
					,area: ['500px', '450px']
					,btn: ['确定', '取消']
					, success : function(layero, index) {
						var body = layer.getChildFrame('body', index);

						body.find("#devicid").val(data.devicid);
						
					}
					,yes: function(index, layero){


						var devicid = $(layero).find('iframe')[0].contentWindow.devicid.value;
						alert("设备序号-----"+devicid);


						var devicearea = $(layero).find('iframe')[0].contentWindow.devicearea.value;
						alert("设备区域-----"+devicearea);


						//设备名字
						var devicname = $(layero).find('iframe')[0].contentWindow.devicname.value;
						alert("设备名字-----"+devicname);


						var ob = {
							devicid: devicid,
							devicearea: devicearea,
							devicname:devicname

						};

						$.ajax({
							type: "POST",//提交的方式
							url: "/StopCard/revisedevic.action",//提交的地址
							data: ob,//提交的数据
							dataType: "json",//希望返回的数据类型
							async: true,//异步操作
							success: function (msg) {//成功的方法  msg为返回数据
								if (msg.msg === "1") {
									alert("修改成功！！！");
									// table.reload('demo');
									dicTabel.reload();
									layer.close(index);
								}else if(msg.msg === "2"){
									alert("修改失败！！！");
									dicTabel.reload();
									layer.close(index);
								}
							},
							error: function () {//错误的方法
								alert("服务器未找到")
							}
						});

					}
				});




			} else if(obj.event === 'del'){
				layer.confirm('真的删除行么', function(index){
					layer.close(index);

					var comboid = data.comboid;
					alert("ID-----"+comboid);
					var ob = {
						comboid: comboid
					};

					$.ajax({
						type: "POST",//提交的方式
						url: "/StopCard/deMonthlyPayment.action",//提交的地址
						data: ob,//提交的数据
						dataType: "json",//希望返回的数据类型
						async: true,//异步操作
						success: function (msg) {//成功的方法  msg为返回数据
							if (msg.msg === "1") {
								alert("删除成功！！！");
								// table.reload('demo');
								dicTabel.reload();
							}else if(msg.msg === "2"){
								alert("删除失败！！！");
								dicTabel.reload();
								layer.close(index);
							}
						},
						error: function () {//错误的方法
							alert("服务器未找到")
						}
					});
				});
			} else if(obj.event === 'edit'){

				var devicid = data.devicid;
				var statename = data.statename;

				alert("statename-----------"+statename);
				var ob = {
					devicid: devicid,
					statename:statename
				};

				$.ajax({
					type: "POST",//提交的方式
					url: "/StopCard/state.action",//提交的地址
					data: ob,//提交的数据
					dataType: "json",//希望返回的数据类型
					async: true,//异步操作
					success: function (msg) {//成功的方法  msg为返回数据
						if (msg.msg === "1") {
							alert("状态修改成功！！！");
							// table.reload('demo');
							dicTabel.reload();
						}
					},
					error: function () {//错误的方法
						alert("状态修改服务器未找到")
					}
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
