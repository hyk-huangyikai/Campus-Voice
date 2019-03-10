<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<html>
<head>
  <title>校园知声</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">
  <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://cdn.staticfile.org/popper.js/1.12.5/umd/popper.min.js"></script>
  <script src="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/js/bootstrap.min.js"></script>
 

  
</head>
<body>

<div class="container"  >
	<br><br><br><br><br><br>
	<h2 align="center">请完善信息并上传资料</h2>
	<form method="post" action="../controller/uploadfile.jsp" enctype="multipart/form-data">

	 <div class="card bg-light text-dark" style="width:600px;margin:auto;margin-top:5%;">
	    <div class="card-body">
	    
		    <div class="input-group mb-3">
		      <input type="text" class="form-control" name="material_name" required="true" placeholder="资料名称">
		    </div>
		    
	    	<div class="input-group mb-3">
		      <input type="text" class="form-control" name="comment" required="true" placeholder="评论">
		    </div>
		    
			    
			    
	<div class="input-group mb-3">
      <input type="file" class="form-control" name="file" required="true">
      <div class="input-group-append">
        <span class="input-group-text">资料</span>
      </div>
    </div>
			    	
		    
		</div>
	  </div>

		<br>
			<div align="center">
		
				<input type="submit" class="btn btn-info" value="提交">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="../views/study_online.jsp" class="btn btn-info" role="button">返回(不保存)</a>
				 
			</div>
	
	</form>
</div>

</body>
</html>