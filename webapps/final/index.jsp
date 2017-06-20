<%@  page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@  page language="java" import="java.sql.*" %>
<jsp:useBean id="database" class="com.database.Database">
<jsp:setProperty property="ip" name="database" value="140.120.49.205" />
<jsp:setProperty property="port" name="database" value="3306" />
<jsp:setProperty property="db" name="database" value="team4" />
<jsp:setProperty property="user" name="database" value="team4" />
<jsp:setProperty property="password" name="database" value="NCHUTeam4!" />
</jsp:useBean>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<%
database.connectDB();
database.query("select*from animation");
ResultSet rs = database.getRS();
%>
<!DOCTYPE html>
<html>
  <head>
  <title>達拉崩巴動漫論壇</title>
       <link rel="icon" type="image/png" sizes="16x16" href="http://blog.iconfactory.com/wp-content/uploads/2015/10/IF-pin1.png">
    <style type="text/css">

    #mwt_mwt_slider_scroll
    {
    	top: 0;
    	left:-360px;
    	width:360px;
    	position:fixed;
    	z-index:9999;
    }

    #mwt_slider_content{
    	background:#3c5a98;
    	text-align:center;
    	padding-top:20px;
      color:#ffffff;
      font-size:50px;
    }

    #mwt_fb_tab {
    	position:absolute;
    	top:20px;
    	right:-24px;
    	width:24px;
    	background:#3c5a98;
    	color:#ffffff;
    	font-family:Arial, Helvetica, sans-serif;
    	text-align:center;
    	padding:100px 0;

    	-moz-border-radius-topright:10px;
    	-moz-border-radius-bottomright:10px;
    	-webkit-border-top-right-radius:10px;
    	-webkit-border-bottom-right-radius:10px;
    }
    #mwt_fb_tab span {
    	display:block;
    	height:12px;
    	padding:30px 0;
    	line-height:12px;
    	text-transform:uppercase;
    	font-size:20px;
    }

    input[type="submit"]{
     padding: 9px 39px 8px 39px;
     color: #99BBFF;
     background-color: #000044;
     font-size: 18px;
     text-align: center;
     font-style: normal;
     border-radius: 10px;
     width: 49%;
     border: 1px groove #000022;
     border-width: 1px 1px 3px;
     box-shadow: 0 -1px 0 rgba(255,255,255,0.1) inset;
     margin-bottom: 10px;
   }

   input[type="logbot"]{
    padding: 9px 39px 8px 39px;
    color: #BBFFEE;
    background-color: #4bc970;
    font-size: 18px;
    text-align: center;
    font-style: normal;
    border-radius: 10px;
    width: 49%;
    border: 1px groove #BBFFEE;
    border-width: 1px 1px 3px;
    box-shadow: 0 -1px 0 rgba(255,255,255,0.1) inset;
    margin-bottom: 10px;
  }




    </style>
    <script type='text/javascript' src='https://code.jquery.com/jquery-1.9.1.min.js'></script>
<script type='text/javascript'>
$(function(){
	var w = $("#mwt_slider_content").width();
	$('#mwt_slider_content').css('height', ($(window).height() - 20) + 'px' ); //將區塊自動撐滿畫面高度

	$("#mwt_fb_tab").mouseover(function(){ //滑鼠滑入時
		if ($("#mwt_mwt_slider_scroll").css('left') == '-'+w+'px')
		{
			$("#mwt_mwt_slider_scroll").animate({ left:'0px' }, 600 ,'swing');
		}
	});


	$("#mwt_slider_content").mouseleave(function(){　//滑鼠離開後
		$("#mwt_mwt_slider_scroll").animate( { left:'-'+w+'px' }, 600 ,'swing');
	});
});

  $(document).ready(function() {
    $('select').material_select();
  });

  $(document).ready(function() {
    $('checkbox').material_select();
  });

  $(document).ready(function() {
    $('Radio').material_select();
    $('.carousel').carousel();
    $('.carousel.carousel-slider').carousel({fullWidth: true});
  });
</script>
    <head>
      <meta charset="UTF-8">
      <title></title>
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.2/css/materialize.min.css">
      <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.2/js/materialize.min.js"></script>
  </head>
  <body>

    <!-- 側拉選單-->
       <div id="mwt_mwt_slider_scroll">
        <div id="mwt_fb_tab">
           <span>選</span>
           <span>單</span>
       </div>
       <!-- 選單內部-->
       <div id="mwt_slider_content">


         <%

                String sesname = (String) session.getAttribute("account");
                String sesacs  = (String) session.getAttribute("access");
                String name = (String) session.getAttribute("name");
                if(sesname!=null){

                    if(sesacs.equals("manager")){
                      %>  <input type="submit" value="管理後台"  onClick="window.open('admin/page/index.jsp','_self')"  class="button"><%
                    }
                  %>
<!-- 登入後側拉選單-->
                    <h3>  歡迎回來:<h3><%=name%>
                    <form action="logout.jsp" method="post" >
                    <input type="submit" value="登出"  onClick="alert('您已成功登出')">
                    </form>
                    <input type="submit" value="賬號管理"  onClick="window.open('profile.jsp','_self')">
                      <%if(sesacs.equals("premium")||sesacs.equals("manager")){
                      %>  <input type="submit" value="尊貴會員專區"  onClick="window.open('https://google.com','_self')"  class="button"><%
                    }%>
                    <!-- 登入後側拉選單--><%
                    }
                    //登入前側拉選單
                    else{
                        out.print("尚未登入");
      %>   <input type="submit" value="登入"  onClick="window.open('login.jsp','_self')">
           <input type="submit" value="註冊"  onClick="window.open('new.jsp','_self')"  >
      <%
                    }
                    //登入前側拉選單
                %>
  <!-- 非登入功能-->
  <h3>  年份篩選:<h3>
  <select id="year" name="year"  method="post"  >
