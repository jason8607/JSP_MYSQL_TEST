<%@ page language="java" contentType="text/html;charset=UTF-8;" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>
<%
  session.invalidate();
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>登入頁面</title>
    <link rel="stylesheet" href="test2.css">
  </head>
  <body align="center">
    <div class="container">
    	<section id="content">
        <h1>登入</h1>
        <form action="session.jsp" method="post">
          <p>帳號:
          <input type="text" name="account" id="username"  autocomplete="off" autofocus required />
          <br>
          <p>密碼:
          <input type="password" name="password" id="password" required pattern="[A-Za-z0-9]{6,12}" title="請輸入6-12英文字母或數字"/>
          <br>
          <br>
          <input type="submit" value="登入"/ class="bbutton">
          <input type="button" onclick="window.open('new.jsp','_self')" value="註冊" class="bbutton"/>
        </section>
      </div>
    </form>
  </body>
</html>
