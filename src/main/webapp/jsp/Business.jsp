<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String layuicsspath = request.getContextPath()+"/layuiadmin/layui/css/";
	String layuistyle = request.getContextPath()+"/layuiadmin/style/";
	String layuipath = request.getContextPath()+"/layuiadmin/layui/";
	String path =application.getContextPath();
	String jsPath=request.getContextPath()+"/js/";
	String cssPath=request.getContextPath()+"/css/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Layui</title>
	<meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" name="viewport"/>
	<meta content="yes" name="apple-mobile-web-app-capable"/>
	<meta content="black" name="apple-mobile-web-app-status-bar-style"/>
	<meta content="telephone=no" name="format-detection"/>
<%--	<link rel="stylesheet" href="css/style.css" />--%>
	<link href=<%=cssPath+"style6.css"%> rel="stylesheet" type="text/css"/>
	<script type="text/javascript" src=<%=jsPath+"jquery.js" %>></script>
	<!--主要样式表-->

	<link rel="stylesheet" href=<%=jsPath+"pe.kenburns/themes/default/skin.min.css" %> />

	<script type="text/javascript" src=<%=jsPath+"jquery-1.5.2.min.js" %>></script>
	<script type="text/javascript" src=<%=jsPath+"pe.kenburns/jquery.pixelentity.kenburnsslider.min.js" %>></script>

	<script>
		$(function($){
			$(".peKenBurns").peKenburnsSlider({externalFont:true})
		})
	</script>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel="stylesheet" href=<%=layuicsspath+"layui.css"%>>
	<link rel="stylesheet" href=<%=cssPath+"bootstrap.css" %>>

	<script type="text/javascript" src="<%=layuipath+"layui.all.js"%>"></script>
	<script type="text/javascript" src="<%=layuipath+"layui.js"%>"></script>
	<script type="text/javascript" src=<%=jsPath+"jquery-3.4.1.js" %>></script>
	<script  src=<%=jsPath+"bootstrap.js"%>></script>
	<!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->

</head>
<body>
<%--车牌号:<input name="carnum" value="${UserManagement.carnum}" disabled="disabled">--%>
<form class="layui-form" action="<%=path+"/alipay1"+"?type=jiaofei"%>" method="post" target="_blank" id="banli" >

<%--	广告页--%>
	<div id="annotation">
		<div id="wrapper" class="container_16">
			<!--start peKenBurns slider-->
			<div class="peKenBurns peNoJs" data-autopause="image" data-thumb="enabled" data-mode="kb" data-controls="always" data-shadow="enabled" data-logo="enabled">
				<div class="peKb_active" data-delay="5" data-thumb="img/thumbs/kb_00.jpg">
					<a href="http://www.17sucai.com/" target="_blank"><img src="img/kb_00.jpg" alt="17sucai" /></a>
					<h1>HI &amp; WELCOME TO THE "ESTRO" SLIDER BY PIXELENTITY</h1>
				</div>
				<div data-delay="5" data-thumb="img/thumbs/kb_01.jpg">
					<a href="http://www.17sucai.com/" target="_blank"><img src="img/blank.png" data-src="img/kb_01.jpg" alt="17sucai" /></a>
					<h1>A KICK-ASS JQUERY PLUGIN WITH KEN BURNS &amp; 2-WAY SWIPE TRANSITIONS</h1>
				</div>
				<div class="peKb_active" data-delay="5" data-thumb="img/thumbs/kb_02.jpg">
					<a href="http://www.17sucai.com/" target="_blank"><img src="img/kb_02.jpg" alt="17sucai" /></a>
					<h1>HI &amp; WELCOME TO THE "ESTRO" SLIDER BY PIXELENTITY</h1>
				</div>
				<div data-delay="5" data-thumb="img/thumbs/kb_03.jpg">
					<a href="http://www.17sucai.com/" target="_blank"><img src="img/blank.png" data-src="img/kb_03.jpg" alt="17sucai" /></a>
					<h1>A KICK-ASS JQUERY PLUGIN WITH KEN BURNS &amp; 2-WAY SWIPE TRANSITIONS</h1>
				</div>
				<div class="peKb_active" data-delay="5" data-thumb="img/thumbs/kb_04.jpg">
					<a href="http://www.17sucai.com/" target="_blank"><img src="img/kb_04.jpg" alt="17sucai" /></a>
					<h1>HI &amp; WELCOME TO THE "ESTRO" SLIDER BY PIXELENTITY</h1>
				</div>
				<div class="peKb_active" data-delay="5" data-thumb="img/thumbs/kb_05.jpg">
					<a class="video hd autoplay loop skiptonext" href="http://www.17sucai.com/"><img src="img/blank.png" data-src="img/kb_05.jpg" alt="17sucai" /></a>
					<h1>A KICK-ASS JQUERY PLUGIN WITH KEN BURNS &amp; 2-WAY SWIPE TRANSITIONS</h1>
				</div>
			</div>
			<!--end peKenBurns slider -->
		</div>
		<!--end wrapper-->
	</div>

