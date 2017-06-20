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
 String account = request.getParameter("account");
 String password = request.getParameter("password");
 String name = request.getParameter("name");
 String birth = request.getParameter("birth");
 String email = request.getParameter("email");
 String phone = request.getParameter("phone");
 String rqname = request.getParameter("account");
 session.setAttribute("account", rqname);
 int x = 0;int y = 0;
 String message="";
 //註冊帳號區
 if(account !=null && password !=null && name !=null && birth !=null && email !=null && phone !=null){
   try{
     database.connectDB();
     String sql = "select * from member;";
     database.query(sql);
     rs = database.getRS();
     if(rs!=null){
       while(rs.next()){
         String accountData = rs.getString("account");
         if(account.equals(accountData)){
           y+=1;
           break;
         }
       }
       if(y!=0){
         message="註冊失敗";
       }else{
         database.creatAccount(account,password,name,birth,email,phone);
         message="註冊成功";
         }
       }
     }catch(Exception ex){
       out.println(ex);
     }
   }else{
    message="登入成功！";
  }
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
    <title>會員管理</title>
    <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.2.4.min.js"></script>
    <link rel="stylesheet" href="css/style.css">
    <link href="bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
  </head>
  <body>
    <div class="container">
      <section id="content">
          <form>
          <%
          //成功登入
          if(rs!=null && y==0){

            while(rs.next()){
              if(account.equals(rs.getString("account"))){
                if(password.equals(rs.getString("password"))){
                  String accountt=rs.getString("account");
                  String namet=rs.getString("name");
                  String birtht=rs.getString("birth");
                  String emailt=rs.getString("email");
                  String phonet=rs.getString("phone");
                  session.setAttribute("access",rs.getString("access"));
                  session.setAttribute("password",rs.getString("password"));
                  session.setAttribute("name",rs.getString("name"));
                  session.setAttribute("birth",rs.getString("birth"));
                  session.setAttribute("email",rs.getString("email"));
                  session.setAttribute("phone",rs.getString("phone"));
                  %>
                  <div class="form">
        <h1 id="test"><%=message%></h1>
                    <h1> 歡迎回來：<%=namet%></h1>
                        <br>
  <input type="button" id="login"   class="button"  onclick="window.open('index.jsp','_self')" value="進入論壇"/>

                    </div>

                  <%
                  x+=1;
                  break;
                }
              }
            }
          }
          //成功登入
          %>

          <%if(x==0 && y==0){%>
          <div class="form">
          <h1 id="test"><%=message%></h1>
            <script>$("#test").html("登入失敗");</script>
            <h1>帳號或密碼錯誤</h1>
              <br>
            <input type="button" class="button" onclick="window.open('new.jsp','_self')" value="創建新賬號"/>
          </div>
        <%}%>
          <%if(y!=0){%>
          <div class="form">
            <h1 id="test"><%=message%></h1>
            <h1>帳號已被使用</h1>
            <br>
            <input type="button" class="button" onclick="history.back()" value="返回註冊頁面"/>
            <input type="button" class="button" onclick="window.open('index.jsp','_self')" value="回到登入畫面"/>
            </div>
        <%}%>
      </form>
    </section>
    </div>
  </body>
</html>
