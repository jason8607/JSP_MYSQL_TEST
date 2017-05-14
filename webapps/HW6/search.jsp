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
 }catch(Exception ex){
   out.println(ex);
 }
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>查詢</title>
    <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.2.4.min.js"></script>
    <link rel="stylesheet" href="test2.css">
  </head>
<body align="center">
  <h1>查詢結果</h1>
    <table align= "center">
      <tr><th colspan="4">會員資料</th></tr>
      <tr>
        <th>姓名</th><th>生日</th><th>E-mail</th><th>電話號碼</th>
        <%
          try { rs.close();database.closeDB(); } catch (Exception e) { /* ignored */ }
          try{
            database.connectDB();
            String sql = "select * from person;";
            database.query(sql);
            rs = database.getRS();
          }catch(Exception ex){
            out.println(ex);
          }
          if(rs!=null){
            while(rs.next()){
              %>
              <tr>
                <td><%=rs.getString("name")%></td>
                <td><%=rs.getString("birth")%></td>
                <td><%=rs.getString("email")%></td>
                <td><%=rs.getString("phone")%></td>
              </tr>
              <%
            }
          try { rs.close();database.closeDB(); } catch (Exception e) { /* ignored */ }
          }
        %>
      </tr>
    </table>
    <br>
      <input type="button" onclick="history.back()" value="返回前一頁"/>
  </body>
</html>
