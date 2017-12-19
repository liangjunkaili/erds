<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>dwr</title>
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="js/dwr/util.js"></script>
<script type="text/javascript" src="js/dwr/engine.js"></script>
<script type="text/javascript" src="js/dwr/interface/SendPushService.js"></script>
<script type="text/javascript">
$(document).ready(
	function(){
		//dwr.engine.setActiveRecerseAjax(true);
		onLoadPage() 
		$("#sign").click(function(){
			SendPushService.send($("#msg").val());
		});
	}
)
	function callBackHello(msg){
		$("#ul").html()
	}
	function initReverseAjax() {
	        if (dwr.engine._scriptSessionId == null) {
	          setTimeout("initReverseAjax()", 2000);
	         } else {
	           dwr.engine.setActiveReverseAjax(true);
	        }
	     }
	 
	   
	    function onLoadPage() {
	         dwr.engine.setNotifyServerOnPageUnload(true);
	       //  dwr.engine.setActiveReverseAjax(true);
	       initReverseAjax();
	        // dwr.engine.setErrorHandler(errorHandler);
	          //刷新页面时 销毁 原先创建的scriptSession
	       // doImport.dwrImport(${modelId}, ${importType}, '${matchStr}');
	    }
</script>
</head>
<body>
<ul id="ul"></ul>
<input type="text" id="msg" name="msg">
<input type="button" name="button" value="测试" id="sign">
</body>
</html>