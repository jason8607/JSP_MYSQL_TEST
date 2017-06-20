<%@page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@page language="java" import="java.sql.*"%>

<%

    try{

        Class.forName("com.mysql.jdbc.Driver");
        Connection con =(Connection) DriverManager.getConnection("jdbc:mysql://140.120.49.205:3306/team4","team4","NCHUTeam4!");
            PreparedStatement pps = con.prepareStatement("SELECT  * FROM member WHERE " +
                    "account = ?");
            pps.setString(1,request.getParameter("account"));
            ResultSet rs = pps.executeQuery();
            if(rs.first()){
                out.println("帳號已存在");
            }else{
                out.println("帳號可使用");

            }
        }catch (Exception e){
            System.out.println(e);
        }
%>
