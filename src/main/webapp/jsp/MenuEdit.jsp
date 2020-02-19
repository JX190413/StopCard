<%--
  Created by IntelliJ IDEA.
  User: 14506
  Date: 2019/12/8
  Time: 11:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>添加角色</title>
	<script src="../js/jquery-3.4.1.js"></script>
	<link rel="stylesheet" href="../layui/css/layui.css" media="all">
	<%--	//zTree的js/css--%>
	<link rel="stylesheet" href="../css/zTreeStyle/zTreeStyle.css" media="all">
	<script type="text/javascript" src="../js/jquery.ztree.core.js"></script>
	<script type="text/javascript" src="../js/jquery.ztree.excheck.js"></script>
</head>
<body>

<div class="layui-form" lay-filter="layuiadmin-form-role" id="layuiadmin-form-role" style="padding: 20px 30px 0 0;">
	<div class="layui-form-item">
		<label class="layui-form-label"><span style="color: red">*</span>菜单名称</label>
		<div class="layui-input-block">
			<input type="text" name="menuname" id="menuname"  lay-verify="required" placeholder="请输入菜单名称" autocomplete="off" class="layui-input">
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">上级菜单</label>
		<div class="layui-input-block">
			<ul id="treeDemo" class="ztree" ></ul>
			<input type="hidden" name="father" id="father"  autocomplete="off" class="layui-input">
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">菜单连接</label>
		<div class="layui-input-block">
			<input type="text" name="menuurl" id="menuurl" placeholder="请输入菜单连接"  autocomplete="off" class="layui-input">
		</div>
	</div>
	<div class="layui-form-item" align="center" >
		(带<span style="color: red">*</span>为必填项)
	</div>
	<div class="layui-form-item layui-hide">
		<button class="layui-btn" lay-submit lay-filter="LAY-user-role-submit" id="LAY-user-role-submit">提交</button>
	</div>
	<input hidden id="menuid" >
</div>

<script src="../layui/layui.js" charset="utf-8"></script>
<script>

	function zTreeOnCheck(event, treeId, treeNode) {
		// alert(treeNode.tId + ", " + treeNode.name + "," + treeNode.checked);
		if(treeNode.checked){
			$("#father").val(treeNode.id)
		}else {
			$("#father").val("0")
		}

	}
	//
	var setting = {
		check: { //表示tree的节点在点击时的相关设置
			enable: true, //是否显示radio/checkbox
			autoCheckTrigger: false,
			chkStyle: "radio",//值为checkbox或者radio表示
			radioType:"all",
			chkboxType: {"Y": "", "N": ""}//表示父子节点的联动效果，不联动
		},

		data: {
			simpleData: {
				enable: true
			}
		},

		callback:{//zTree单选框选择回调
			onCheck:zTreeOnCheck
		}
	};

	//数据源
	var zNodes;

	var code;
	function setCheck() {
		var type = $("#level").attr("checked")? "level":"all";
		setting.check.radioType = type;
		showCode('setting.check.radioType = "' + type + '";');
		$.fn.zTree.init($("#treeDemo"), setting, zNodes);
	}
	function showCode(str) {
		if (!code) code = $("#code");
		code.empty();
		code.append("<li>"+str+"</li>");
	}


	$(function () {
		$.post("/StopCard/selectzTree", function (obj) {
			// console.log(obj.data);
			console.log(obj);
			for (var i = 0; i <obj.length ; i++) {
				if(eval($("#father" +
					"").val())===eval(obj[i].id)){
					obj[i]['checked']="true";
				}
			}
			console.log(obj);
			zNodes=obj;
			setCheck();
			$("#level").bind("change", setCheck);
			$("#all").bind("change", setCheck);
		});
	});

	layui.config({
		base: '../layuiadmin/' //静态资源所在路径
	}).extend({
		index: 'lib/index' //主入口模块
	}).use(['index', 'form'], function () {
		var $ = layui.$
			, form = layui.form;
	});
</script>
</body>
</html>
