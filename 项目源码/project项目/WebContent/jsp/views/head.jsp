<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/popper.js/1.12.5/umd/popper.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">

<title>校园知声</title>
</head>
<body>  

  
  <div class="header"  style="background-color:rgb(217,217,216);">
  	
    <div class="menu-btn">
      <div class="menu"></div>
    </div>
    <h1 class="logo">
      <a href="homepage.jsp">
        <span>校园知声</span>
        <img src="../../res/img/logo.png">
      </a>
    </h1>  
    
    
    <%
	if (session.getAttribute("login_id") != null) {  
		%>
		<div class="nav">
      <a href="homepage.jsp" class="active">首页</a>  
      <a href="teacher_info.jsp">教师公告</a>
      <a href="tutor.jsp">家教信息</a>
      <a href="album.jsp">二手教材</a>
      <a href="club_activity.jsp">社团活动</a>
      <a href="study_online.jsp">学习资料</a>
        </div>
		
	    <p class="welcome-text">
	      用户 ： <%=session.getAttribute("login_id")%> &nbsp <a href="../controller/logout.jsp" >退出登录</a> &nbsp  <a href="about.jsp" class="layui-btn" role="button">个人资料</a>
	    </p> <% 
	}

	else { %>
		<div class="container" style="text-align:right">
		   <a href="../forms/register.jsp" class="btn btn-info" role="button">注册</a>
		   <a href="../forms/login.jsp" class="btn btn-info" role="button">登录</a>
 		</div> <% 
	}
%>
    
    

  </div>

</body>
</html>