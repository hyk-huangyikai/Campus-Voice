<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>校园知声</title>
<link rel="stylesheet" media="screen" href="../../res/css/css.css" />
</head>
<div style="display:none"></div>
<form id="msform" action="../controller/ex_register.jsp">
	
	<fieldset>  
		<h2 class="fs-title">注册</h2>    
		<h3 class="fs-subtitle">Register</h3>
		<input type="text" name="netid" placeholder="学号" required="true"/>
		<input type="text" name="username" placeholder="用户名" required="true"/>
		<input type="text" name="email" placeholder="邮箱"  required="true"/>
		<input type="text" name="phone" placeholder="电话" required="true" />
		<input type="text" name="type" placeholder="身份: 填1： 学生  / 填2： 老师" required="true" />
		<input type="password" name="passwd" placeholder="密码" required="true" />
		<input type="password" name="cpasswd" placeholder="确认密码" required="true" />
		<input type="submit" name="register" class="register action-button" value="submit" />
	</fieldset>
	
</form>




<script src="../../res/js/util/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="../../res/js/util/jquery.easing.min.js" type="text/javascript"></script>
<!--  <script src="../../res/js/util/jQuery.time.js" type="text/javascript"></script>   -->
<br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br>
  
</body>
</html>