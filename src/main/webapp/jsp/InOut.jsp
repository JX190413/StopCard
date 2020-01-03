<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String layuicsspath = request.getContextPath()+"/layuiadmin/layui/css/";
	String layuistyle = request.getContextPath()+"/layuiadmin/style/";
	String layuipath = request.getContextPath()+"/layuiadmin/layui/";
	String path =application.getContextPath();
	String jsPath=request.getContextPath()+"/js/";
	String cssPath=request.getContextPath()+"/css/";
	String uiPath = request.getContextPath() + "/layuiadmin/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Layui</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel="stylesheet" href=<%=uiPath+"layui/css/layui.css"%>>
	<link rel="stylesheet" href=<%=uiPath+"style/admin.css"%>>
	<script type="text/javascript" src=<%=jsPath+"jquery.js" %>></script>
	<!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>

<div class="demoTable">
	<div class="layui-card">
		<div class="layui-form layui-card-header layuiadmin-card-header-auto">
			<div class="layui-form-item">
				搜索分区：
				<div class="layui-inline">
					<div class="layui-input-block">
						<div class="layui-input-block">
							<input type="text"  placeholder="请输入车牌号" class="layui-input" id="carnum">
						</div>
					</div>
				</div>
				<button class="layui-btn" data-type="reload">搜索</button>
			</div>
		</div>

		<div class="layui-card-body">
			<table class="layui-hide" id="test" lay-filter="test"></table>
		</div>
	</div>





</div>

<script type="text/html" id="toolbarDemo">
</script>
<script type="text/javascript" src="<%=layuipath+"layui.js"%>"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

<script>
	layui.use('table', function(){
		var table = layui.table;
		table.render({
			elem: '#test'
			,url: '<%=path+"/Temporary"%>'
			,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
			,defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
				title: '提示'
				,layEvent: 'LAYTABLE_TIPS'
				,icon: 'layui-icon-tips'
			}]

			,title: '用户数据表'
			,cols: [[ //表头
				{type: 'checkbox', fixed: 'left'}
				,{field: 'inoutid', title: 'ID', width:100, sort: true, fixed: 'left'}
				/*,{field: 'portcardid', title: '用户名', width:80}*/
				,{field: 'carnum', title: '车牌号', width:100, sort: true}
				,{field: 'intime', title: '进场时间', width:200}
				,{field: 'outtime', title: '出场时间', width: 200 }
				,{field: 'stoptime', title: '停车时间', width: 100 }
				,{field: 'money', title: '需缴金额', width: 100 }
				,{field: 'portname', title: '车位号', width: 100 }
				/*,{field: 'innumber', title: '下载文件数', width: 177, sort: true}*/
				/*,{field: 'usertype', title: '状态', width: 80, sort: true}
				,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}*/
			]]
			,page: true
		});
		var $ = layui.$, active = {
			reload: function(){
				var demoReload = $('#carnum');
				//执行重载
				table.reload('test', {
					page: {
						curr: 1 //重新从第 1 页开始
					}
					,where: {
						id: demoReload.val()
					}
				}, 'data');
			}
		};
		$('.demoTable .layui-btn').on('click', function(){
			var type = $(this).data('type');
			active[type] ? active[type].call(this) : '';
		})
	});
</script>
<script>
	layui.use('layer', function(){ //独立版的layer无需执行这一句
		var layer = layui.layer;
//layer.msg("大家好，这是最简单的弹层", { time: 9000, type: 1,title:['测试一下','font-size:18px'] });
		$("#xiugai").click(function () {
			layer.open({
				type: 1,
				area: ['500px', '300px'],
				content: $("#add-main") //这里content是一个普通的String
			});
		});
	});
</script>
</body>
</html>