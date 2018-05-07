<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <meta content="webkit" name="renderer">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>重制密码</title>
    <link rel="stylesheet" type="text/css" href="./css/index.css">
    <link rel="stylesheet" type="text/css" href="./css/reset.css">

    <link type="text/css" rel="stylesheet" href="./css/common-header-2c_44ba6b0a.css">
    <link type="text/css" rel="stylesheet" href="./css/org-navbar-white_3f549bfd.css">
    <link type="text/css" rel="stylesheet" href="./css/global-min_93d8a1e2.css">
    <!-- Bootstrap CSS -->
    <link href="./css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery -->
    <script src="./js/jquery.js"></script>
    <!-- Bootstrap JavaScript -->
    <script src="./js/bootstrap.min.js"></script>
    	<script type="text/javascript" src="static/js/common/common.js"></script>
    <script type="text/javascript">
$(function() {
	$("#submit").click(function(){
		var uid=$("#uid").val();
		var t=/^1[0-9]{10}$/;
		if(!t.test(uid)){
			alert('账号不正确');
			return ;
		}
		var validateCode_write = $("#validateCode").val();
		if(validateCode_write!=validateCode){
			alert('验证码有误');
			return ;
		}
		var password = $("#password").val();
		var repassword = $("#repassword").val();
		if(password==""){
			alert('请输入密码');
			return ;
		}
		if(password!=repassword){
			alert('两次输入的密码不一致');
			return ;
		}
		$.ajax({
			 url: "resetPassword",
			 type: "POST",
			 data:'uid='+uid+'&password='+password,
			 success: function(data){
				 if(data.code==200){
					 alert("密码重置成功")
					 window.location.reload();
				 }
			 },
			 dataType : "json"
		});
	})
	var validateCode="";
	var InterValObj; //timer变量，控制时间
	var count = 60; //间隔函数，1秒执行
	var curCount;//当前剩余秒数
	$("#send").click(function(){
		var uid=$("#uid").val();
		if(uid==""){
			alert('账号不正确');
			return ;
		}
		curCount = count;
		//设置button效果，开始计时
		$("#send").attr("disabled", "true");
		$("#send").val("请在" + curCount + "秒内输入验证码");
		InterValObj = window.setInterval(SetRemainTime, 1000); //启动计时器，1秒执行一次
		$.ajax({
			 url: "getCodeForReset",
			 type: "POST",
			 data:'userphone='+uid,
			 success: function(data){
				 validateCode = data.code;
				/* $("#send").attr("disabled","disabled"); */
			},
			dataType : "json"
		});
	})
	
	//timer处理函数
	function SetRemainTime() {
      if (curCount == 0) {        
        window.clearInterval(InterValObj);//停止计时器
        $("#send").removeAttr("disabled");//启用按钮
        $("#send").val("重新发送验证码");
      }
      else {
        curCount--;
        $("#send").val("请在" + curCount + "秒内输入验证码");
      }
    }
    
})
</script>
</head>

<body>
    <%@include file="header.jsp" %>
    <div class="container">
        <div class="panel panel-default">
            <div class="panel-body">
                <div  class="form-horizontal" >
                    <div class="form-group">
                        <legend>重制你的密码</legend>
                    </div>
                    <div class="form-group">
                        <label for="phone" class="col-sm-3 col-md-1 control-label">手机号</label>
                        <div class="col-sm-3">
                            <input type="text" name="uid" id="uid" class="form-control" required="required">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email" class="col-sm-3 col-md-1 control-label">验证码</label>
                        <div class="col-sm-3">
                            <input type="text" name="validateCode" id="validateCode" class="form-control">
                        </div>
                        <div class="col-sm-2">
                            <input type="button" id="send" class="form-control" value="发送验证码" >
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-3 col-md-1 control-label">新密码</label>
                        <div class="col-sm-3">
                            <input type="password" name="password" id="password" class="form-control" required="required">
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-3 col-md-1 control-label">确认新密码</label>
                        <div class="col-sm-3">
                            <input type="password" name="repassword" id="repassword" class="form-control" required="required">
                        </div>
                    </div>
                    <div class="form-group submit">
                        <div class="col-sm-1 col-sm-offset-2">
                            <button type="submit" class="btn btn-primary"   id="submit">提交</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--页尾-->
    <%@include file="footer.jsp" %>
</body>

</html>