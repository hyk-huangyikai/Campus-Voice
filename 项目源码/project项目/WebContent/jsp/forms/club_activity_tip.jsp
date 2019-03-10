<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
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
 <jsp:include page="../views/ex_head.jsp" flush="true"/>
 <% request.setCharacterEncoding("UTF-8"); %>
 <%@ include file="../controller/dbconnect.jsp"%>
 
          <%
            String netid1 = session.getAttribute("login_id").toString();
            
	      %>


  <div class="content whisper-content leacots-content" style="background-color:rgb(109,195,173); opacity:0.8;" >
    <div class="cont w1000">  
      <div class="whisper-list">
        <div class="item-box">
          <div class="review-version">
              <div class="form-box">
                <img class="banner-img" src="../../res/img/banner33.jpg">
                <div class="form">
                  <form class="layui-form" action="" method = "post">
                    <div class="layui-form-item layui-form-text">
                      <div class="layui-input-block" style="background-color:rgb(217,217,216); opacity:0.6;" >
                        <input type = "text" name="activity_name" placeholder="活动名称" class="layui-textarea">
                        <input type = "text" name="activity_content" placeholder="活动内容" class="layui-textarea">
                        <input type = "text" name="department" placeholder="活动举办部门" class="layui-textarea">
                        <input type = "text" name="activity_location" placeholder="活动地点" class="layui-textarea">
                        <input type = "text" name="activity_datetime" placeholder="活动时间" class="layui-textarea">
                      </div>
                    </div>
                    <div class="layui-form-item"> 
                      <div class="layui-input-block" style="text-align: right;">
                        <input type="submit" class="layui-btn " value = "确定" > 

                      </div>
                    </div>
                  </form>
                  
        <% 
		String activity_name = request.getParameter("activity_name");
		String activity_content = request.getParameter("activity_content");
		String department = request.getParameter("department");
		String activity_location = request.getParameter("activity_location");
		String activity_datetime = request.getParameter("activity_datetime");
		String netid = netid1;
		
		
		if((activity_name!=null&&activity_name!="") && (activity_content!=null&&activity_content!="") && (department!=null&&department!="") && (activity_location!=null && activity_location!="") && (activity_datetime != null && activity_datetime != ""))
		{
			
			Statement stm=connect.createStatement();
			String sqlq="select * from club_activity order by activity_id desc limit 1;";
			ResultSet rs=stm.executeQuery(sqlq);
			
			int activity_id=1;
			if(rs.next())
			{
				activity_id=rs.getInt(1)+1;
			}
			
			String sql="insert into club_activity(activity_id,user_net_id,activity_name,activity_content,department,activity_location,activity_datetime,like_number,time) values(?,?,?,?,?,?,?,?,?);";
			PreparedStatement pstmt5=connect.prepareStatement(sql);
			pstmt5.setInt(1, activity_id);
		    pstmt5.setInt(2, Integer.parseInt(netid));
		    pstmt5.setString(3, activity_name);  
		    pstmt5.setString(4, activity_content);
		    pstmt5.setString(5, department);
		    pstmt5.setString(6, activity_location);
		    pstmt5.setString(7, activity_datetime);  
		    pstmt5.setInt(8,0);
		    

            java.util.Date d = new java.util.Date();
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String now = df.format(d);
			
			pstmt5.setString(9,now);
		    
		    pstmt5.executeUpdate();  
		      
		    %>
			  
		     <script type="text/javascript">
		    	window.location.replace("../views/club_activity.jsp");
		    </script>
		    <%   
		}
	%>
                  
                  
                  
                </div>
              </div>
              

          </div>
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
      menu.submit()
    })
  </script>
</body>
</html>