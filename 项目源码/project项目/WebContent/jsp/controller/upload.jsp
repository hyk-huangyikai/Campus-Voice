<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page language="java" import="java.sql.*,com.jspsmart.upload.*,java.io.File" %>


<jsp:useBean id="mySmartUpload" scope="page" class="com.jspsmart.upload.SmartUpload" />


<HTML>



<BODY BGCOLOR="white">


	<%@ include file="dbconnect.jsp"%>
	<% String netid10 = session.getAttribute("login_id").toString(); %>
	<% 
		//文本处理
		// Initialization
		mySmartUpload.initialize(pageContext);
		mySmartUpload.setCharset("utf-8");
		// Upload
		mySmartUpload.upload();
		String uploadPath = getServletContext().getRealPath("/") + File.separator + "/upload";
		File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
		mySmartUpload.save(uploadPath);
		//SmartFile file=mySmartUpload.getFiles().getFile(0);
		//file.saveAs("/upload/1.jpg",SmartUpload.SAVE_VIRTUAL);
		
		String book_name=mySmartUpload.getRequest().getParameter("book_name");
		String author=mySmartUpload.getRequest().getParameter("author");
		String pub=mySmartUpload.getRequest().getParameter("pub");
		String price=mySmartUpload.getRequest().getParameter("price");

		
		Statement stm=connect.createStatement();
		String sqlq="select * from second_hand_material order by textbook_id desc limit 1;";
		ResultSet rs=stm.executeQuery(sqlq);
		int textbook_id=1;
		if(rs.next())
		{
			textbook_id=rs.getInt(1)+1;
		}
		int user_net_id=Integer.parseInt(netid10);
		Float bookprice=Float.parseFloat(price);
		String sql="insert into second_hand_material(textbook_id,user_net_id,textbook_name,author,pub,price) values(?,?,?,?,?,?)";
		PreparedStatement pstmt=connect.prepareStatement(sql);
		pstmt.setInt(1, textbook_id);
	    pstmt.setInt(2, user_net_id);
	    pstmt.setString(3, book_name);
	    pstmt.setString(4, author);
	    pstmt.setString(5, pub);
	    pstmt.setFloat(6, bookprice);
	    pstmt.executeUpdate();

    	//图片处理
        // Variables
        int count=0;
        
        // SQL Request
        Statement stmt = connect.createStatement(ResultSet.TYPE_FORWARD_ONLY ,ResultSet.CONCUR_UPDATABLE);
        ResultSet rs_query = stmt.executeQuery("SELECT * FROM second_hand_material order by textbook_id desc limit 1");

        // if the resultset is not null
        if (rs_query.next())
        {
            // upload file in the DB if this file is not missing
            if (!mySmartUpload.getFiles().getFile(0).isMissing())
            {
                try {
                	rs_query.updateString("filename", mySmartUpload.getFiles().getFile(0).getFileName());                  
                    // Update
                    rs_query.updateRow(); 
                
                } catch(Exception e) {
                    out.println("An error occurs : " + e.toString()); 
                } 
            }  
        }
        rs.close();
        rs_query.close();
        pstmt.close();
        stmt.close();
        connect.close();
		
        
    %>
 	   <script type="text/javascript">
            window.location.replace("../views/album.jsp");
       </script>


</BODY>
</HTML>
