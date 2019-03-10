<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" pageEncoding="UTF-8" %>

<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>

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
   <% request.setCharacterEncoding("UTF-8"); %>
   
   <img class="banner-img" src="../../res/img/banner1.jpg">
    
   
   


  <div class="content whisper-content" style="background-color:rgb(175,196,213);" >
  
  	<%
        String netid10 = session.getAttribute("login_id").toString();
        Statement stmt10 = connect.createStatement();
        ResultSet rs10=stmt10.executeQuery("select * from user where user_net_id = " + netid10 + ";");
   	    rs10.next();
   	    
   	    if (rs10.getInt(4) == 2) {
   %>
	  <div class="container" style="text-align:right; " >
		 <a href="../forms/teacher_info_tip.jsp" class="btn btn-info" role="button">我要发帖</a>
	  </div> 
   <%  
    }
   %>
  
    <div class="cont">
      <div class="whisper-list">
      
      	<%
	        Statement stmt1 = connect.createStatement();
	        ResultSet rs1=stmt1.executeQuery("select * from teacher_info order by info_id desc;");
	      	while(rs1.next() ) {   
	      		Statement stmt2 = connect.createStatement();
	        	ResultSet rs2=stmt2.executeQuery("select * from user where user_net_id = " + rs1.getInt(2)  +  ";");
	      		rs2.next();  
	    %>
      
        <div class="item-box" style="background-color:rgb(217,217,216); opacity:0.9;">
          <div class="item">
            <div class="whisper-title">
            	
              
            
              <i class="layui-icon layui-icon-date"></i><span class="date"> <%=rs1.getString(5) %></span>
            </div>
	          
	          <p class="info_content"> <%=rs1.getString(3) %> </p>
	          <p class="user_name"> 发布教师： <%=rs2.getString(2) %> </p>
	          
            
            <div class="op-list">
            	 
              <form>
              <p class="like"><i class="layui-icon layui-icon-praise"></i><span><%=rs1.getInt(4)%></span></p> 
              
              <%
              	  Statement stmt5 = connect.createStatement();
	          	  ResultSet rs5=stmt5.executeQuery("select count(*) from teacher_info_comment where info_id = " + rs1.getInt(1)  +  ";");
	          	  rs5.next();  
              %>
              
              <p class="edit"><i class="layui-icon layui-icon-reply-fill"></i><span><%=rs5.getInt(1) %></span></p>
              <p class="off"><span>展开</span><i class="layui-icon layui-icon-down"></i></p>
              </form>
              
              
            </div>
          </div>
          <div class="review-version layui-hide">
              <div class="form">
                <img src="../../res/img/header2.png">
                <form  action=""  method="post"  class="layui-form" >
                
                  <div class="layui-form-item layui-form-text">
                    <div class="layui-input-block">
                      <input type="text" name="comment_content" class="layui-textarea">
                    </div>
                  </div>
                  
                  <div class="layui-form-item">
                    <div class="layui-input-block" style="text-align: right;">
                      <input type="submit" class="layui-btn " value="提交">
                    </div>
                  </div>
                </form>
                
              </div>
              
              <%  
              String comment_content = request.getParameter("comment_content");
              int info_id = rs1.getInt(1);
              String user_net_id = session.getAttribute("login_id").toString();
              if (comment_content != null && comment_content != "") {
            	  Statement stm=connect.createStatement();
      			  String sqlq="select * from teacher_info_comment order by comment_id desc limit 1;";
      			  ResultSet rs=stm.executeQuery(sqlq);
      			  
      			  int comment_id=1;
      			  if (rs.next())
      			  {
      				comment_id=rs.getInt(1)+1;
      			  }

      			  String sql="insert into teacher_info_comment(comment_id,info_id,user_net_id,comment_content) values(?,?,?,?)";
      			  PreparedStatement pstmt=connect.prepareStatement(sql);
      			  pstmt.setInt(1, comment_id);
      		      pstmt.setInt(2, info_id);
      		      pstmt.setInt(3, Integer.parseInt(user_net_id));
      		      pstmt.setString(4, comment_content);
      		      pstmt.executeUpdate();
      			    
      		      %>
      		    <script type="text/javascript">
      		    	window.location.replace("teacher_info.jsp");
      		    </script><%    
              }
              
              %>
              
              
              <% 
              Statement stmt3 = connect.createStatement();
	          ResultSet rs3=stmt3.executeQuery("select * from teacher_info_comment where info_id = " + rs1.getInt(1)  +  ";");
	      	  while(rs3.next() ) { 
	      		  Statement stmt4 = connect.createStatement();
		          ResultSet rs4=stmt4.executeQuery("select * from user where user_net_id = " + rs3.getInt(3)  +  ";");
		          rs4.next();
	      	  %>
              <div class="list-cont">
                <div class="cont">
                  <div class="img">
                    <img src="../../res/img/header2.png" alt="">
                  </div>
                  <div class="text">
                    <p class="tit"><span class="name"><%=rs4.getString(2)%></span></p>
                    <p class="ct"><%=rs3.getString(4) %></p>
                  </div>
                </div>              
              </div>
              <% 
              }
              %>
          </div>
        </div>
      <% 
      }  
        %>
      </div>
 
    </div>
  </div>
  
  <script type="text/html" id="laytplCont">
    <div class="cont">
      <div class="img">
        <img src="{{d.avatar}}" alt="">
      </div>
      <div class="text">
        <p class="tit"><span class="name">{{d.name}}</span><span class="data">2018/06/06</span></p>
        <p class="ct">{{d.cont}}</p>
      </div>
    </div>
  </script>
  
  <div class="footer-wrap" style="background-color:rgb(175,196,213);" >
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
    }).use(['element','laypage','form','menu'],function(){
      element = layui.element,laypage = layui.laypage,form = layui.form,menu = layui.menu;
      laypage.render({
        elem: 'demo'
        ,count: 70 //数据总数，从服务端得到
      });
      menu.init();
      menu.off();
      menu.submit()
    })
  </script>
</body>
</html>