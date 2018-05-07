<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta content="webkit" name="renderer">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>个人信息</title>
    <link rel="stylesheet" type="text/css" href="./css/index.css">
    <link rel="stylesheet" type="text/css" href="./css/account.css">
    <link rel="stylesheet" type="text/css" href="./css/city-picker.css">

    <link type="text/css" rel="stylesheet" href="./css/common-header-2c_44ba6b0a.css">
    <link type="text/css" rel="stylesheet" href="./css/org-navbar-white_3f549bfd.css">
    <link type="text/css" rel="stylesheet" href="./css/global-min_93d8a1e2.css">
    <!-- Bootstrap CSS -->
    <link href="./css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript">
   
    </script>
</head>

<body onload="getMyInfo()">
<%@include file="top_parent.jsp" %>
    <div class="container clearfix">
        <header class="personal-header">
            <div class="head-img">
                <img src="" alt="头像" id="headImg">
                <label class="head-img-mask" for="fileinput-button">上传头像
                    <input type="file" name="headImg" accept="image/*" id="fileinput-button" form="form">
                </label>
            </div>
            <div class="head-user">
                <h3 id="username"></h3>
            </div>
        </header>
        <div class="personal-sidebar">
            <ul>
                <li class="active"><a href="#">我的课程</a></li>
                <!-- <li><a href="#">个人信息</a></li>
                <li><a href="#">我的笔记</a></li>
                <li><a href="#">修改密码</a></li> -->
            </ul>
        </div>
        <div class="personal-main">
            <div class="option-page">
                <div class="personal-course">
                    <table class="table table-bordered table-hover table-striped" id="list">
                        <thead>
                            <tr>
                                <th>编号</th>
                                <th>课程名称</th>
                                <th>价格</th>
                                <th>主讲人</th>
                                <th>已购人数</th>
                            </tr>
                        </thead>
                    </table>
                </div>
                <div class="personal-setting" style="display: none;">
                    <legend>个人资料</legend>
                    </legend>
                    <form class="common-info form-horizontal" id="form" role="form" action="updateMyInfo" method="post" enctype="multipart/form-data">
                        <div class="form-group">
                            <label for="user-phone" class="control-label col-md-2">电话</label>
                            <div class="col-md-5">
                                <input type="text" class="form-control tel" id="user-phone" disabled="disabled">
                                <input type="hidden"  id="user-phone1" name="uid1">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="user-nickname" class="control-label col-md-2">昵称</label>
                            <div class="col-md-5">
                                <input type="text" class="form-control" id="user-nickname" name="teacherName">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-2">性别</label>
                            <div class="radio col-md-5">
                                <label>
                                    <input type="radio" name="sex"  value="1" id="nan">男
                                </label>
                                <label>
                                    <input type="radio" name="sex"  value="0" id="nv">女
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="user-address" class="control-label col-md-2">地址</label>
                            <div class="col-md-5" style="position: relative;">
                                <input id="user-address" name="address" class="form-control" readonly type="text" value="" data-toggle="city-picker">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-2">年级</label>
                            <div class="col-md-5">
                                <select name="grade" class="form-control" required="required" name="grade">
                                    <option value="1" id="gaoyi">高中</option>
                                    <option value="2" id="gaoer">初中</option>
                                    <option value="3" id="gaosan">小学</option>
                                </select>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary col-md-2 col-md-offset-3">提交</button>
                    </form>
                </div>
                <div class="personal-note" style="display: none;">
                    <table class="table table-bordered table-hover table-striped" id="notelist">
                        <thead>
                            <tr>
                                <th>编号</th>
                                <th>笔记内容</th>
                                <th>笔记来源</th>
                                <th>提交时间</th>
                            </tr>
                        </thead>
                    </table>
                </div>
                <div class="passwd-change" style="display: none;">
                    <form role="form" class="form-horizontal" action="updateMyPassword" id="form1" method="post" enctype="multipart/form-data">
                        <legend>修改密码</legend>
                        <div class="form-group">
                            <input type="hidden"  id="user-phone2" name="uid1">
                        </div>
                        <div class="form-group">
                            <label for="changed-passwd" class="control-label col-md-2">新密码</label>
                            <div class="col-md-5">
                                <input type="password" class="form-control" id="changed-passwd" placeholder="请输入新密码" name="password">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="repeat-change" class="control-label col-md-2">确认新密码</label>
                            <div class="col-md-5">
                                <input type="password" class="form-control" id="repeat-change" placeholder="请确认新密码">
                            </div>
                        </div>
                    </form>
                        <button onclick="check()" class="btn btn-primary col-md-2 col-md-offset-3">保存</button>
                </div>
            </div>
        </div>
    </div>
