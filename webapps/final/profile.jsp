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
  String access = (String)session.getAttribute("access");
  String password = (String)session.getAttribute("password");
  String name = (String)session.getAttribute("name");
  String birth = (String)session.getAttribute("birth");
  String email = (String)session.getAttribute("email");
  String phone = (String)session.getAttribute("phone");
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>會員管理</title>
    <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.2.4.min.js"></script>
    <link rel="stylesheet" href="css/style.css">
    <link href="bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
  </head>
  <body>
    <div class="form">
        <h1>會員資料修改</h1>
        <form action="editprofile.jsp" method="post" name="regF">
             <div class="field-wrap">
               <label>
                 密碼<span class="req">*</span>
               </label>
          <input name="password" id="password" type="password"  pattern="[A-Za-z0-9]{6,12}" title="請輸入6-12英文字母或數字" required value="<%=password%>"/>
    </div>
          <br>
             <div class="field-wrap">
               <label>
                 暱稱<span class="req">*</span>
               </label>
          <input name="name" type="text" value="<%=name%>" autocomplete="off"/>
    </div>
          <br>
             <div class="field-wrap">
               <label>
                 生日(YYYY/MM/DD)<span class="req">*</span>
               </label>
          <input name="birth" type="text"  value="<%=birth%>" autocomplete="off"/>
    </div>
          <br>
             <div class="field-wrap">
               <label>
                 電子郵件<span class="req">*</span>
               </label>
          <input name="email" type="text" value="<%=email%>" autocomplete="off"/>
    </div>
          <br>
             <div class="field-wrap">
               <label>
                 電話號碼<span class="req">*</span>
               </label>
          <input name="phone" type="text" value="<%=phone%>"autocomplete="off"/>
    </div>
          <br>
          <div style="text-align:center !important">
            <input type="submit" id="regis" class="button" value="提交"/>
          </div>
        </form>
    </div>
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
      <script src="js/index.js"></script>
      <script>
      $(document).ready(function() {
        $('input').keyup();
      });
      </script>
  </body>
</html>
