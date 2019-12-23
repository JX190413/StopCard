<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<div id="add-main" style="display: none;">
	<form class="layui-form" id="add-form"  action="">
		<div class="layui-form-item center" >
			<label class="layui-form-label" style="width: 100px" >用户姓名</label>
			<div class="layui-input-block">
				<input  type="text" name="name" required value="" style="width: 240px" lay-verify="required placeholder="请输入用户名" autocomplete="off" class="layui-input">
			</div>
		</div><%--
		<div class="layui-form-item">
			<label class="layui-form-label" style="width: 100px">配置类型</label>
			<div class="layui-input-block">
				<input type="text" name="type" required  style="width: 240px" lay-verify="required" placeholder="请输入配置类型" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label" style="width: 100px">配置值&emsp;</label>
			<div class="layui-input-block">
				<input type="text" name="value" required  style="width: 240px" lay-verify="required" placeholder="请输入配置值" autocomplete="off" class="layui-input">
				<!-- <input type="hidden" name="id" style="width: 240px" autocomplete="off" class="layui-input"> -->
			</div>
		</div>--%>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit lay-filter="save" >立即提交</button>
				<button type="reset" class="layui-btn layui-btn-primary" id="closeBtn" >重置</button>
			</div>
		</div>
	</form>
</div>

<div class="demoTable">
	搜索ID：
	<div class="layui-inline">
		<input class="layui-input" name="id" id="demoReload" autocomplete="off">
	</div>
	<button class="layui-btn" data-type="reload">搜索</button>
	<button class="layui-btn" onclick="onAddBtn()">新增人员</button>
</div>
<table class="layui-hide" id="test" lay-filter="test"></table>
<script type="text/html" id="toolbarDemo">
	<div class="layui-btn-container">
		<button class="layui-btn layui-btn-sm" lay-event="getCheckData">获取选中的行</button>
		<button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button>
		<button class="layui-btn layui-btn-sm" lay-event="isAll">验证是否全选</button>
	</div>
</script>
<script type="text/html" id="barDemo">
	<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
	<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

<script>
	layui.use('table', function(){
		var table = layui.table;
		table.render({
			elem: '#test'
			,url: '<%=path+"/selhuiyuan"%>'
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
				,{field: 'portcardid', title: '车位ID', width:80}
				,{field: 'portarea', title: '车位所在区', width:177, sort: true}
				,{field: 'portname', title: '车位名', width:80}
				,{field: 'stateid', title: '车位所在状态ID', width: 177 }
				,{field: 'statename', title: '车位状态', width: 177, sort: true}
				/*,{field: 'usertype', title: '状态', width: 80, sort: true}*/
				,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}
			]]
			,page: true
		});
		//头工具栏事件
		table.on('toolbar(test)', function(obj){
			var checkStatus = table.checkStatus(obj.config.id);
			switch(obj.event){
				case 'getCheckData':
					var data = checkStatus.data;
					layer.alert(JSON.stringify(data));
					break;
				case 'getCheckLength':
					var data = checkStatus.data;
					layer.msg('选中了：'+ data.length + ' 个');
					break;
				case 'isAll':
					layer.msg(checkStatus.isAll ? '全选': '未全选');
					break;
				//自定义头工具栏右侧图标 - 提示
				case 'LAYTABLE_TIPS':
					layer.alert('这是工具栏右侧自定义的一个图标按钮');
					break;
			};
		});
		//监听行工具事件
		table.on('tool(test)', function(obj){
			var data = obj.data;
			//console.log(obj)
			if(obj.event === 'del'){
				layer.confirm('真的删除行么', function(index){
					$.ajax({
						type:"POST",//提交7/的方式
						url:"dele.action",//提交的地址
						data:"msg1="+data.id,//提交的数据
						/*dataType:"text",//希望返回的数据类型*/
						async: true,//异步操作
						success:function (msg) {//成功的方法  msg为返回数据
							if (msg===200){
								alert("修改成功")
							}
							else{
								alert("修改失败")
							}
						}
						/*error:function () {//错误的方法
							alert("修改失败")
						}*/
					});
					obj.del();
					layer.close(index);
				});
			} else if(obj.event === 'edit'){
				layer.prompt({
					formType: 2
					,value: data.email
				}, function(value, index){
					obj.update({
						email: value
					});
					layer.close(index);
				});
			}
		});

		var $ = layui.$, active = {
			reload: function(){
				var demoReload = $('#demoReload');
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
	function onAddBtn(){
		var $ = layui.$;
		//页面层-自定义
		layer.open({
			type: 1,
			title:"新建配置",
			closeBtn: false,
			shift: 2,
			area: ['400px', '300px'],
			shadeClose: true,
			btn: [ '取消'],
			// btnAlign: 'c',
			content: $("#add-main"),
			success: function(layero, index){

			},
			yes:function(){

			}
		});
	}

</script>
<script type="text/javascript">
	layui.use(['layer', 'form'], function () {
		var layer = layui.layer,
			$ = layui.jquery,
			form = layui.form;
		var obj = document.getElementById('closeBtn');
		form.on('submit(save)', function (data) {
			params = data.field;
			//alert(JSON.stringify(params))
			submit($,params);
			return false;
		})

		var obj = document.getElementById('closeBtn');
		obj.addEventListener('click', function cancel(){
			CloseWin();
		});
	})

	//提交
	function submit($,params){
		$.post('add.action', params, function (res) {
			if (res.status===1) {
				layer.msg(res.message,{icon:1},function(index){
					CloseWin();
				})
			}
		}, 'json');
	}
	//关闭页面
	function CloseWin(){
		parent.location.reload(); // 父页面刷新
		var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
		parent.layer.close(index); //再执行关闭
	}
</script>
</body>
</html>