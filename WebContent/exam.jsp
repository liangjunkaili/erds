<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>考试管理</title>
<script type="text/javascript"
	src="static/js/common/jquery-1.11.3.min_6163309.js~v=1.2.0"></script>
<script type="text/javascript"
	src="static/js/common/jquery.cookie_a5283b2.js~v=1.2.0"></script>
<script type="text/javascript" src="static/js/common/common.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<style type="text/css">
	h4{    
	height: 28px;
    line-height: 28px;
    padding: 10px 0;
    }
	label {
	margin: 0 50px;
}
.tj_nav {
    padding: 4px 20px 0;
    border: 1px solid #e0e0e0;
}
.tj_nav_list {
    padding-top: 10px;
    padding-bottom: 4px;
    border-top: 1px dashed #e0e0e0;
}
.cf {
    zoom: 1;
}
div {
    display: block;
}
.nobort {
    border-top: none;
}
</style>
<script type="text/javascript">
var size = 0;
var answerMap={};
var sids="";
function queryByOthers(){
	examList="";
	var param="";
	/* var grade = $("input[name='grade']").filter(':checked').val();
	var subject = $("input[name='subject']").filter(':checked').val(); */
	var difficulty = $("input[name='difficulty']").filter(':checked').val();
	var questions = $("input[name='questions']").filter(':checked').val();
	/* if(grade!=undefined){
		param+="grade="+grade+"&";
	}
	if(subject!=undefined){
		param+="subject="+subject+"&";
	} */
	if(difficulty!=undefined){
		param+="difficulty="+difficulty+"&";
	}
	if(questions!=undefined){
		param+="questions="+questions+"&";
	}
	param = param.substring(0,param.length-1);
	console.log(param);
	init(param);
}
function init(param){
	var knowledgePoint = '<%=request.getParameter("knowledgePoint") %>';
	$("#knowledgePoint").html(knowledgePoint);
	param +="&knowledgePoint="+knowledgePoint+"";
	var examList="";
	$.ajax({
		url : "queryExam",
		type : "POST",
		data:param,
		success : function(data) {
			if (data.code == 200) {
				size = data.size;
				for(var i=0;i<data.size;i++){
					answerMap["'"+(i+1)+"'"] = data.list[i].answer;
					sids+=data.list[i].title+"~";
					if(data.list[i].questions=="a"){
						examList+="<li>"+(i+1)+"."+data.list[i].title+"</li>"+
						"<li><input type='radio' name='a"+(i+1)+"' value='"+data.list[i].optiona+"'><label style='margin-left: 0px;'>A."+data.list[i].optiona+"</label>"+
						"<input type='radio' name='a"+(i+1)+"' value='"+data.list[i].optionb+"'><label style='margin-left: 0px;'>B."+data.list[i].optionb+"</label>"+
						"<input type='radio' name='a"+(i+1)+"' value='"+data.list[i].optionc+"'><label style='margin-left: 0px;'>C."+data.list[i].optionc+"</label>"+
						"<input type='radio' name='a"+(i+1)+"' value='"+data.list[i].optiond+"'><label style='margin-left: 0px;'>D."+data.list[i].optiond+"</label></li>";
					}
					if(data.list[i].questions=="b"){
						examList+="<li>"+(i+1)+"."+data.list[i].title+"</li>"+
						"<li><input type='checkbox' name='a"+(i+1)+"' value='"+data.list[i].optiona+"'><label style='margin-left: 0px;'>A."+data.list[i].optiona+"</label>"+
						"<input type='checkbox' name='a"+(i+1)+"' value='"+data.list[i].optionb+"'><label style='margin-left: 0px;'>B."+data.list[i].optionb+"</label>"+
						"<input type='checkbox' name='a"+(i+1)+"' value='"+data.list[i].optionc+"'><label style='margin-left: 0px;'>C."+data.list[i].optionc+"</label>"+
						"<input type='checkbox' name='a"+(i+1)+"' value='"+data.list[i].optiond+"'><label style='margin-left: 0px;'>D."+data.list[i].optiond+"</label></li>";

					}
					if(data.list[i].questions=="c"){
						examList+="<li>"+(i+1)+"."+data.list[i].title+"</li>"+
						"<li><input type='radio' name='a"+(i+1)+"' value='"+data.list[i].optiona+"'><label style='margin-left: 0px;'>A."+data.list[i].optiona+"</label>"+
						"<input type='radio' name='a"+(i+1)+"' value='"+data.list[i].optionb+"'><label style='margin-left: 0px;'>B."+data.list[i].optionb+"</label>";
					}
				}
			}
			$("#dataList").html(examList);
		},
		dataType : "json"
	});
}
var selfAnswer="";
var judge="";
var uid=<%=request.getSession().getAttribute("uid") %>
function submit(){
	var str="";
	var sum=0;
	for(var i=0;i<size;i++){
		var cT = $("input[type=radio][name='a"+(i+1)+"']").filter(':checked').val();
		var str1="";
		$("input[type=checkbox][name='a"+(i+1)+"']:checked").each(function(){     
		     str1+=$(this).val()+",";
		});
		str1 = str1.substring(0,str1.length-1);
		console.log(answerMap["'"+(i+1)+"'"]);
		if(cT==undefined){
			selfAnswer+=str1+"~";
			
			if(answerMap["'"+(i+1)+"'"]==str1){
				sum+=5;
				str+="第"+(i+1)+"题:"+str1+"-----true"+"正确结果是:"+answerMap["'"+(i+1)+"'"]+"\n";
				judge+="1,";
			}else{
				str+="第"+(i+1)+"题:"+str1+"-----false"+"正确结果是:"+answerMap["'"+(i+1)+"'"]+"\n";
				judge+="0,";
			}
		}else{
			selfAnswer+=cT+"~";
			if(answerMap["'"+(i+1)+"'"]==cT){
				sum+=5;
				str+="第"+(i+1)+"题:"+cT+"-----true"+"正确结果是:"+answerMap["'"+(i+1)+"'"]+"\n";
				judge+="1,";
			}else{
				str+="第"+(i+1)+"题:"+cT+"-----false"+"正确结果是:"+answerMap["'"+(i+1)+"'"]+"\n";
				judge+="0,";
			}
		}
	}
	alert(str+"总分数为:"+sum)
	selfAnswer = selfAnswer.substring(0,selfAnswer.length-1);
	judge = judge.substring(0,judge.length-1);
	sids = sids.substring(0,sids.length-1);
    console.log(selfAnswer);  
    console.log(judge); 
    console.log(sids); 
	$.ajax({
		url : "savePractices",
		type : "POST",
		data:"uid="+uid+"&answer="+selfAnswer+"&judge="+judge+"&sids="+sids,
		success : function(data) {
			if (data.code == 200) {
				alert("提交成功");
				location.reload() 
			}
		},
		dataType : "json"
	});  
}
</script>
</head>
<body onload="init()">
	<%@include file="header.jsp"%>
	<div style="width: 1000px;margin: 0 auto;">
	<h4>首页>专题训练</h4>
	<div class="tj_nav" style="width: 980px;">
            <!-- <div class="tj_nav_list nobort cf">
                <b>年级：</b>
                <input type="radio" value="" name="grade" checked="checked">不限
                <input type="radio" value="c1" name="grade">初一
                <input type="radio" value="c1" name="grade">初二
                <input type="radio" value="c1" name="grade">初三
                <input type="radio" value="c1" name="grade">高一
                <input type="radio" value="c1" name="grade">高二
                <input type="radio" value="c1" name="grade">高三
            </div>
            <div class="tj_nav_list cf">
                <b>学科：</b>
                <input type="radio" value="" name="subject" checked="checked">不限
                <input type="radio" value="sx" name="subject">数学
                <input type="radio" value="hx" name="subject">化学
                <input type="radio" value="yy" name="subject">英语
                <input type="radio" value="wl" name="subject">物理
            </div> -->
            <div class="tj_nav_list nobort cf">
                <b>知识点：</b>
               <label id="knowledgePoint" style="margin-left: 0;"></label>
            </div>
            <div class="tj_nav_list cf">
                <b>难度：</b>
                <input type="radio" value="" name="difficulty" checked="checked">不限
                <input type="radio" value="C" name="difficulty">一般
                <input type="radio" value="B" name="difficulty">中等
                <input type="radio" value="A" name="difficulty">偏难
            </div>
            <div class="tj_nav_list cf">
                <b>题型：</b>
                <input type="radio" value="" name="questions" checked="checked">不限
                <input type="radio" value="a" name="questions">单选
                <input type="radio" value="b" name="questions">多选
                <input type="radio" value="c" name="questions">判断
            </div>
            <button type="button" class="btn btn-primary btn-sm" onclick="queryByOthers()">筛        选</button>
    </div>
		<ul style="list-style: none;line-height: 30px;margin: 0;padding: 20px 10px 0 3px;" id="dataList">
			<li>1.We wouldn’t have called a taxi yesterday if Harold __________us a ride home.</li>
			<li><input type="checkbox" name="b1" value="A"><label style='margin-left: 0px;'>A.11</label><input type="checkbox" name="b1" value="A1"><label style='margin-left: 0px;'>A.11</label><input type="checkbox" name="b1" value="A2"><label style='margin-left: 0px;'>A.11</label><input type="checkbox" name="b1" value="A3"><label style='margin-left: 0px;'>A.11</label></li>
			<li>1.We wouldn’t have called a taxi yesterday if Harold __________us a ride home.</li>
			<li><input type="radio" name="c1" value="c1"><label style='margin-left: 0px;'>错误</label><input type="radio" name="c1" value="c1"><label style='margin-left: 0px;'>正确</label></li>
		</ul>
	<button type="button" onclick="submit()" class="btn btn-primary btn-sm" style="float: right;">提交问卷</button>
	</div>
</body>
</html>