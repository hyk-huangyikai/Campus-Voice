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

<jsp:include page="head.jsp" flush="true"/>

  <div class="banner">
    <div class="cont w1000">
      
      
    </div>
  </div>
 
 <%
 if (session.getAttribute("login_id") != null) {
 %>
 	
  <div class="content" style="background-color:rgb(150,150,100);"  >
    <div class="cont w1000">

      <div class="list-item">
        <div class="item">
          <div class="layui-fluid">
            <div class="layui-row">
              <div class="layui-col-xs12 layui-col-sm4 layui-col-md5">
                <div class="img"><img src="../../res/img/p1.png" alt=""></div>
              </div>
              <div class="layui-col-xs12 layui-col-sm8 layui-col-md7">
                <div class="item-cont">
                  <h3>教师公告<button class="layui-btn layui-btn-danger new-icon">new</button></h3>
                  <h5>introduction</h5>
                  <p>在这里您可以看到教师通知同学的重要信息，实验室招人、实验项目志愿者招募、教授学术讲座、考试信息，不容错过！。</p>
                  <a href="teacher_info.jsp" class="go-icon"></a>
                </div>
            </div>
            </div>
           </div>
        </div>
        <div class="item">
          <div class="layui-fluid">
            <div class="layui-row">
              <div class="layui-col-xs12 layui-col-sm4 layui-col-md5">
                <div class="img"><img src="../../res/img/p2.png" alt=""></div>
              </div>
              <div class="layui-col-xs12 layui-col-sm8 layui-col-md7">
                <div class="item-cont">
                  <h3>家教信息<button class="layui-btn layui-btn-danger new-icon">new</button></h3>
                  <h5>introduction</h5>
                  <p>在这里您可以看到家教的招聘信息，辅导科目、年级要求、辅导地点、薪酬、就读学校要求，一目了然！</p>
                  <a href="tutor.jsp" class="go-icon"></a>
                </div>
            </div>
            </div>
           </div>
        </div>
        <div class="item">
          <div class="layui-fluid">
            <div class="layui-row">
              <div class="layui-col-xs12 layui-col-sm4 layui-col-md5">
                <div class="img"><img src="../../res/img/p3.png" alt=""></div>
              </div>
              <div class="layui-col-xs12 layui-col-sm8 layui-col-md7">
                <div class="item-cont">
                  <h3>二手教材<button class="layui-btn layui-btn-danger new-icon">new</button></h3>
                  <h5>introduction</h5>
                  <p>这里有师兄师姐出售的实惠二手教材，各个专业，各个科目，应有尽有！</p>
                  <a href="album.jsp" class="go-icon"></a>
                </div>
            </div>
            </div>
           </div>
        </div>
        <div class="item">
          <div class="layui-fluid">
            <div class="layui-row">
              <div class="layui-col-xs12 layui-col-sm4 layui-col-md5">
                <div class="img"><img src="../../res/img/p4.png" alt=""></div>
              </div>
              <div class="layui-col-xs12 layui-col-sm8 layui-col-md7">
                <div class="item-cont">
                  <h3>社团活动<button class="layui-btn layui-btn-danger new-icon">new</button></h3>
                  <h5>introduction</h5>
                  <p>在这里您可以及时地了解到社团发布的最新活动信息，歌唱比赛、定向越野、征文比赛，等你来撩！</p>
                  <a href="club_activity.jsp" class="go-icon"></a>
                </div>
            </div>
            </div>
           </div>
        </div>
        <div class="item">
          <div class="layui-fluid">
            <div class="layui-row">
              <div class="layui-col-xs12 layui-col-sm4 layui-col-md5">
                <div class="img"><img src="../../res/img/p5.png" alt=""></div>
              </div>
              <div class="layui-col-xs12 layui-col-sm8 layui-col-md7">
                <div class="item-cont">
                  <h3>学习资料<button class="layui-btn layui-btn-danger new-icon">new</button></h3>
                  <h5>introduction</h5>
                  <p>在这里有您需要的教材及其答案、试卷、代码、精品教程等电子版学习资料，好好学习，天天进步！</p>
                  <a href="study_online.jsp" class="go-icon"></a>
                </div>
            </div>
            </div>
           </div>
        </div>
      </div>

    </div>
  </div>
  <% 
  }
  %>
 
  <div class="footer-wrap" style="background-color:rgb(155,151,131);" >
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
    }).use(['element','laypage','jquery','menu'],function(){
      element = layui.element,laypage = layui.laypage,$ = layui.$,menu = layui.menu;
      laypage.render({
        elem: 'demo'
        ,count: 70 //数据总数，从服务端得到
      });
      menu.init();
    })
  </script>
</body>
</html>