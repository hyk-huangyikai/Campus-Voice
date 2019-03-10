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


  <div class="content whisper-content leacots-content"  style="background-color:rgb(175,196,213); opacity:0.8"  >
    <div class="cont w1000">  
      <div class="whisper-list">
        <div class="item-box">
          <div class="review-version">
              <div class="form-box">
                <img class="banner-img" src="../../res/img/banner11.jpg">
                <div class="form">
                  <form class="layui-form" action="" method = "post">
                    <div class="layui-form-item layui-form-text">
                      <div class="layui-input-block" style="background-color:rgb(217,217,216); opacity:0.6;" >
                        <input type = "text" name="info_content" placeholder="亲爱的教师用户好，在此书写您的公告" class="layui-textarea">
                      </div>
                    </div>
                    <div class="layui-form-item">
                      <div class="layui-input-block" style="text-align: right;">
                        <input type="submit" class="layui-btn " value = "确定" > 

                      </div>
                    </div>
                  </form>
                  
                  <% 
		String info_content = request.getParameter("info_content");
		String netid = netid1;
		
		if(info_content != "" && info_content != null)
		{
			
			Statement stm=connect.createStatement();
			String sqlq="select * from teacher_info order by info_id desc limit 1;";
			ResultSet rs=stm.executeQuery(sqlq);
			
			int info_id=1;
			if(rs.next())
			{
				info_id=rs.getInt(1)+1;
			}
			String sql="insert into teacher_info(info_id,user_net_id,info_content,like_number,time) values(?,?,?,?,?)";
			PreparedStatement pstmt=connect.prepareStatement(sql);
			pstmt.setInt(1, info_id);
		    pstmt.setInt(2, Integer.parseInt(netid));
		    pstmt.setString(3, info_content);
		    pstmt.setInt(4,0);
		    
		    
            java.util.Date d = new java.util.Date();
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String now = df.format(d);
		   
			pstmt.setString(5,now);
		    
		    pstmt.executeUpdate();%>
			
		    <script type="text/javascript">
		    	window.location.replace("../views/teacher_info.jsp");
		    </script><%    
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