<%--下面的是业务办理界面--%>
	<section class="aui-flexView">
		<section class="aui-scrollView">
			<div class="aui-recharge-box">
				<div class="aui-recharge-iphone">
					<div class="aui-well-bd">
						<p style="font-size: 25px;">
							车牌号:</em>
						</p>
						<p>
							<input type="text" style="font-size: 20px;text-align: center" name="carnum" lay-verify="title" autocomplete="off"  class="layui-input" value="${UserManagement.carnum}" readonly="readonly">
						</p>

					</div>
					<div class="aui-well-hd">
						<input  type="button" class="layui-btn"  data-toggle="modal" data-target="#myModal" style="margin-right: 53px"  value="个人信息">
<%--						<img src="images/icon-mem.png"  alt="">--%>
					</div>
				</div>
                 <br>
				<br>
				<br>
				<br>
				<div class="aui-cell-box">
					<p style="font-size: 25px;font-family: 黑体">办理车费业务:</p>

					<div class="layui-row">
						<div class="layui-form-item">

							<div class="layui-input-block" style="padding-left: 100px">

								<c:forEach items="${combos}" var="combos">
									<div class="aui-grids" style="    position: relative;overflow: hidden; width: 157px;margin: 12px;">
									<input type="radio" style="font-size: 18px" class="aui-grids-item this-card" name="time" value="${combos.combotime}"  title="${combos.combotime}:${combos.combomoney}元" checked="" >
									</div>
										</c:forEach>
							</div>
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-input-block" style="padding-left: 250px">

							<input class="layui-btn" value="办理"  onclick="xufei()">
						</div>
					</div>



</div>
			</div>
</section>
	</section>

<%--	<div class="layui-row">--%>
<%--		<div class="layui-form-item">--%>
<%--&lt;%&ndash;			<div class="layui-col-xs6">&ndash;%&gt;--%>
<%--&lt;%&ndash;				<div class="grid-demo grid-demo-bg1" style="font-size: 20px;font-style: italic;padding-left: 50px"></div>&ndash;%&gt;--%>
<%--&lt;%&ndash;			</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;			<div class="layui-form-item">&ndash;%&gt;--%>
<%--&lt;%&ndash;				<label class="layui-form-label">车牌号</label>&ndash;%&gt;--%>
<%--&lt;%&ndash;				<div class="layui-input-block">&ndash;%&gt;--%>
<%--&lt;%&ndash;					<input type="text" name="carnum" lay-verify="title" autocomplete="off"  class="layui-input" value="${UserManagement.carnum}">&ndash;%&gt;--%>
<%--&lt;%&ndash;				</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;			</div>&ndash;%&gt;--%>

<%--			<c:set var="now" value="<%=new java.util.Date()%>" />--%>
<%--			<div class="layui-col-xs6">--%>
<%--				<div class="grid-demo" style="font-size: 20px;font-style: italic;padding-left: 50px">办理时间:   <label ><fmt:formatDate type="date" value="${now}"/></label></div>--%>
<%--			</div>--%>
<%--		</div>--%>
<%--	</div>--%>
<%--<div class="layui-fluid"style="padding-top: 100px;padding-left: 100px">--%>
<%--	<div class="layui-row">--%>
<%--			<div class="layui-form-item">--%>
<%--				<label class="layui-form-label" style="font-size: 20px;font-style: italic;padding-left: 100px">月缴办理</label>--%>
<%--				<div class="layui-input-block" style="padding-left: 100px">--%>
<%--					<c:forEach items="${combos}" var="combos">--%>
<%--						<input type="radio" name="time" value="${combos.combotime}"  title="${combos.combotime}:${combos.combomoney}元" checked="" >--%>
<%--					</c:forEach>--%>
<%--			</div>--%>
<%--	</div>--%>
<%--</div>--%>
<%--	<div class="layui-form-item">--%>
<%--		<div class="layui-input-block" style="padding-left: 250px">--%>
<%--		&lt;%&ndash;<input type="submit" value="提交" class="layui-btn" >&ndash;%&gt;--%>
<%--		&lt;%&ndash;<button class="layui-btn" lay-submit lay-filter="formDemo" >办理</button>&ndash;%&gt;--%>
<%--			<input class="layui-btn" value="办理"  onclick="xufei()"></input>--%>
<%--	</div>--%>
<%--	</div>--%>
<%--	</div>--%>
	<!-- 车主个人信息模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" id="myModalLabel">
						车主个人信息
					</h4>
				</div>
				<div class="modal-body">

					<table style="width:300px;border: 1px;" align="center"  cellpadding="8" cellspacing="0">
						<tr>

							<td>车主姓名:</td>
							<input type="hidden" id="userid" name="userid" value="${UserManagement.userid}">
							<input type="hidden" id="flage" name="flage" value="false">
							<td><input type="text" id="username" name="username" value="${UserManagement.username}"   readonly="readonly"></td>
						</tr>
						<tr>
							<td></td>
							<td><input type="text" height="10px" style="border: none;height: 20px;background-color: white" disabled> </td>
						</tr>
						<tr>
							<td>旧密码:</td>
							<td><input type="password"   id="userpass" name="userpass" value="" onblur="Verification()"></td>
						</tr>
						<tr>
							<td></td>
							<td><input type="text"  height="10px" style="border: none;height: 20px;background-color: white" disabled> </td>
						</tr>
						<tr>
							<td>新密码:</td>
							<td><input   type="password" id="newuserpass" name="newuserpass"  value=""></td>
						</tr>
						<tr>
							<td></td>
							<td><input type="text"  height="10px" style="border: none;height: 20px;background-color: white" disabled> </td>
						</tr>
						<tr>
							<td>车牌号：</td>
							<td><input   type="text" id="carnum" name="carnum"  value="${UserManagement.carnum}"></td>
						</tr>
						<tr>
							<td></td>
							<td><input type="text"  height="10px" style="border: none;height: 20px;background-color: white" disabled> </td>
						</tr>
						<tr>
							<td>车主地址：</td>
							<td><input   type="text" id="useraddress" name="useraddress"  value="${UserManagement.useraddress}" readonly="readonly"></td>
						</tr>
						<tr>
							<td></td>
							<td><input type="text"  height="10px" style="border: none;height: 20px;background-color: white" disabled> </td>
						</tr>
						<tr>
							<td>手机号：</td>
							<td><input   type="text" id="userphone" name="userphone"  value="${UserManagement.userphone}" ></td>
						</tr>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
					<button type="button" class="btn btn-primary" onclick="UserManage()">
						提交更改
					</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>



