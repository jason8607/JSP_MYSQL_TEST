<%@ page language="java" contentType="text/html;charset=UTF-8;" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>登入頁面</title>
    <link href='http://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">


  <link rel="stylesheet" href="css/style.css">
  </head>
  <body>


    <div class="form">
    	<section id="login">
        <div  class="tt">
        <h1>登入</h1>
        <form action="member.jsp" method="post">
        </div>
          <div class="field-wrap">
            <label>
              帳號<span class="req">*</span>
            </label>
          <input type="text" name="account" id="username" autocomplete="off" autofocus required  />
        </div>

          <br>
            <div class="field-wrap">
                <label>
                  密碼<span class="req">*</span>
                </label>
                <input type="password"  required autocomplete="off" name="password" id="password"  required pattern="[A-Za-z0-9]{6,12}" title="請輸入6-12英文字母或數字"/>
              </div>
          <br>
            <form action="member.jsp" method="POST">
          <button type="submit" class="button button-block"/>登入</button>
              </form>
          <button class="button button-block" onclick="window.open('new.jsp','_self')" value="註冊"/>註冊</button>
        </section>
      </div>
    </form>
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
      <script src="js/index.js"></script>
  </body>
</html>