<!--      <option value="null">全選</option> -->
      <option value="all">All</option>
      <option value="2011">2011</option>
      <option value="2012">2012</option>
      <option value="2013">2013</option>
      <option value="2014">2014</option>
      <option value="2015">2015</option>
      <option value="2016">2016</option>
      <option value="2017">2017</option>
  </select>
  <input type="submit" value="送出" onclick="selectYear()"></input>
  <!-- 非登入功能-->
       </div>
              <!-- 選單內部-->
       </div>
    <!-- 側拉選單-->

 <!-- 上標-->


    <div class="navbar-fixed" >

      <nav>
  	  <div class="nav-wrapper" style="background-color:#03a9f4">
  	    <center>
  		  <h style="font-size:25px;font-weight:bold;">作品列表</h>
  		</center>

        </div>
  	</nav>
  </div>

 <!-- 上標-->
 <div class="carousel">
    <a class="carousel-item" href="detail.jsp?id=3"><img src="http://re-zero-anime.jp/assets/news/news22.jpg"></a>
    <a class="carousel-item" href="detail.jsp?id=2"><img src="http://livedoor.blogimg.jp/sokudokuex/imgs/c/a/ca980e0b.jpg"></a>
    <a class="carousel-item" href="detail.jsp?id=4"><img src="http://img8.dm530.net/pic/uploadimg/2015-4/2798.jpg"></a>
    <a class="carousel-item" href="detail.jsp?id=27"><img src="http://www.jparadise.com.tw/app/webroot/userfiles/images/MEIDO.jpg"></a>
    <a class="carousel-item" href="detail.jsp?id=26"><img src="https://myanimelist.cdn-dena.com/images/anime/9/80417.jpg"></a>
  </div>
<div id="testing">
  <div class="row">

    <% if(rs != null){
    while(rs.next()){
    String id=rs.getString("id");
    String title=rs.getString("title");
    String picture=rs.getString("picture");
    String type=rs.getString("type");
    String type2=rs.getString("type2");
    String date=rs.getString("date");
    String season=rs.getString("season");
    String description=rs.getString("description");

    %>

    <div class="col s6">
    <div class="card horizontal">

      <div class="card-image" style="padding:2vh;">
        <img src="<%=picture%>" style="width:18vh;height:30vh;">
      </div>
      <div class="card-stacked">
        <div class="card-content">
          <h style="font-size:20px;font-weight:bold;"><%=title%></h>
          <p>類型: <%=type%>、<%=type2%></p>
          <p>番別: <%=date%><%=season%></p>
        </div>
        <div class="card-action">
          <a href="detail.jsp?id=<%=id%>">詳細資訊</a>
        </div>
        </div>
    </div>
  </div>

    <%}}%>

  </div>
</div>
  <script language="JavaScript">
  function selectYear(){
    //取得 "username" 欄位值
    var year = $('#year').val();
      $.ajax({
          //告訴程式表單要傳送到哪裡
          url:"testing.jsp",
          //需要傳送的資料
          data:"&year="+year,
           //使用POST方法
          type : "POST",
          //接收回傳資料的格式，在這個例子中，只要是接收true就可以了
          dataType:'json',
           //傳送失敗則跳出失敗訊息
          error:function(){
          //資料傳送失敗後就會執行這個function內的程式，可以在這裡寫入要執行的程式
          alert("失敗");
          },
          //傳送成功則跳出成功訊息
          success:function(result){
          //資料傳送成功後就會執行這個function內的程式，可以在這裡寫入要執行的程式
          console.log(result);
          $("#testing").html("");
          $("#testing").append("<div id='testing2' class='row'></div>");
          for(var i = 0 ; i < result.length ; i++)
          {
              $("#testing2").append(
                  "<div class='col s6'>" +
                  "<div class='card horizontal'>"+

                    "<div class='card-image' style='padding:2vh;'>"+
                      "<img src='" + result[i].picture + "' style='width:18vh;height:30vh;'>"+
                    "</div>"+
                    "<div class='card-stacked'>"+
                      "<div class='card-content'>"+
                        "<h style='font-size:25px;font-weight:bold;'>"+ result[i].title +"</h>"+
                        "<p>類型: "+ result[i].type +"、"+ result[i].type2 +"</p>"+
                        "<p>番別: "+ result[i].date +"、"+ result[i].season +"</p>"+
                      "</div>"+
                      "<div class='card-action'>"+
                        "<a href='detail.jsp?id="+ result[i].id +"'>詳細資訊</a>"+
                      "</div>"+
                  "</div>"+
                "</div>"+
             "</div>"
              );
          }
          }
      });

  };</script>
  </body>
</html>
