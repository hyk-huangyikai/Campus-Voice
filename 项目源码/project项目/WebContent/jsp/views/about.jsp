<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <title>校园知声</title>
  <link rel="stylesheet" type="text/css" href="../../res/layui/css/layui.css">
  <link rel="stylesheet" type="text/css" href="../../res/css/main.css">
<!--加载meta IE兼容文件-->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
</head>  
<body>
 <jsp:include page="head.jsp" flush="true"/>
 <%@ include file="../controller/dbconnect.jsp"%>

  <div class="about-content" style="background-color:rgb(210,233,207);opacity:0.8" >
    <div class="w1000">
      <div class="item info">
        <div class="title">
          <h3>个人资料显示</h3>
        </div>
        
        <div class="cont">
          <img src="../../res/img/my_header.png">
          
          <%
          	String netid1 = session.getAttribute("login_id").toString();
	        Statement stmt1 = connect.createStatement();
	        ResultSet rs1=stmt1.executeQuery("select * from user where user_net_id = " + netid1 + ";");
	      	rs1.next();  
	      %>
          
          <div class="per-info">
            <p>              
              <p class="netid">学号 ：<%=rs1.getInt(1) %> </p>
              <p class="name">姓名 ：<%=rs1.getString(2) %> </p>
              <p class="phone">电话 ： <%=rs1.getString(3) %> </p>
              <p class="major">专业 ： <%=rs1.getString(5) %> </p>
              <p class="age"> 年龄 ：<%=rs1.getString(7) %> </p>
              <p class="passwd">密码 ： <%=rs1.getString(6) %> </p>
              <% 
              	int type = rs1.getInt(4);
              	if (type == 1) { %>   
              		<p class="type">身份 ： 学生  </p> <% 
              	}   
              	else {  %>
              		<p class="type">身份 ： 老师  </p> <% 
              	}
              %>
            </p>
          </div>  
          
          
        </div>
        
        <div class="container" style="text-align:right">
		  <a href="../forms/user_information.jsp" class="btn btn-info" role="button">修改个人资料</a>
	    </div>
        
      </div>
      
    </div>
    
  </div>
  
  <div class="footer-wrap" style="background-color:rgb(210,233,207)" >
    <div class="footer w1000">
    
      <div class="qrcode">
        <div class="text">
          <h3 class="title">校园之声</h3>
          <h5 class="title">有你最需要的校园咨询，更能让大家听见你的发声</h5>
        </div>
      </div>
      
      <div class="practice-mode">
        <div class="text">
          <h4 class="title">联系方式</h4>
          <p>微信<span class="WeChat">*********</span></p>
          <p>邮箱<span class="email">*********</span></p>
        </div>
      </div>
    </div>
  </div>
  <script type="text/javascript" src="../../res/layui/layui.js"></script>
  <script type="text/javascript">
    layui.config({
      base: '../../res/js/util/'
    }).use(['element','laypage','jquery','menu'],function(){
      element = layui.element,laypage = layui.laypage,$ = layui.$,menu = layui.menu;
      laypage.render({
        elem: 'demo'
        ,count: 70 //数据总数，从服务端得到
      });
      menu.init();
    })
  </script>
      
      
</body>
</html>