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
	<script type="text/javascript" src=<%=jsPath+"jquery.js" %>></script>
	<!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>
<div id="add-main" style="display: none;">
	<form class="layui-form" id="add-form"  action="<%=path+"/updatetype"%>">
		<div class="layui-form-item center" >
			<select  name="interest1" lay-filter="aihao" id="demoload3" style="width: 50px;height: 30px">
				<option value="A区">A区</option>
				<option value="B区" >B区</option>
				<option value="C区">C区</option>
				<option value="D区">D区</option>
				<option value="F区">F区</option>
			</select>
		</div>
		<div class="layui-form-item center" >
			<select  name="interest2" lay-filter="aihao" id="demoload1" style="width: 50px;height: 30px">
				<option value="空闲车位">空闲车位</option>
				<option value="不可用车位" >不可用车位</option>
			</select>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit lay-filter="save" >提交修改</button>
				<button type="reset" class="layui-btn layui-btn-primary" id="closeBtn" >重置</button>
			</div>
		</div>
	</form>
</div>

<div class="demoTable">
	搜索分区：
	<div class="layui-inline">
		<div class="layui-input-block">
			<select  name="interest" lay-filter="aihao" id="demoload" style="width: 120px;height: 30px">
				<option value="" selected="">请选择</option>
				<option value="A区">A区</option>
				<option value="B区" >B区</option>
				<option value="C区">C区</option>
				<option value="D区">D区</option>
				<option value="F区">F区</option>
			</select>
		</div>
	</div>
	<button class="layui-btn" data-type="reload">搜索</button>
	<button data-method="notice" class="layui-btn" id="xiugai">修改车位状态</button>
</div>
<table class="layui-hide" id="test" lay-filter="test"></table>
<script type="text/html" id="toolbarDemo">
</script>
<script type="text/javascript" src="<%=layuipath+"layui.js"%>"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

<script>
	layui.use('table', function(){
		var table = layui.table;
		table.render({
			elem: '#test'
			,url: '<%=path+"/selall"%>'
			,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
			,defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
				title: '提示'
				,layEvent: 'LAYTABLE_TIPS'
				,icon: 'layui-icon-tips'
			}]
			,title: '用户数据表'
			,cols: [[ //表头
				{type: 'checkbox', fixed: 'left'}
				,{field: 'portid', title: 'ID', width:80, sort: true, fixed: 'left'}
				/*,{field: 'portcardid', title: '用户名', width:80}*/
				,{field: 'portarea', title: '区域', width:100, sort: true}
				,{field: 'portname', title: '车位号', width:150}
				,{field: 'statename', title: '车位状态', width: 150 }
				/*,{field: 'innumber', title: '下载文件数', width: 177, sort: true}*/
				/*,{field: 'usertype', title: '状态', width: 80, sort: true}
				,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}*/
			]]
			,page: true
		});
		var $ = layui.$, active = {
			reload: function(){
				var demoReload = $('#demoload');
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