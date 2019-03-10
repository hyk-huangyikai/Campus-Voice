<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>校园知声</title>
</head>
<body>



	<%@ include file="dbconnect.jsp"%>  
	<% 
	
		String netid=request.getParameter("netid");
		String username=request.getParameter("username");
		String email=request.getParameter("email");
		String contect_method=request.getParameter("phone");
		String type=request.getParameter("type");
		String pass=request.getParameter("passwd");
		String cpass=request.getParameter("cpasswd");
		
		if(netid!=null && netid != "" && pass != null && pass != "")
		{
			
			try{
				String sql1 = "select * from user where user_net_id = " + netid;
			    Statement stmt1 = connect.createStatement();
		        ResultSet rs1=stmt1.executeQuery(sql1); 
		      	int is_exist = 0;
		      	while(rs1.next()) {
		      		if (rs1.getInt(1) == Integer.parseInt(netid) ) {
		      			is_exist = 1;
		      			break;
		      		}
		      	}
			    
				if (is_exist == 1 || pass.compareTo(cpass) != 0) {
					%>
				    <script type="text/javascript">
				    	window.location.replace("../forms/register.jsp");
				    </script><%
				}
				else {
					String sql2="insert into user(user_net_id,user_name,contect_method,type,major,passwd,age,mail) values(?,?,?,?,?,?,?,?)";
					PreparedStatement pstmt=connect.prepareStatement(sql2);
					pstmt.setInt(1, Integer.parseInt(netid));
				    pstmt.setString(2, username);
				    pstmt.setString(3, contect_method);
				    pstmt.setInt(4,Integer.parseInt(type));
				    pstmt.setString(5, "");
				    pstmt.setString(6, pass);
				    pstmt.setInt(7, 0);
				    pstmt.setString(8, email);
				    pstmt.executeUpdate();
				    %>
				
				    <script type="text/javascript">
				    	window.location.replace("../forms/login.jsp");
				    </script><%
				}
				
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			
		}
		connect.close();
	%>



</body>
</html>