</form>

</body>
<script>
	layui.use('form', function(){
		var form = layui.form; //只有执行了这一步，部分表单元素才会自动修饰成功
		//但是，如果你的HTML是动态生成的，自动渲染就会失效
		//因此你需要在相应的地方，执行下述方法来进行渲染
		form.render();
		// form.on('submit(formDemo)', function(data){
		// 	alert(JSON.stringify(data.field));
		// 	// layer.msg(JSON.stringify(data.field));
		// 	return false;
		// });

	});




	function xufei() {
		$.ajax({
			type:"POST",//提交7/的方式
			url:"<%=path+"/selhuiyuan"%>",//提交的地址
			data:"carnum=${UserManagement.carnum}",//提交的数据
		/*	dataType:"text",//希望返回的数据类型*!/*/
			success:function (msg) {
				var jsonStr = JSON.stringify(msg);
				//成功的方法  msg为返回数据
				if (jsonStr==='"30"'){
					alert("已办理,请续费")
				}
				else if (jsonStr==='"20"') {
					alert(888);
					$("#banli").submit();
				}
			},
			error:function () {//错误的方法
				alert("办理失败")
			}
		});
		/*$("#banli").submit();*/
	}

	function Verification() {
		var userpass=$("#userpass").val();
		var userid=$("#userid").val();
		var ob = {userid:userid,userpass:userpass};

		$.ajax({
			type:"POST",//提交的方式
			url:"/StopCard/selectPass",//提交的地址
			data:ob,//提交的数据
			dataType:"json",//希望返回的数据类型
			async: true,//异步操作
			success:function (data) {//成功的方法  msg为返回数据

                   if(data.msg==="1"){
	                   $("#flage").val("true");
                   }else

				if(data.msg==="2"){
					alert("旧密码错误");
				$("#flage").val("false");
				}
			},
			error:function () {//错误的方法
				alert("服务器正忙")
			}
		});





	}



	function UserManage() {
       var userid=  $("#userid").val();
		var userpass=$("#newuserpass").val();
		var carnum=  $("#carnum").val();
		var useraddress=  $("#useraddress").val();
		var userphone=  $("#userphone").val();
		var flage=  $("#flage").val();
		if(flage==="true"){

			var ob = {userid:userid,userpass:userpass,carnum:carnum,useraddress:useraddress,userphone:userphone};

			$.ajax({
				type:"POST",//提交的方式
				url:"/StopCard/updatePass",//提交的地址
				data:ob,//提交的数据
				dataType:"json",//希望返回的数据类型
				async: true,//异步操作
				success:function (data) {//成功的方法  msg为返回数据

					if(data.msg==="1"){
						alert("修改成功")

					}else

					if(data.msg==="2"){
						alert("修改失败");

					}
				},
				error:function () {//错误的方法
					alert("服务器正忙")
				}
			});







		}else {

			alert("你的旧密码还是错的哦")
		}



        alert(userid);

	}




</script>
<script type="text/javascript" src=<%=layuipath+"layui.js"%>></script>
</html>