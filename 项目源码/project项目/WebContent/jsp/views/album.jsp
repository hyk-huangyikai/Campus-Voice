<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*,java.io.File" errorPage=""%>

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
  <% request.setCharacterEncoding("UTF-8"); %>
  <%@ include file="../controller/dbconnect.jsp"%>

  <div class="album-content w1000"  id="layer-photos-demo" class="layer-photos-demo"  >
    <div class="img-info">
      <img src="../../res/img/banner3.jpg" alt="">
      <div class="title">
        <p class="data">书山有路勤为径</p>
        <p class="text">学海无涯苦作舟</p>
      </div>
    </div>
    
  <div class="container" style="text-align:right">
     <a href="../forms/sellbook.jsp" class="btn btn-info" role="button">我要出售二手书</a>
  </div>
  <br>
    
    <h3>二手教材</h3>
    <br>
    
    <div class="img-list">
      <div class="layui-fluid" style="padding:0">
        <div class="layui-row layui-col-space30 space">
        
        <%
        Statement stmt1 = connect.createStatement();
        ResultSet rs1=stmt1.executeQuery("select * from second_hand_material order by textbook_id desc;");
        Statement stmt2 = connect.createStatement();
        //String uploadPath = getServletContext().getRealPath("/") + File.separator + "upload";
        //相对路径才行，而保存是用的就是绝对
        String uploadPath = "../../upload";
        String picPath="";
          while(rs1.next())
          {%>
            <div class="layui-col-xs12 layui-col-sm4 layui-col-md4" style="line-height:0.5">
                <div class="item">
                  <%picPath=uploadPath+"/"+rs1.getString(7); %>
                  <img src="<%=picPath %>" width="80" height="220">
                  <div class="cont-text">
                  
                    <p class="briefly"><span class="glyphicon glyphicon-book"></span> <%=rs1.getString(3) %></p>
                    <p class="text"><span class="glyphicon glyphicon-user"></span> <%=rs1.getString(4) %></p>
                    <p class="text"><span class="glyphicon glyphicon-home"></span> <%=rs1.getString(5) %></p>
                    <p class="text"><span class="glyphicon glyphicon-usd"></span> <%=rs1.getFloat(6) %>元</p>
            <%
              String net_id = rs1.getString(2);
              ResultSet rs2=stmt2.executeQuery("select user_name,contect_method from user where user_net_id="+net_id+';');
              rs2.next();
            %>
            <p class="text"><span class="glyphicon glyphicon-phone-alt"></span> (<%=rs2.getString(1) %>)<%=rs2.getString(2) %></p>
            
                    
                  </div>
                </div>
              </div>
          <%
          }
        %>
          
          
        </div>
      </div>
      
      

      
      
    </div>
  </div>


  <div class="footer-wrap" style="background-color:rgb(217,217,216);" >
    <div class="footer w1000">
    
      <div class="qrcode">
        <div class="text">
          <h3 class="title">校园之声</h3>
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
  <%
  stmt1.close();
  stmt2.close();
  rs1.close();
  connect.close(); %>
</body>
</html>