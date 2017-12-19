<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>评论专区</title>
<link rel="stylesheet"
	href="static/css/common/normalize_dd5983a.css~v=1.2.0.css" />
<link rel="stylesheet"
	href="static/css/common/public_2347803.css~v=1.2.0.css" />
<script type="text/javascript"
	src="static/js/common/jquery-1.11.3.min_6163309.js~v=1.2.0"></script>
<script type="text/javascript"
	src="static/js/common/jquery.cookie_a5283b2.js~v=1.2.0"></script>
<style type="text/css">
.a {
	float: left;
	 /*padding-top: 10px; 
	 padding-left:10px;  */
	/*  border: 2px solid ;
	border-color:#0000FF;  */
}

.b {
	float: left;
	padding-top: 10px;
	padding-left:10px;
	/* border: 2px solid ;
	border-color:#0000FF;  */
	
}
.c{
	float: left;
	padding-top: 10px;
	padding-left:10px;
	/*  border: 2px solid ;
	border-color:#0000FF;  */
	
  }
.d{
	float: right;
	padding-top: 10px;
	padding-right:10px;
	/*  border: 2px solid ;
	border-color:#0000FF;  */
	
  }
 .e{
	text-align:left;
	padding-left:10px;
	padding-top: 0px;
	/*  border: 2px solid ;
	border-color:#0000FF; 
	 */
	
  }
 
body {
	
}

#commentList {
	
	
	width: 60%;
	margin: 75px auto;
}
/* #border{
	border:solid 2px black;
} */
</style>
<script type="text/javascript" src="static/js/common/common.js"></script>
<script type="text/javascript">
	function getCommentsList() {
		var data = "{'pageIndex':0,'pageSize':20}";
		var comments = "";
		$.ajax({
			url :"getComment",
			type : "POST",
			data : 'data=' + data,
			success : function(data) {
				if (data.code == 200) {
					var p = data.size;
					for (var i = 0; i < p; i++) {
						var obj = data.commentList[i];
						var endTime = new Date(obj.time.time);
						comments += "<div class ='' >"
								+ "<div class='a'><p><img src ='"+ obj.headImg
								+ "' height=40px; width=40px; /></p></div>"
								+ "<div class='b'><p>" + obj.sid
								+ "</p></div>"
								+ "<div class='c'><p>"
								+ endTime.pattern("yyyy-MM-dd")
								+ "</p></div>"
								+ "<div class='d'><p>[综合讨论区]</p></div><br><br>"
								+ "<div class='e'><p>" + obj.content
								+ "</p></div>" + "</div>";
					}
					$("#commentList").append(comments);
				}
			},
			dataType : "json"
		});
	}
</script>
</head>
<body onload="getCommentsList()">
    
	<div id="commentList" class=""></div>
	</div>

</body>

</html>