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


<% request.setCharacterEncoding("UTF-8"); %>
 <jsp:include page="../views/ex_head.jsp" flush="true"/>
 <%@ include file="../controller/dbconnect.jsp"%>


  <form action="" method="post"   >
  
  <div class="about-content" style="background-color:rgb(210,233,207)" >
    <div class="w1000">
      <div class="item info">

        
        <div class="cont">
          
          <%
            String netid1 = session.getAttribute("login_id").toString();
	        Statement stmt1 = connect.createStatement();
	        ResultSet rs1=stmt1.executeQuery("select * from user where user_net_id = " + netid1 + ";");
	      	rs1.next();  
	      %>
          
         
          <h3>个人资料修改</h3>

          
          <div class="per-info">
                        
              <p class="netid">学号 ：<%=rs1.getInt(1) %> </p>
              
              <div class="input-group mb-3">
			      <div class="input-group-prepend">
			        <span class="input-group-text" style="width:50px; height:40px;" >姓名</span>
			      </div>
			      <input type="text" name="user_name" style="width:250px; height:50px;"  placeholder= <%=rs1.getString(2) %> >
			  </div>
			  
              <div class="input-group mb-3">
			      <div class="input-group-prepend">
			        <span class="input-group-text" style="width:50px; height:40px;" >电话</span>
			      </div>
			      <input type="text" name="contect_method" style="width:250px; height:50px;"  placeholder= <%=rs1.getString(3) %> >
			  </div>
			  
              <div class="input-group mb-3">
			      <div class="input-group-prepend">
			        <span class="input-group-text" style="width:50px; height:40px;" >专业</span>
			      </div>
			      <input type="text" name="major" style="width:250px; height:50px;"  placeholder= <%=rs1.getString(5) %> >
			  </div>
			  
              <div class="input-group mb-3">
			      <div class="input-group-prepend">
			        <span class="input-group-text" style="width:50px; height:40px;" >年龄</span>
			      </div>
			      <input type="text" name="age" style="width:250px; height:50px;"  placeholder= <%=rs1.getString(7) %> >
			  </div>
			  
              <div class="input-group mb-3">
			      <div class="input-group-prepend">
			        <span class="input-group-text" style="width:50px; height:40px;" >密码</span>
			      </div>
			      <input type="text" name="passwd" style="width:250px; height:50px;"  placeholder= <%=rs1.getString(6) %> >
			  </div>
              <% 
              	int type = rs1.getInt(4);
              	if (type == 0) { %>   
              		<p class="type">身份 ： 学生  </p> <% 
              	}   
              	else {  %>
              		<p class="type">身份 ： 老师  </p> <% 
              	}
              %>
          </div>  
          
          
        </div>
        
        <div style="text-align:center">

			<input type="submit" class="btn btn-info" value="提交">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="../views/about.jsp" class="btn btn-info" role="button">返回(不保存)</a>
		 
		</div>
             
       </div>
      
    </div>
    
    </form>
    
    <% 
		String user_name = request.getParameter("user_name");
		String contect_method = request.getParameter("contect_method");
		String major = request.getParameter("major");
		String age = request.getParameter("age");
		String passwd = request.getParameter("passwd");
		String netid = netid1;
		
			  
		
		if((user_name!=null&&user_name!="") || (contect_method!=null&&contect_method!="") || (major!=null&&major!="") || (age!=null && age!="") || (passwd != null && passwd != ""))
		{
			
			if(user_name==null||user_name=="") {
				user_name = rs1.getString(2);
			}
			
			if(contect_method==null||contect_method=="") {
				contect_method = rs1.getString(3);
			}
			
			if(major==null||major=="") {
				major = rs1.getString(5);
			}
			
			if(age==null||age=="") {
				age = rs1.getString(7);
			}
			
			if(passwd==null||passwd=="") {
				passwd = rs1.getString(6);
			}
			
			String sql = "update user set user_name=?, contect_method=?, major=?, passwd=? ,age=? where user_net_id=" + netid + ";";
			PreparedStatement pstmt=connect.prepareStatement(sql);	
			pstmt.setString(1,user_name );
		    pstmt.setString(2,contect_method );
		    pstmt.setString(3,major );
		    pstmt.setString(4,passwd );
		    pstmt.setInt(5,Integer.parseInt(age));   
		    pstmt.executeUpdate();     
		    %>
		    <script type="text/javascript">
		    	window.location.replace("../views/about.jsp");
		    </script><%    
		}
	%>
    
    
    
    
</div>
      
      
</body>
</html>