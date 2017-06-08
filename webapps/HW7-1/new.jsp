<%@ page language="java" contentType="text/html;charset=UTF-8;" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="database" class="com.database.Database">
  <jsp:setProperty property="ip" name="database" value="140.120.49.205" />
  <jsp:setProperty property="port" name="database" value="3306" />
  <jsp:setProperty property="db" name="database" value="4104029004" />
  <jsp:setProperty property="user" name="database" value="4104029004" />
  <jsp:setProperty property="password" name="database" value="Ss4104029004!" />
</jsp:useBean>
<%
 request.setCharacterEncoding("UTF-8");
 String url = "";
 String driver = "com.mysql.jdbc.Driver";
 ResultSet rs = null;
 try{
   database.connectDB();
   String sql = "select * from person;";
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
    <link rel="stylesheet" href="test2.css">
  </head>
<body align="center">
    <div class="container">
      <section id="content">
        <h1>註冊</h1>
		<div id="error" style="color:red;"></div>
        <form action="member.jsp" method="post">
          <p>帳號:<input name="account" id="account" type="text" autocomplete="off" onblur="check()" autofocus required/>
          <br>
          <p>密碼:<input name="password" id="password" type="password"  pattern="[A-Za-z0-9]{6,12}" title="請輸入6-12英文字母或數字" required/>
          <br>
          <p>姓名:<input name="name" type="text"  autocomplete="off"/>
          <br>
          <p>生日:<input name="birth" type="text"  autocomplete="off"/>
          <br>
          <p>信箱:<input name="email" type="text"  autocomplete="off"/>
          <br>
          <p>電話:<input name="phone" type="text"  autocomplete="off"/>
          <br>
          <div style="text-align:center !important">
            <input type="submit" id="regis" value="提交"/>
          </div>
        </form>
      </section>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript">
    function check() {
        var accountVal = $('input[name=account]').val();
        $.get('check.jsp', {
                acct: accountVal
            },
            function(data) {
                if (!data.includes("ok")) {
                    $('#error').removeClass('hidden');
                    $('#error').html(data);
                    $('#account').addClass('error');
                } else {
                    $('#account').removeClass('error');
                    $('#error').addClass('hidden');
                }
            }
        );
        return false;
    }
    </script>
  </body>
</html>
