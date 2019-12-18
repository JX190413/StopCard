function login() {
     alert("这里");
   var name= $("#workeraccount").val();
   alert(name);
    var pass= $("#workerpass").val();
	alert(pass);
   if(name.length>0 &&  pass.length>0){

    $("#Loginform").submit();

   }else {

       alert("账号密码不能为空");
   }







}