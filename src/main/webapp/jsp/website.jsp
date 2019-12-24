<%--
  Created by IntelliJ IDEA.
  User: 14506
  Date: 2019/12/23
  Time: 16:15
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
				<div class="layui-card-header">网站设置</div>
				<div class="layui-card-body" pad15>

					<div class="layui-form" wid100 lay-filter="">
						<div class="layui-form-item">
							<label class="layui-form-label">网站名称</label>
							<div class="layui-input-block">
								<input type="text" name="sitename" value="layuiAdmin" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">网站域名</label>
							<div class="layui-input-block">
								<input type="text" name="domain" lay-verify="url" value="http://www.layui.com" class="layui-input">
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
						<div class="layui-form-item">
							<label class="layui-form-label">最大文件上传</label>
							<div class="layui-input-inline" style="width: 80px;">
								<input type="text" name="cache" lay-verify="number" value="2048" class="layui-input">
							</div>
							<div class="layui-input-inline layui-input-company">KB</div>
							<div class="layui-form-mid layui-word-aux">提示：1 M = 1024 KB</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">上传文件类型</label>
							<div class="layui-input-block">
								<input type="text" name="cache" value="png|gif|jpg|jpeg|zip|rar" class="layui-input">
							</div>
						</div>

						<div class="layui-form-item layui-form-text">
							<label class="layui-form-label">首页标题</label>
							<div class="layui-input-block">
								<textarea name="title" class="layui-textarea">layuiAdmin 通用后台管理模板系统</textarea>
							</div>
						</div>
						<div class="layui-form-item layui-form-text">
							<label class="layui-form-label">版权信息</label>
							<div class="layui-input-block">
								<textarea name="copyright" class="layui-textarea">© 2018 layui.com MIT license</textarea>
							</div>
						</div>
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
</script>
</body>
</html>