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
 String account = request.getParameter("account");
 String password = request.getParameter("password");
 String name = request.getParameter("name");
 String birth = request.getParameter("birth");
 String email = request.getParameter("email");
 String phone = request.getParameter("phone");
 String check = (String)session.getAttribute("check");
 int x = 0;int y = 0;
 String message="";
 if(account !=null && password !=null && name !=null && birth !=null && email !=null && phone !=null){
   try{
     database.connectDB();
     String sql = "select * from person;";
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
         database.insertData(account,password,name,birth,email,phone);
         session.setAttribute("check","ok");
         session.setAttribute("account",account);
         session.setAttribute("password",password);
         check = (String)session.getAttribute("check");
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
   String sql = "select * from person;";
   database.query(sql);
   rs = database.getRS();
   if(check.equals("ok")){
     account = (String)session.getAttribute("account");
     password = (String)session.getAttribute("password");
   }
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
    <link rel="stylesheet" href="test2.css">
  </head>
<body align="center">
    <div class="container">
      <section id="content">
        <h1 id="test"><%=message%></h1>
          <form>
          <%
          if(rs!=null && y==0){
            while(rs.next()){
              if(account.equals(rs.getString("account"))){
                if(password.equals(rs.getString("password"))){
                  String namet=rs.getString("name");
                  String birtht=rs.getString("birth");
                  String emailt=rs.getString("email");
                  String phonet=rs.getString("phone");
                  %>
                  <p><%out.println("你好,");%>
                  <%out.println(namet);%></p>
                  <table align= "center">
                  <tr>
                    <th>姓名</th>
                    <td><%=namet%></td>
                 </tr>

                  <tr>
                    <th>生日</th>
                    <td><%=birtht%></td>
                  </tr>

                  <tr>
                    <th>E-Mail</th>
                    <td><%=emailt%></td>
                 </tr>

                 <tr>
                   <th>電話</th>
                   <td><%=phonet%></td>
                </tr>
                </table>
                <br>
                  <br>
                    <input type="button"  id="search" value="查詢會員資料" onclick="location.href='search.jsp'">
                  <input type="button" id="login" onclick="window.open('index.jsp','_self')" value="返回登入畫面"/>
                  <%
                  x+=1;
                  break;
                }
              }
            }
          }
          %>


          <%if(x==0 && y==0){%>
            <script>$("#test").html("登入失敗");</script>
            <p>帳號或密碼錯誤</p>
            <input type="button" onclick="history.back()" value="返回登入頁面"/>
            <input type="button" onclick="window.open('new.jsp','_self')" value="創建新賬號"/>
          <%}%>


          <%if(y!=0){%>
            <p>帳號已被使用</p>
            <br>
            <input type="button" onclick="history.back()" value="返回註冊頁面"/>
            <input type="button" onclick="window.open('index.jsp','_self')" value="返回登入畫面"/>
        <%}%>
      </form>
    </section>
    </div>
  </body>
</html>
