<%@  page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@  page language="java" import="java.sql.*" %>
<jsp:useBean id="database" class="com.database.Database">
<jsp:setProperty property="ip" name="database" value="140.120.49.205" />
<jsp:setProperty property="port" name="database" value="3306" />
<jsp:setProperty property="db" name="database" value="team4" />
<jsp:setProperty property="user" name="database" value="team4" />
<jsp:setProperty property="password" name="database" value="NCHUTeam4!" />
</jsp:useBean>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.2.4.min.js"></script>
<script language="JavaScript">



</script>
<%  try{

      session.invalidate();
     response.sendRedirect("index.jsp");
      }catch (Exception e){
          System.out.println(e);
      }

%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title></title>
  </head>
  <body>

  </body>
</html>
