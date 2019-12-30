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
	<link rel="stylesheet" href=<%=cssPath+"style9.css" %>>
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
				<div class="peKb_active" data-delay="5" data-thumb="${Ad.get(0).adimg}">
					<a href="${Ad.get(0).adurl}" target="_blank"><img src="${Ad.get(0).adimg}" alt="17sucai" /></a>
					<h1>${Ad.get(0).admsg}</h1>
				</div>
				<div data-delay="5" data-thumb="${Ad.get(1).adimg}">
					<a href="${Ad.get(1).adurl}" target="_blank"><img src="img/blank.png" data-src="${Ad.get(1).adimg}" alt="17sucai" /></a>
					<h1>${Ad.get(1).admsg}</h1>
				</div>
				<div class="peKb_active" data-delay="5" data-thumb="${Ad.get(2).adimg}">
					<a href="${Ad.get(2).adurl}" target="_blank"><img src="${Ad.get(2).adimg}" alt="17sucai" /></a>
					<h1>${Ad.get(2).admsg}</h1>
				</div>
				<div data-delay="5" data-thumb="${Ad.get(3).adimg}">
					<a href="${Ad.get(3).adurl}" target="_blank"><img src="img/blank.png" data-src="${Ad.get(3).adimg}" alt="17sucai" /></a>
					<h1>${Ad.get(3).admsg}</h1>
				</div>
				<div class="peKb_active" data-delay="5" data-thumb="${Ad.get(4).adimg}">
					<a href="${Ad.get(4).adurl}" target="_blank"><img src="${Ad.get(4).adimg}" alt="17sucai" /></a>
					<h1>${Ad.get(4).admsg}</h1>
				</div>
				<div class="peKb_active" data-delay="5" data-thumb="${Ad.get(5).adimg}">
					<a href="${Ad.get(5).adurl}" target="_blank"><img src="${Ad.get(5).adimg}" alt="17sucai" /></a>
					<h1>${Ad.get(5).admsg}</h1>
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
					<div class="aui-well-hd" style="    /* margin: 11px; */
    padding-top: 44px;
    padding-left: -14px;
    margin-left: -88px;
width: 76px;
">
					<input type="text" style="border:none;" value="到期时间：${UserManagement.pasttime}" readonly="readonly">
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
						<div class="layui-input-block" style="padding-left: 100px">

							<input class="layui-btn" value="办理" onclick="xufei()">
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-input-block" style="padding-left:100px">
							<input class="layui-btn" value="续费" id="xufei2">
						</div>
					</div>
					<div class="layui-form-item">
						<div class="layui-input-block" style="padding-left:100px">
							<input class="layui-btn" value="退费"  id="tuifei">
						</div>
					</div>




				</div>
			</div>

		</section>
	</section>
</form>
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
					<tr>
						<td></td>
						<td><input type="text"  height="10px" style="border: none;height: 20px;background-color: white" disabled> </td>
					</tr>
					<tr>
						<td>余额：</td>
						<td><input   type="text" id="bance" name="userphone"  value="${UserManagement.balance}" ></td>
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
<div id="add-main" style="display: none;">
	<div class="layui-form-item center" >
		<label >到期时间:<label id="lable2"></label></label>
	</div>
	<div class="layui-form-item center" >
		<label >可退金额:<label id="lable3"></label></label><label>元</label>
	</div>
	<div class="layui-form-item">
		<div class="layui-input-block" style="padding-left: 85px">
			<button class="layui-btn" lay-submit lay-filter="save" onclick="tuifeia()" >确定退费</button>
		</div>
	</div>
</div>
<form class="layui-form" action="<%=path+"/alipay2"%>" method="post" id="xufei9" target="_blank">
	<div id="add-main2" style="display: none;">
		<div class="layui-form-item center" >
			<label >到期时间:<label id="lable8"></label></label>
			<label>车牌号:</label>
			<input type="text"  name="carnum" lay-verify="title" autocomplete="off"  class="layui-input" value="${UserManagement.carnum}" readonly="readonly">
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<c:forEach items="${combos}" var="combos">
					<div class="aui-grids" >
						<input type="radio"  name="time" value="${combos.combotime}"  title="${combos.combotime}:${combos.combomoney}元"   >
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block" style="padding-left: 70px">

				<input class="layui-btn" lay-submit lay-filter="save" onclick="xufeia()" value="续费" style="width: 100px">
			</div>
		</div>
	</div>
