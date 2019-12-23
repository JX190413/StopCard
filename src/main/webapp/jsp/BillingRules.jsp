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
	<script src=<%=jspath+"/js/jquery-3.4.1.js"%>></script>
	<script src=<%=jspath+"/layui/layui.js"%>></script>
	<title>计费规则表</title>
</head>

<body>

<div class="demoTable">
	<div class="layui-card">
<%--x--%>


		<div class="layui-card-body">

			<script type="text/html" id="barDemo">
                    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">修改</a>
<%--                    <a class="layui-btn layui-btn-xs" lay-event="edit">状态</a>--%>
                    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
			</script>
		</div>
	</div>
</div>


<table class="layui-hide" id="demo" lay-filter="test"></table>


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
			,url:'/StopCard/BillingRulesR.action'
			// ,method:'post'
			,page: true
			,id:'testReload'
			,cols: [[ //标题栏
				{field: 'rulesid', title: '计费规则序号', sort: true ,align:'center'}
				,{field: 'ruletime', title: '计费规则时间段(分钟)',align:'center' }
				,{field: 'chargemoney', title: '计费规则基本收费金额(元)',align:'center'}
				,{field: 'moremoney', title: '计费规则超时收费金额(元)',align:'center'}
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
					,title: '添加计费规则'
					,content: 'jsp/.jsp'
					,maxmin: true
					,area: ['500px', '450px']
					,btn: ['确定', '取消']
					,yes: function(index, layero){
						//alert("增加");
					    //设备区域
						var rulesid = $(layero).find('iframe')[0].contentWindow.rulesid.value;
						alert("计费规则序号-----"+rulesid);

						var ruletime = $(layero).find('iframe')[0].contentWindow.ruletime.value;
                       alert("计费规则时间段-----"+ruletime);

						var chargemoney = $(layero).find('iframe')[0].contentWindow.chargemoney.value;
						alert("计费规则基本收费-----"+chargemoney);

						//设备名字
						var moremoney = $(layero).find('iframe')[0].contentWindow.moremoney.value;
						alert("计费规则超时收费-----"+moremoney);

						var ob = {
							rulesid: rulesid,
							ruletime:ruletime,
							chargemoney:chargemoney,
							moremoney:moremoney


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
					,content: 'jsp/BillingRulesGai.jsp'
					,maxmin: true
					,area: ['500px', '450px']
					,btn: ['确定', '取消']
					, success : function(layero, index) {
						var body = layer.getChildFrame('body', index);

						body.find("#rulesid").val(data.rulesid);
						body.find("#ruletime").val(data.ruletime);
						
					}
					,yes: function(index, layero){


						//设备区域
						var rulesid = $(layero).find('iframe')[0].contentWindow.rulesid.value;
						alert("计费规则序号-----"+rulesid);

						var ruletime = $(layero).find('iframe')[0].contentWindow.ruletime.value;
						alert("计费规则时间段-----"+ruletime);

						var chargemoney = $(layero).find('iframe')[0].contentWindow.chargemoney.value;
						alert("计费规则基本收费-----"+chargemoney);

						//设备名字
						var moremoney = $(layero).find('iframe')[0].contentWindow.moremoney.value;
						alert("计费规则超时收费-----"+moremoney);


						var ob = {
							rulesid: rulesid,
							ruletime:ruletime,
							chargemoney:chargemoney,
							moremoney:moremoney

						};

						$.ajax({
							type: "POST",//提交的方式
							url: "/StopCard/stateBillingRules.action",//提交的地址
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

					var rulesid = data.rulesid;
					alert("ID-----"+rulesid);
					var ob = {
						rulesid: rulesid,
					};

					$.ajax({
						type: "POST",//提交的方式
						url: "/StopCard/deBillingRules.action",//提交的地址
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
					url: "/StopCard/.action",//提交的地址
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