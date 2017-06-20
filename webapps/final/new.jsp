<%@  page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@  page language="java" import="java.sql.*" %>
<jsp:useBean id="database" class="com.database.Database">
<jsp:setProperty property="ip" name="database" value="140.120.49.205" />
<jsp:setProperty property="port" name="database" value="3306" />
<jsp:setProperty property="db" name="database" value="team4" />
<jsp:setProperty property="user" name="database" value="team4" />
<jsp:setProperty property="password" name="database" value="NCHUTeam4!" />
</jsp:useBean>
<%
 request.setCharacterEncoding("UTF-8");
 String url = "";
 String driver = "com.mysql.jdbc.Driver";
 ResultSet rs = null;
 try{
   database.connectDB();
   String sql = "select * from member;";
   database.query(sql);
   rs = database.getRS();
 }catch(Exception ex){
   out.println(ex);
 }
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>註冊</title>
    <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
    <link rel="stylesheet" href="css/style.css">
  </head>
  <body>
    <div class="form">
        <h1>註冊</h1>
        <form action="member.jsp" method="post" name="regF">
           <div class="field-wrap">
    <span id="isE"></span>
       <br>
          <label>
            帳號<span class="req">*</span>
          </label>
          <input name="account" type="text"  onblur="checkExist()" autofocus required/>

    </div>

          <br>
             <div class="field-wrap">
               <label>
                 密碼<span class="req">*</span>
               </label>
          <input name="password" id="password" type="password"  pattern="[A-Za-z0-9]{6,12}" title="請輸入6-12英文字母或數字" required/>
    </div>
          <br>
             <div class="field-wrap">
               <label>
                 暱稱<span class="req">*</span>
               </label>
          <input name="name" type="text"  autocomplete="off"/>
    </div>
          <br>
             <div class="field-wrap">
               <label>
                 生日(YYYY/MM/DD)<span class="req">*</span>
               </label>
          <input name="birth" type="text"  autocomplete="off"/>
    </div>
          <br>
             <div class="field-wrap">
               <label>
                 電子郵件<span class="req">*</span>
               </label>
          <input name="email" type="text" autocomplete="off"/>
    </div>
          <br>
             <div class="field-wrap">
               <label>
                 電話號碼<span class="req">*</span>
               </label>
          <input name="phone" type="text" autocomplete="off"/>
    </div>
          <br>
          <div style="text-align:center !important">
            <input type="submit" id="regis" class="button" value="提交"/>
          </div>
        </form>
    </div>
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
      <script src="js/index.js"></script>
      <script language="JavaScript">
  function checkExist(){
          var xmlhttp = new XMLHttpRequest();
          var account = document.forms["regF"]["account"].value;
          var url = "check.jsp?account=" + account;
          xmlhttp.onreadystatechange = function(){
              if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
                  if(xmlhttp.responseText.length == 27)
                      document.getElementById("isE").style.color = "#AA0000";
                  else
                      document.getElementById("isE").style.color = "#AA0000";
                  document.getElementById("isE").innerHTML = xmlhttp.responseText;
              }
          };
          try{
          xmlhttp.open("GET",url,true);
          xmlhttp.send();
      }catch(e){alert("unable to connect to server");
      }
   }
  </script>
  </body>
</html>
