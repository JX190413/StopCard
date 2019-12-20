<%--
  Created by IntelliJ IDEA.
  User: 14506
  Date: 2019/12/18
  Time: 16:47
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

					<div class="layui-form" lay-filter="">
						<div class="layui-form-item">
							<label class="layui-form-label">我的角色</label>
							<div class="layui-input-inline">
								<select name="role" lay-verify="">
									<option value="1" selected>超级管理员</option>
									<option value="2" disabled>普通管理员</option>
									<option value="3" disabled>审核员</option>
									<option value="4" disabled>编辑人员</option>
								</select>
							</div>
<%--							<div class="layui-form-mid layui-word-aux">广告名称</div>--%>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">广告名称</label>
							<div class="layui-input-inline">
								<input type="text" name="adname"  readonly class="layui-input">
							</div>
<%--							<div class="layui-form-mid layui-word-aux">不可修改。一般用于后台登入名</div>--%>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">广告介绍</label>
							<div class="layui-input-inline">
								<input type="text" name="admsg"  lay-verify="nickname" autocomplete="off"  class="layui-input">
							</div>
						</div>

						<div class="layui-form-item">
							<label class="layui-form-label">广告图片</label>
							<div class="layui-input-inline">
								<input name="avatar" lay-verify="required" id="LAY_avatarSrc" placeholder="图片地址"  class="layui-input">
							</div>
							<div class="layui-input-inline layui-btn-container" style="width: auto;">
								<button type="button" class="layui-btn layui-btn-primary" id="LAY_avatarUpload">
									<i class="layui-icon">&#xe67c;</i>上传图片
								</button>
								<button class="layui-btn layui-btn-primary" layadmin-event="avartatPreview">查看图片</button >
							</div>
						</div>
						<div class="layui-form-item">
							<div class="layui-inline">
								<label class="layui-form-label">投放时间</label>
								<div class="layui-input-inline">
									<input type="text" class="layui-input" id="date1" placeholder="yyyy-MM-dd">
								</div>
							</div>
							<div class="layui-inline">
								<label class="layui-form-label">至</label>
								<div class="layui-input-inline">
									<input type="text" class="layui-input" id="date2" placeholder="yyyy-MM-dd">
								</div>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">手机</label>
							<div class="layui-input-inline">
								<input type="text" name="cellphone" value="" lay-verify="phone" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">邮箱</label>
							<div class="layui-input-inline">
								<input type="text" name="email" value="" lay-verify="email" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item layui-form-text">
							<label class="layui-form-label">备注</label>
							<div class="layui-input-block">
								<textarea name="remarks" placeholder="请输入内容" class="layui-textarea"></textarea>
							</div>
						</div>
						<div class="layui-form-item">
							<div class="layui-input-block">
								<button class="layui-btn" lay-submit lay-filter="setmyinfo">确认修改</button>
								<button type="reset" class="layui-btn layui-btn-primary">重新填写</button>
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
	layui.use('laydate', function () {
		var laydate = layui.laydate;

		//常规用法
		laydate.render({
			elem: '#date1'
		});
		laydate.render({
			elem: '#date2'
		});
	})
</script>
<script>
	layui.config({
		base: '../layuiadmin/' //静态资源所在路径
	}).extend({
		index: 'lib/index' //主入口模块
	}).use(['index', 'set']);
</script>
</body>
</html>
