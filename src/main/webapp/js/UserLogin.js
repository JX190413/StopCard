

//登录
function userLogin() {

var username1=	 $("#username1").val();
	var userpass1=	$("#userpass1").val();

	if(username1.length>0&userpass1>0){
		$("#userLogin").submit();
	}else {

       alert("账号密码不能为空")
	}




}
//注册
function userRegist() {

	alert($("#username").val());
	alert($("#userpass").val());
	$("#userRegist").submit();

}
//手机查询是否注册
function  selectPhone() {
     var userphone=$("#userphone1").val();

     var ob={userphone:userphone};


	$.ajax({
		type:"POST",//提交的方式
		url:"/StopCard/selectPhone",//提交的地址
		data:ob,//提交的数据
		dataType:"json",//希望返回的数据类型
		async: true,//异步操作
		success:function (data) {//成功的方法  msg为返回数据

			if(data.msg==="1"){
				$("#flage").val("true");
			}else

			if(data.msg==="2"){
				alert("该手机还没有注册");
				$("#flage").val("false");
			}
		},
		error:function () {//错误的方法
			alert("服务器正忙")
		}
	});










}
//提交验证码

function phoneMsg() {
	alert("进来了吗");

var phone=	$("#userphone1").val();
var phoneMsg=	$("#phoneMsg").val();
	if(phone.length>0&&phoneMsg>0){

		var ob = {phonenum:phone,msg:phoneMsg};

		$.ajax({
			type: "POST",//提交的方式
			url: "/StopCard/selectPhoneMsg",//提交的地址
			data: ob,//提交的数据
			dataType: "json",//希望返回的数据类型
			async: true,//异步操作
			success: function (data) {//成功的方法  msg为返回数据

				if (data.flage === true) {
					alert("登录成功")
                   $("#username1").val(data.username);
					$("#userpass1").val(data.userpass);
					$("#userLogin").submit()



				} else if (data.flage === false) {
					alert("登录失败，验证码不正确");

				}
			},
			error: function () {//错误的方法
				alert("服务器正忙")
			}
		})









	}





}