<%@include file="footer.jsp" %>
    <!-- jQuery -->
    <script src="./js/jquery.js"></script>
    <!-- Bootstrap JavaScript -->
    <script src="./js/bootstrap.min.js"></script>
    <script src="./js/city-picker.data.js"></script>
    <script src="./js/city-picker.js"></script>
    <script>
    var address="";
    function getMyInfo(){
    	var data = "{'uid':'"+<%=request.getSession().getAttribute("child")%>+"'}"
    	$.ajax({
    			url : "getMyInfo",
    			type : "POST",
    			data : 'data='+data,
    			success : function(data) {
    				if (data.code == 200) {
    					$("#username").append(data.info.nickName);
    					$("#user-phone").attr("value",data.info.uid);
    					$("#user-phone1").attr("value",data.info.uid);
    					$("#user-phone2").attr("value",data.info.uid);
    					$("#user-nickname").attr("value",data.info.nickName);
    					if(data.info.grade==1){
    						$("#gaoyi").attr("selected","selected");
    					 }else if(data.info.grade==2){
    						$("#gaoer").attr("selected",true);
    					}else{
    						$("#gaosan").attr("selected",true);
    					}
    					if(data.info.sex==0){
    						$("#nv").attr("checked",true);
    					}else{
    						$("#nan").attr("checked",true);
    					}
    					if(data.info.headimg!=null && data.info.headimg!=''){
    						$("#headImg").attr("src",data.info.headimg);
    					}
    					address = data.info.address;
    					var $userAddress = $('#user-address');
    				        $userAddress.citypicker({
    				            responsive: true
    				        });
    				        $(".placeholder").html(address);
    					var size = data.size;
    					var courseList="";
    					for(var i=0;i<size;i++){
    						var obj = data.list[i];
    						if(obj.dd==1){
    						courseList+="<tr><td>"+obj.id+"</td><td><a href='zhibo.jsp?cid="+obj.id+"'>"+obj.title+"</a></td><td>"+obj.price+"</td><td>"+obj.tName+"</td><td>"+obj.totalNum+"</td></tr>";
    						}else if(obj.dd==2){
    						courseList+="<tr><td>"+obj.id+"</td><td><a href='kechen.jsp?cid="+obj.id+"'>"+obj.title+"</a></td><td>"+obj.price+"</td><td>"+obj.tName+"</td><td>"+obj.totalNum+"</td></tr>";
    						}
    					}
    					$("#list").append(courseList);
    					//我的笔记
    					var notesize = data.notesize;
    					var noteList="";
    					for(var i=0;i<notesize;i++){
    						var obj = data.notelist[i];
    						//var time = Math.floor(obj.time/60)+":"+((obj.time%60)/100).toFixed(2).slice(-2) ;
    						var url = "enterDemands?did="+obj.did+"&uid="+data.info.uid+"&username=&apos;" + data.info.nickName+"&url="+obj.url+"&sbid="+obj.sbid;
    						noteList+="<tr><td>"+obj.id+"</td><td><a href='"+url+"'>"+obj.content+"</a></td><td>"+obj.title+"</td><td>"+obj.submitTime+"</td></tr>";
    					}
    					$("#notelist").append(noteList);
    				}
    			},
    			dataType : "json"
    		});
    	}
	    function check(){
	    	var pwd = $("#changed-passwd").val();
	    	var repwd = $("#repeat-change").val();
	    	if(pwd==""){
	    		alert("密码不能为空!")
	    		return;
	    	}
	    	if(pwd!=repwd){
	    		alert("两次输入的密码不一致!")
	    		return;
	    	}
	    	var r = confirm("确定要修改密码么\n");
	    	if(r==true){
	    		$("#form1").submit();
	    		alert("密码修改成功！");
	    	}else{
	    		alert("取消修改密码！")
	    	}
	    }
        var $personalSidebar = $('.personal-sidebar');
        $personalSidebar.on('click', 'li', function (e) {
            var $this = $(this);
            var $index = $this.index();
            var $optionPage = $('.option-page');
            $this.addClass('active').siblings().removeClass('active');
            $optionPage.children().eq($index).show().siblings().hide();
        })
        var $fileBtn = $('#fileinput-button');
        $fileBtn.on('change', function () {
            var file = this.files[0];
            var fileRead = new FileReader();
            fileRead.onload = function (e) {
                var $Img = $('.head-img img');
                $Img.attr('src', e.target.result);
            };
            fileRead.readAsDataURL(file);
        })
    </script>
</body>

</html>