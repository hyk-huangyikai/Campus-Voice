<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/popper.js/1.12.5/umd/popper.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>
<title>校园知声</title>
</head>
<body>

<% request.setCharacterEncoding("UTF-8"); %>



<div class="container" style="margin-top:5%">
  <br>
  <h2 align="center">请填写必要信息</h2>
	
	
		    
	<form action="../controller/upload.jsp" method="post" enctype="multipart/form-data" >
		  
	  	 <div class="card bg-light text-dark" style="width:600px;margin:auto;margin-top:5%;">
		    <div class="card-body">		  
		  
			    <div class="input-group mb-3">
			      
			      <input type="text" class="form-control" name="book_name" required="true" placeholder="书名">
			    </div>
			
			    <div class="input-group mb-3">
			      
			      <input type="text" class="form-control" name="author" required="true" placeholder="作者">
			    </div>
			
			    <div class="input-group mb-3">
			    
			      <input type="text" class="form-control" name="pub" required="true" placeholder="出版社" >
			    </div>
			
			    <div class="input-group mb-3">
			      
			      <input type="text" class="form-control" name="price" required="true" placeholder="二手价">
			    </div>
			    
			    
				
				<div class="input-group mb-3">
			      <input type="file" class="form-control" name="file" required="true" >
			      <div class="input-group-append">
			        <span class="input-group-text" >教材封面照</span>
			      </div>
			    </div>
		
			</div>
	  	</div>
			<br>
			<div style="text-align:center">
		
				<input type="submit" class="btn btn-info" value="提交">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="../views/album.jsp" class="btn btn-info" role="button">返回(不保存)</a>
				 
			</div>
		  </form>


  
 
 
</div>
</body>
</html>