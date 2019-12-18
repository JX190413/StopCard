<%--
  Created by IntelliJ IDEA.
  User: 14506
  Date: 2019/12/14
  Time: 12:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="../layuiadmin/layui/css/layui.css" media="all">
<script src="../layuiadmin/layui/layui.js"></script>
<html>
<head>
	<title>Title</title>
</head>
<body>

<blockquote class="layui-elem-quote">为节省服务器开销，以下示例均未配置真实上传接口，所以每次上传都会报提示：请求上传接口出现异常，这属于正常现象。</blockquote>

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
	<legend>常规使用：普通图片上传</legend>
</fieldset>

<div class="layui-upload">
	<button type="button" class="layui-btn" id="test1">上传图片</button>
	<div class="layui-upload-list">
		<img class="layui-upload-img" id="demo1">
		<p id="demoText"></p>
	</div>
</div>


<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
	layui.use('upload', function () {
		var $ = layui.jquery
			, upload = layui.upload;

		//普通图片上传
		var uploadInst = upload.render({
			elem: '#test1'
			, url: '/StopCard/cardIn'
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