</form>

<div class="consult_contact">
	<div class="consult_wrap"><a href="jsp/text.jsp" rel="nofollow" target="_blank">
		<div class="tip" >Hello,欢迎来咨询~</div>
		<img src="img/ball.png" class="ball" alt="">
		<img src="img/bg_0.png" class="staff_img" alt="">
		<img src="img/bg_1.png" class="bg-1" alt="">
		<img src="img/bg_2.png" class="bg-2" alt="">
		<img src="img/bg_3.png" class="bg-3" alt=""></a>  </div>
</div>
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
<script>
	layui.use('layer', function(){ //独立版的layer无需执行这一句
		var layer = layui.layer;
//layer.msg("大家好，这是最简单的弹层", { time: 9000, type: 1,title:['测试一下','font-size:18px'] });
		$("#tuifei").click(function () {
			$.ajax({
				type:"POST",//提交7/的方式
				url:"<%=path+"/tuifei"%>",//提交的地址
				data:"carnum=${UserManagement.carnum}",//提交的数据
				/*	dataType:"text",//希望返回的数据类型*!/*/
				success:function (data) {
					var jsonStr = JSON.stringify(data);
					/*alert(msg);*/
					//成功的方法  msg为返回数据
					if (data.msg==="30"){
						$("#lable2").text(data.msg1);
						$("#lable3").text(data.msg2);
						layer.open({
							type: 1,
							area: ['500px', '300px'],
							content:  $("#add-main") //这里content是一个普通的String
						});
					}
					else {
						alert("您还未办理会员哦")
					}
				},
				error:function () {//错误的方法
					alert("服务器正忙")
				}
			});
		});
	});
	function tuifeia() {
		var money=$("#lable3").text();
		$.ajax({
			type:"POST",//提交的方式
			url:"/StopCard/tuifeia",//提交的地址
			data:"money="+money+"&carnum=${UserManagement.carnum}",//提交的数据
			/*dataType:"text",//希望返回的数据类型*/
			/*async: true,//异步操作*/
			success:function (data) {//成功的方法  msg为返回数据
				if(data.msg==="20"){
					$("#lable3").text("0");
					alert("退费成功");
					$("#bance").val(data.msg1);
					layer.closeAll();
				}
				else
				{
					alert("退费失败");
				}
			},
			error:function () {//错误的方法
				alert("服务器正忙")
			}
		});
	}
	$("#xufei2").click(function () {
		$.ajax({
			type:"POST",//提交7/的方式
			url:"<%=path+"/tuifei"%>",//提交的地址
			data:"carnum=${UserManagement.carnum}",//提交的数据
			/*	dataType:"text",//希望返回的数据类型*!/*/
			success:function (data) {
				var jsonStr = JSON.stringify(data);
				/*alert(msg);*/
				//成功的方法  msg为返回数据
				if (data.msg==="30"){
					alert(data.msg1);
					$("#lable8").text(data.msg1);
					layer.open({
						type: 1,
						area: ['500px', '300px'],
						content:  $("#add-main2") //这里content是一个普通的String
					});
				}
				else {
					alert("您还未办理会员哦")
				}
			},
			error:function () {//错误的方法
				alert("服务器正忙")
			}
		});
	});
	function xufeia() {
		var time=$("#add-main2 .layui-form-radioed").parent().find("input").val();
		/*var time=$("input[name='time']:checked").val();*/
		alert(time);
		$.ajax({
			type:"POST",//提交7/的方式
			url:"<%=path+"/xufei5"%>",//提交的地址
			data:"carnum=${UserManagement.carnum}&time="+time,//提交的数据
			/*	dataType:"text",//希望返回的数据类型*!/*/
			success:function (msg) {
				var jsonStr = JSON.stringify(msg);
				/*alert(msg);*/
				//成功的方法  msg为返回数据
				if (msg==="20"){
					alert("余额不足");
					$("#xufei9").submit();

				}
				else {
					alert("续费成功");
					layer.closeAll();
				}
			},
			error:function () {//错误的方法
				alert("服务器正忙")
			}
		});
	}

</script>
</html>