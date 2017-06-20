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
  String comment = request.getParameter("content");
  String ani_id = request.getParameter("ani_id");
  String acc_id = (String)session.getAttribute("account");
  if(comment!=null){
    try{
      database.connectDB();
      database.sendComment(ani_id,acc_id,comment);
      response.sendRedirect("detail.jsp?id=" + ani_id);
    }catch(Exception ex){
      out.println(ex);
    }
  }
%>
