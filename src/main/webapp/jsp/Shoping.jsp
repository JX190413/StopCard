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
<style>
	#prevModal {
		width: 100%;
		height: 100%;
		text-align: center;
		display: none;

	}

</style>
<body>


<script type="text/html" id="barDemo">
	<a class="layui-btn layui-btn-xs" lay-event="shangchuan" id="shangchuang">上传/修改商品图片</a>
	<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">下架商品</a>
</script>


<div id="add-main" style="display: none;">
	<form class="layui-form" id="add-form"  action="<%=path+"/upfenqu"%>">
		<div class="layui-form-item center" >
			<select  name="interest1" lay-filter="aihao" id="demoload3" style="width: 50px;height: 30px">
				<c:forEach items="${List}" var="list">
					<option value="${list.partitionname}">${list.partitionname}</option>--%>
				</c:forEach>

			</select>
		</div>
		<div class="layui-form-item center" >
			<input type="text" name="selfenqu" lay-verify="title" autocomplete="off" placeholder="请输入名字" class="layui-input">
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit lay-filter="save" >提交修改</button>
				<button type="reset" class="layui-btn layui-btn-primary" id="closeBtn" >重置</button>
			</div>
		</div>
	</form>
</div>

<div id="add-main2" style="display: none;">
	<div class="layui-upload">
		<button type="button" class="layui-btn" id="test1">上传图片</button>
		<div class="layui-upload-list" >
			<img class="layui-upload-img" id="demo1" style="width: 500px;height: 500px">
			<p id="demoText"></p>
		</div >
		<button class="layui-btn" lay-submit lay-filter="save" id="uploadimage" >上传</button>
	</div>
	<input type="hidden"  id="hzimage">
</div>

<div class="demoTable">
	<div class="layui-card">
		<div class="layui-form layui-card-header layuiadmin-card-header-auto">
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">搜索分区：</label>
					<div class="layui-input-block">
						<select  name="interest" lay-filter="aihao" id="demoload" style="width: 120px;height: 30px">
							<option value="" selected="">请选择</option>--%>
							<c:forEach items="${List}" var="list">
								<option value="${list.partitionname}">${list.partitionname}</option>--%>
							</c:forEach>
						</select>
					</div>

				</div>
				<div class="layui-inline">
					<label class="layui-form-label">搜索商品：</label>
					<div class="layui-input-block">
						<input type="text"  id="shopname" lay-verify="title" autocomplete="off"  class="layui-input" placeholder="请输入商品名称" >
					</div>
				</div>
				<button class="layui-btn" data-type="reload">搜索</button>
				<button data-method="notice" class="layui-btn" id="xiugai">修改分区</button>

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
			,url: '<%=path+"/selshopping"%>'
			,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
			,defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
				title: '提示'
				,layEvent: 'LAYTABLE_TIPS'
				,icon: 'layui-icon-tips'
			}]
			,title: '用户数据表'
			,cols: [[ //表头
				{field: 'commodityid', title: 'ID',align: 'center'}
				,{field: 'commodityname', title: '商品名称',align: 'center'}
				,{field: 'commoditymoney', title: '商品价格',align: 'center'}
				,{field: 'commodityphoto', title: '商品图片',templet: "#imgtmp"}
				,{field: 'partitionname', title: '所属分区',align: 'center'}
				,{field: 'address', title: '发货地址', align: 'center' }
				,{field: 'stock', title: '剩余数量', align: 'center' }
				,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:500}
			]]
			,page: true

			,done:function(res,curr,count) {
				hoverOpenImg();//显示大图
				$('table tr').on('click', function () {
					$('table tr').css('background', '');
					<%--$(this).css('background', '<%=PropKit.use("config.properties").get("table_color")%>');--%>
				});
			}
			});
		table.on('tool(test)', function(obj){
			var data = obj.data;
			//console.log(obj)
			if(obj.event === 'del'){
				layer.confirm('真的删除行么', function(index){
					obj.del();
					layer.close(index);
				});
			} else if(obj.event === 'shangchuan'){
				$("#hzimage").val(data.commodityid);
				layer.prompt({
					formType: 2
					,value: data.email
					,content: $("#add-main2")
					, area: ['800px', '550px']
				}, function(value, index){
					obj.update({
						email: value
					});
					layer.close(index);
				});
			}
		});
		function hoverOpenImg(){
			var img_show = null; // tips提示
			$('td img').hover(function(){
				//alert($(this).attr('src'));
				var img = "<img class='img_msg' src='"+$(this).attr('src')+"' style='width:100%;height:100%' />";
				img_show = layer.tips(img, this,{
					// tips:[2, 'rgba(50,50,50,.5)']
					// ,area: ['-1px']//阴影面积
				});
			},function(){
				layer.close(img_show);
			});
			$('td img').attr('style','max-width:70px');
		}
		var $ = layui.$, active = {
			reload: function(){
				var demoReload = $('#demoload');
				var name = $('#shopname');
				//执行重载
				table.reload('test', {
					page: {
						curr: 1 //重新从第 1 页开始
					}
					,where: {
						id: demoReload.val(),
						shopname:name.val()
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
		// $("#shangchuan").click(function () {
		// 	var id=$("#hzimage").val(data.ID);
		// 	alert(id);
		// 	layer.open({
		// 		type: 1,
		// 		area: ['500px', '300px'],
		// 		// content: $("#add-main2") //这里content是一个普通的String
		//
		// 	});
		// });
	});

</script>
<script>
	layui.use('upload', function(){
	var $ = layui.jquery
		,upload = layui.upload;
	//普通图片上传

	var uploadInst = upload.render({
		elem: '#test1'
		,accept: 'images' //允许上传的文件类型
		,bindAction: '#uploadimage' //指定一个按钮触发上传
		,url: '/StopCard/shopingview'//改成您自己的上传接口
		,auto: false //选完文件后不要自动上传
		,choose: function(obj){
			//预读本地文件示例，不支持ie8
			this.data={"id":$("#hzimage").val()};

			obj.preview(function(index, file, result){
				$('#demo1').attr('src', result); //图片链接（base64）
			});
		}
		,done: function(res){
			//如果上传失败
			if(res.code > 0){
				return layer.msg('上传失败');
			}
			else {
				layer.msg('上传成功');
				window.location.href="seltitle";


			}
			//上传成功
		}
		,error: function(){
			//演示失败状态，并实现重传
			var demoText = $('#demoText');
			demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
			demoText.find('.demo-reload').on('click', function(){
				uploadInst.upload();
			});
		}
	});
	});
</script>
<script type="text/html" id="imgtmp">
<img src="{{d.commodityphoto}}" style="width: 100%;height: 100%">
</script>

</body>
</html>