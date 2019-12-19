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
	<link rel="stylesheet" href="../layuiadmin/layui/css/layui.css" media="all">
	<link rel="stylesheet" href="../layuiadmin/style/admin.css" media="all">
</head>
<body>

<div class="layui-fluid">
	<div class="layui-row layui-col-space15">
		<div class="layui-col-md12">
			<div class="layui-card">
				<div class="layui-card-header">添加广告</div>
				<div class="layui-card-body" pad15>

					<div class="layui-form" wid100 lay-filter="">
						<div class="layui-form-item">
							<label class="layui-form-label">广告名称</label>
							<div class="layui-input-block">
								<input type="text" name="sitename" value="layuiAdmin" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">缓存时间</label>
							<div class="layui-input-inline" style="width: 80px;">
								<input type="text" name="cache" lay-verify="number" value="0" class="layui-input">
							</div>
							<div class="layui-input-inline layui-input-company">分钟</div>
							<div class="layui-form-mid layui-word-aux">本地开发一般推荐设置为 0，线上环境建议设置为 10。</div>
						</div>


						<div class="layui-form-item layui-form-text">
							<label class="layui-form-label">广告介绍</label>
							<div class="layui-input-block">
								<textarea name="admsg" class="layui-textarea">layuiAdmin 通用后台管理模板系统</textarea>
							</div>
						</div>
						<div class="layui-form-item">
							<div class="layui-upload">
								<button type="button" class="layui-btn" id="test1">上传图片</button>
								<div class="layui-upload-list">
									<img class="layui-upload-img" id="demo1">
									<p id="demoText"></p>
								</div>
							</div>
						</div>

<%--						<div class="layui-form-item layui-form-text">--%>
<%--							<label class="layui-form-label">META关键词</label>--%>
<%--							<div class="layui-input-block">--%>
<%--								<textarea name="keywords" class="layui-textarea" placeholder="多个关键词用英文状态 , 号分割"></textarea>--%>
<%--							</div>--%>
<%--						</div>--%>
<%--						<div class="layui-form-item layui-form-text">--%>
<%--							<label class="layui-form-label">META描述</label>--%>
<%--							<div class="layui-input-block">--%>
<%--								<textarea name="descript" class="layui-textarea">layuiAdmin 是 layui 官方出品的通用型后台模板解决方案，提供了单页版和 iframe 版两种开发模式。layuiAdmin 是目前非常流行的后台模板框架，广泛用于各类管理平台。</textarea>--%>
<%--							</div>--%>
<%--						</div>--%>
<%--						<div class="layui-form-item layui-form-text">--%>
<%--							<label class="layui-form-label">版权信息</label>--%>
<%--							<div class="layui-input-block">--%>
<%--								<textarea name="copyright" class="layui-textarea">© 2018 layui.com MIT license</textarea>--%>
<%--							</div>--%>
<%--						</div>--%>
						<div class="layui-form-item">
							<div class="layui-input-block">
								<button class="layui-btn" lay-submit lay-filter="set_website">确认保存</button>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
</div>

<script src="../layuiadmin/layui/layui.js"></script>
<script>
	layui.config({
		base: '../layuiadmin/' //静态资源所在路径
	}).extend({
		index: 'lib/index' //主入口模块
	}).use(['index', 'set']);

	layui.use('upload', function () {
		var $ = layui.jquery
			, upload = layui.upload;

		//普通图片上传
		var uploadInst = upload.render({
			elem: '#test1'
			, url: ''
			, before: function (obj) {
				//预读本地文件示例，不支持ie8
				obj.preview(function (index, file, result) {
					$('#demo1').attr('src', result); //图片链接（base64）
				});
			}
			, done: function (res) {
				//如果上传失败
				if (res.code == 0) {
					return layer.msg("上传失败！")
				}
				if (res.code > 0) {
					console.log(res.msg);
					layer.msg(res.msg);
					//	return layer.msg("上传成功！")
				}
				//上传成功
			}
			, error: function () {
				//演示失败状态，并实现重传
				var demoText = $('#demoText');
				demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
				demoText.find('.demo-reload').on('click', function () {
					uploadInst.upload();
				});
			}
		});


	});
</script>
</body>
</html>
