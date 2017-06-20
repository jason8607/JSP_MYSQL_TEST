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
  String acc = (String)session.getAttribute("account");
  String password = request.getParameter("password");
  String name = request.getParameter("name");
  String birth = request.getParameter("birth");
  String email = request.getParameter("email");
  String phone = request.getParameter("phone");
  if(password!=null && name!=null & birth!=null){
    database.connectDB();
    database.editprofile(acc,password,name,birth,email,phone);
    session.setAttribute("password",password);
    session.setAttribute("name",name);
    session.setAttribute("birth",birth);
    session.setAttribute("email",email);
    session.setAttribute("phone",phone);
    response.sendRedirect("index.jsp");
  }
%>
