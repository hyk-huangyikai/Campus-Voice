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
<%request.setCharacterEncoding("utf-8"); %>

  <jsp:include page="head.jsp" flush="true"/>
	<%@ include file="../controller/dbconnect.jsp" %>


    <img class="banner-img" src="../../res/img/banner5.jpg">

	
		
				
		
	
  <div class="content whisper-content" style="background-color:rgb(96,163,179);" >
  
  	<div class="container" style="text-align:right">
		 <a href="../forms/study_info.jsp" class="btn btn-info" role="button">我要上传资料</a>
	</div>
  
    <div class="cont">
      <div class="whisper-list">
      

      
      <%
      	Statement stmt = connect.createStatement(); 
      	ResultSet rs=stmt.executeQuery("select * from study_online order by book_id desc;");
      %>
      <%
      	while(rs.next())
      	{%>
	      	<div class="item-box" style="background-color:rgb(217,217,216); opacity:0.9;" >
	          <div class="item">
	            <div class="whisper-title">
	            
	            
	              <i class="layui-icon layui-icon-date"></i><span class="date"><%=rs.getString(6) %></span>
	            </div>
	            
	            <p class="bg-success text-white" style="text-align:center;font-size:30px"><%=rs.getString(3) %></p>
				
	            <p class="bg-secondary text-white" style="text-align:center"><%=rs.getString(4) %></p>
    			
    			<div style="text-align:center">

	    			<%String filelink="../../uploadfile/"+rs.getString(5); %>
	    			<a href="<%=filelink %>" download="<%=rs.getString(5) %>">下载</a>
				
				</div>
	            

	          </div>
	          
	        </div>	
      	<%}
      %>
        
        
        
        
        
      </div>

    </div>
  </div>
  <div class="footer-wrap" style="background-color:rgb(96,163,179);" >
    <div class="footer w1000">
    
      <div class="qrcode">
        <div class="text">
          <h3 class="title">校园知声</h3>
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