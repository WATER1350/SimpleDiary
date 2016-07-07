<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="http://g.alicdn.com/bui/bui/1.1.21/css/bs3/dpl.css" rel="stylesheet">
<link href="http://g.alicdn.com/bui/bui/1.1.21/css/bs3/bui.css" rel="stylesheet">
<script src="http://g.tbcdn.cn/fi/bui/jquery-1.8.1.min.js"></script>
<script src="http://g.alicdn.com/bui/seajs/2.3.0/sea.js"></script>
<script src="http://g.alicdn.com/bui/bui/1.1.21/config.js"></script>
<script language="javascript" src="JS/wghFunction.js"></script>
<title>重置密码</title>
<script language="javascript">
function resetPwd(){
	if(form.oldPwd.value==""){		//当用户名为空时
		alert("请输入旧密码！");
	    form.oldPwd.focus();
		return;
	}
	if(form.newPwd.value==""){		//当密码为空时
		alert("请输入新密码！");
	    form.newPwd.focus();
		return;
	}
	if(!checkePwd(form.newPwd.value)){
		alert("您输入的新密码不合法！密码由字母开头的字母、数字或下划线组成，并且密码的长度大于6位小于30位");
		form.newPwd.focus();
		return;
	}
	if(form.newPwd.value == form.oldPwd.value){
		alert("新密码不能和旧密码一样！");
		form.newPwd.focus();
		return;
	}
	$("#J_Form").submit();
}
</script>
<style>
#forgetPwd1{
	float:left;
	list-style: none;
	padding:50px 0px 0px 200px;
}
#forgetPwd1 li{
	float:left;

}
.settingList{
    padding:10px 0px 0px 5px;
}
</style>
<body  style="background-color:#d4d5e0;
             background-image: url('images/body_repeat.png');
             background-repeat: repeat-x;
             background-position: center 0;">
<%@ include file="top.jsp" %>
<div id="box">
<%@ include file="register.jsp" %>
<div id="setting" style="height:350px;margin:10px 0 0 100px;padding:50px">
<form id="J_Form" name="form" action="UserServlet?action=resetPwd" class="form-horizontal" method="post">
 <div class="control-group">
        <label class="control-label"><s>*</s>旧密码：</label>
        <div class="controls">
          <input id="oldPwd" name="oldPwd" type="password" class="input-large" data-rules="{required : true}">
        </div>
      </div>
      <div class="control-group">
        <label class="control-label"><s>*</s>新密码：</label>
        <div class="controls">
          <input id="newPwd" name="newPwd" type="password" class="input-large" data-rules="{required : true}">
        </div>
      </div>
      <div class="form-actions span13 offset5">
        <button type="button" class="button button-primary" onClick="resetPwd()">保存</button>
        <button type="reset" class="button">重置</button>
      </div>    
</form>
</div>
<!-- <div id="forgetPwd" style="height:356px;">
<form name="form_forgetPwd" method="post" action="UserServlet?action=forgetPwd1" onsubmit="return checkForm(this)">
<ul id="forgetPwd1">
	<li style="padding-top:5px;">请输入用户名： </li>
	<li><input type="text" name="username"> </li>
	 <li style="padding-left:10px;">
	 <input name="Submit" type="submit"  value="下一步">
	</li>
</ul>
</form>
 </div> -->
 <%@ include file="bottom.jsp" %>
</div>
</body>
</html>