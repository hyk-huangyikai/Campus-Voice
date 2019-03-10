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
            Statement stmt1 = connect.createStatement();
	        ResultSet rs1=stmt1.executeQuery("select * from user where user_net_id = " + netid1 + ";");
	      	rs1.next();
	      %>


  <div class="content whisper-content leacots-content" style="background-color:rgb(190,182,230); opacity:0.8;"  >
    <div class="cont w1000">  
      <div class="whisper-list">
        <div class="item-box">
          <div class="review-version">
              <div class="form-box"  >
                <img class="banner-img" src="../../res/img/banner22.jpg">
                <div class="form">
                  <form class="layui-form" action="" method = "post">
                    <div class="layui-form-item layui-form-text">
                      <div class="layui-input-block" style="background-color:rgb(217,217,216); opacity:0.6;" >
                        <input type = "text" name="subject" placeholder="辅导科目" class="layui-textarea">
                        <input type = "text" name="grade" placeholder="年级" class="layui-textarea">
                        <input type = "text" name="location" placeholder="辅导地点" class="layui-textarea">
                        <input type = "text" name="wage" placeholder="薪酬" class="layui-textarea">
                        <input type = "text" name="schooling_requirement" placeholder="就读学校要求" class="layui-textarea">
                      </div>
                    </div>
                    <p class="phone" class="layui-textarea" >联系方式 ：<%=rs1.getString(3) %> </p>
                    <div class="layui-form-item">
                      <div class="layui-input-block" style="text-align: right;">
                        <input type="submit" class="layui-btn " value = "确定" > 

                      </div>
                    </div>
                  </form>
                  
        <% 
		String subject = request.getParameter("subject");
		String grade = request.getParameter("grade");
		String location = request.getParameter("location");
		String wage = request.getParameter("wage");
		String schooling_requirement = request.getParameter("schooling_requirement");
		String netid = netid1;
		
			  
		
		if((subject!=null&&subject!="") && (grade!=null&&grade!="") && (location!=null&&location!="") && (wage!=null && wage!="") && (schooling_requirement != null && schooling_requirement != ""))
		{
			
			Statement stm=connect.createStatement();
			String sqlq="select * from private_tutor order by teach_id desc limit 1;";
			ResultSet rs=stm.executeQuery(sqlq);
			int teach_id=1;
			if(rs.next())
			{
				teach_id=rs.getInt(1)+1;
			}

			
			String sql="insert into private_tutor(teach_id,user_net_id,grade,subject,location,wage,schooling_requirement,like_number,time) values(?,?,?,?,?,?,?,?,?)";
			PreparedStatement pstmt=connect.prepareStatement(sql);
			pstmt.setInt(1, teach_id);
		    pstmt.setInt(2, Integer.parseInt(netid));
		    pstmt.setString(3, grade);
		    pstmt.setString(4, subject);
		    pstmt.setString(5, location);
		    pstmt.setFloat(6, Float.parseFloat(wage));
		    pstmt.setString(7, schooling_requirement);
		    pstmt.setInt(8,0);
		    

            java.util.Date d = new java.util.Date();
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String now = df.format(d);
			
			pstmt.setString(9,now);

		    
		    pstmt.executeUpdate();%>
			
		    <script type="text/javascript">
		    	window.location.replace("../views/tutor.jsp");
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