<%--
  Created by IntelliJ IDEA.
  User: 14506
  Date: 2019/12/18
  Time: 17:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>Title</title>
	<link rel="stylesheet" href="../layui/css/layui.css" media="all">
	<link rel="stylesheet" href="../layuiadmin/style/admin.css" media="all">
	<script src="../layui/layui.js"></script>
	<style>
		.thumb {
			margin-left: 5px;
			margin-top: 15px;
			height: 128px
		}

		#prevModal {
			width: 100%;
			height: 100%;
			text-align: center;
			display: none;
		}

		#img_prev {
			max-width: 98%;
			max-height: 98%;
			margin: 10px auto
		}
	</style>
</head>
<body>

	<div class="layui-form" lay-filter="layuiadmin-form-role" id="layuiadmin-form-role" style="padding: 20px 30px 0 0;">
		<div class="layui-form-item">
			<label class="layui-form-label">广告位</label>
			<div class="layui-input-block">
				<input type="text" id="adid" name="adid" disabled class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">广告名称</label>
			<div class="layui-input-block">
				<input type="text" id="adname" name="adname"  class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">广告连接</label>
			<div class="layui-input-block">
				<input type="text" id="adurl" name="adurl"  class="layui-input">
			</div>
		</div>
		<div class="layui-form-item layui-form-text">
			<label class="layui-form-label">广告标语</label>
			<div class="layui-input-block">
				<textarea name="admsg" id="admsg" class="layui-textarea">layuiAdmin 通用后台管理模板系统</textarea>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-upload" >
				<button type="button" class="layui-btn" id="test1">
					<i class="layui-icon"></i>选择图片
				</button>
				<div class='layui-input-block' id='div_prev' title=''></div>
				<div id='prevModal'>
					<img id='img_prev'/>
				</div>
			</div>
		</div>


		<div class="layui-form-item layui-hide">
			<button class="layui-btn" lay-submit lay-filter="LAY-user-role-submit" id="LAY-user-role-submit">提交</button>
		</div>

	</div>

<script src="../layuiadmin/layui/layui.js"></script>
<script>
	layui.config({
		base: '../layuiadmin/' //静态资源所在路径
	}).extend({
		index: 'lib/index' //主入口模块
	}).use(['index', 'set']);

	layui.use(['upload', 'layer'], function () {
		var upload = layui.upload, layer = layui.layer, $ = layui.jquery;
		var uploadInst = upload.render({
			elem: '#test1', //绑定元素
			accept: 'images', //允许上传的文件类型
			//multiple: true, //允许多文件上传
			auto: false, //选完文件后不要自动上传
			bindAction: '#LAY-user-role-submit', //指定一个按钮触发上传
			url: '/StopCard/updateAdImg?adid=' + $("#adid").val(), //上传接口
			choose: function (obj) {
				// var files = obj.pushFile(); //将每次选择的文件追加到文件队列

				//图像预览，如果是多文件，会逐个添加。(不支持ie8/9)
				obj.preview(function (index, file, result) {
					var imgobj = new Image(); //创建新img对象
					imgobj.src = result; //指定数据源
					imgobj.className = 'thumb';
					imgobj.onclick = function (result) {
						//单击预览
						img_prev.src = this.src;
						var w = $(window).width() - 42, h = $(window).height() - 42;
						layer.open({
							title: '预览',
							type: 1,
							area: [w, h], //宽高
							content: $('#prevModal')
						});
					};
					document.getElementById("div_prev").appendChild(imgobj); //添加到预览区域
				});
			},
			done: function (res) {
				if(eval(res)===200){
					layer.msg("修改成功！")
				}else{
					layer.msg("修改失败！")
				}
				//上传完毕回调
			},
			error: function () {
				//请求异常回调
				layer.msg("请求可能出了点问题，请重试或联系管理员！")
			}
		});
	});


</script>
</body>
</html>
