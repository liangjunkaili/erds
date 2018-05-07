<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>测评</title>
<script type="text/javascript"
	src="static/js/common/jquery-1.11.3.min_6163309.js~v=1.2.0"></script>
<script type="text/javascript"
	src="static/js/common/jquery.cookie_a5283b2.js~v=1.2.0"></script>
<script type="text/javascript" src="static/js/common/common.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<style type="text/css">	
.tj_nav {
    padding: 4px 20px 0;
    border: 1px solid #e0e0e0;
}
label {
	margin: 0 50px;
}
div[name*='active']{
display: none;
}
div[name='active1']{
display: block;
}
pre {
white-space: pre-wrap; /* css-3 */
white-space: -moz-pre-wrap; /* Mozilla, since 1999 */
white-space: -pre-wrap; /* Opera 4-6 */
white-space: -o-pre-wrap; /* Opera 7 */
word-wrap: break-word; /* Internet Explorer 5.5+ */
} 
</style>
<script type="text/javascript">
var size = 0;
var index=1;
function init(){
	var examList="";
	$.ajax({
		url : "queryEvaluation",
		type : "POST",
		data:"",
		success : function(data) {
			if (data.code == 200) {
				size = data.size;
				for(var i=0;i<data.size;i++){
						examList+="<div name='active"+(i+1)+"'><li>"+(i+1)+"."+data.list[i].title+"</li>"+
						"<li><input type='radio' name='a"+(i+1)+"' value='A' onclick='next()'><label style='margin-left: 0px;'>A."+data.list[i].optionA+"</label>"+
						"<input type='radio' name='a"+(i+1)+"' value='B' onclick='next()'><label style='margin-left: 0px;'>B."+data.list[i].optionB+"</label></li></div>";
				}
			}
			$("#dataList").html(examList);
		},
		dataType : "json"
	});
}
function submit(){
	var str="";
	for(var i=0;i<size;i++){
		var cT = $("input[type=radio][name='a"+(i+1)+"']").filter(':checked').val();
		console.log(cT);
		str+=cT+",";
	}
	str=str.substring(0,str.length-1);
	$.ajax({
		url : "saveAnswer",
		type : "POST",
		data:"uid="+uid+"&option="+str,
		success : function(data) {
			if (data.code == 200) {
				alert("感谢您使用“悟思教育”平台，请到个人中心，完善您的信息，我们会第一时间把答案解密后发送到您的邮箱。请耐心等待！咨询热线：0477-2238359咨询地址：天佑大厦6楼（总部）；宏源一品12楼（分部）");
				window.location.href="account.jsp" 
			}
		},
		dataType : "json"
	});
}
var str="";
var answerMap={};
function next(){
	if(index>=size){
		alert("已经是最后一题了")
		return;
	}
	var cT = $("input[type=radio][name='a"+index+"']").filter(':checked').val();
	if(cT==undefined){
		alert("请选择答案!")
		return;
	}
	str+=cT+",";
	answerMap[index] = cT;
	//console.log(answerMap);
	//console.log(str);
	index++;
	$("div[name*='active']").css("display","none");
	$("div[name='active"+index+"']").css("display","block");
	if(index==size){
		$("#submit").css("display","block");
	}
}
function pre(){
	if(index<=1){
		alert("已经是第一题了")
		return;
	}
	index--;
	$("div[name*='active']").css("display","none");
	$("div[name='active"+index+"']").css("display","block");
}
var uid='<%=request.getSession().getAttribute("uid")%>';
$(function(){
	if(uid==null||uid=='null'){
		alert("请先登录")
		window.location.href="login.jsp"
	}
	init();
})
</script>
</head>
<body>
	<%@include file="header.jsp" %>
	<div style="width: 1000px;margin: 0 auto;">
	<pre class="tj_nav" style="width: 980px;">
	<h3>职业兴趣倾向问卷</h3>
量表介绍:
	 本问卷根据中国的职业市场情况与用于习惯设计而成，通过了大批量的测试，有很好的信度和效度。本问卷分别对兴趣、能力和人格特点进行了综合测查。该理论把职业分为六种不同的类型，即现实型、研究型、艺术型、社会型、管理型、常规型。霍兰德认为，每个人都是由这六种类型的不同组合，只是占主导地位的类型不同。每一种职业的工作环境也是由六种不同的工作条件所组成，其中有一种占主导地位。一个人的职业是否成功在很大程度上取决于某个个性类型和工作条件之间的适应情况。
	 本测验适用于高中生、大学生和缺乏职业经验的人。该测验能够帮助被测试者更加全面地了解自己更适合进行哪个专业的学习，以便在升学时做出正确的选择；帮助受测者发现和确定自己的职业兴趣和能力特长，从而更好地做出求职择业的决策；如果是已经考虑好或选择好了自己的职业，本测验将使被试者的这种考虑或选择具有理论基础，或向其展示其他合适的职业；如果是至今尚未确定职业方向，本测验将帮助被试者根据自己的情况选择一个恰当的职业目标。　　
第一部分1至48题。
 列出了一些具体的活动或者职业，请你根据自己的喜好作答，若你喜欢从事题目中所列的活动，请选“是”，否则请选“否”，答案无对错之分。
 注意：本问卷主要用来确定你的职业兴趣，而非让你选择工作，你喜欢某种活动并不意味着你一定要从事这种活动，答题时也不必考虑自己是否干过或擅长这种活动，只根据你的兴趣直接判断即可。
第二部分49至96题。
 列出一些具体活动，对于你能够做得很好或能够胜任的活动，请选“是”；对于你从未做过或做得不好的活动，请选“否”。注意：选择时只考虑你是否擅长此项活动，而不要考虑自己是否喜欢该活动或是否适合做该项活动。
第三部分97至144题。
 根据自己的实际情况填答“是”或“否”。答题时以自己的第一反应为依据，不要过分推敲，答案无所谓对错。
 请仔细阅读每一个题目，根据自己的实际情况进行回答。
 请注意以下几点：
  (1)这些题目用于测试您的个人情况，没有对错之分，请您根据自己的情况如实做答。
  (2)对每一个题目都要有而且只能有一个选择，不要遗漏，也不要多选。
    </pre>
    <h3>你喜欢做下列事情吗？ </h3>
		<ul style="list-style: none;line-height: 30px;margin: 0;padding: 20px 10px 0 3px;" id="dataList">
		
		</ul>
	<button type="button" onclick="submit()" class="btn btn-primary btn-sm" style="float: right;margin-left: 50px;display: none;" id="submit">提交问卷</button>
		<button type="button" onclick="next()" class="btn btn-primary btn-sm" style="float: right;margin-left: 50px;">下一题</button>
		<button type="button" onclick="pre()" class="btn btn-primary btn-sm" style="float: right;margin-left: 50px;">上一题</button>
	</div>
</body>
</html>