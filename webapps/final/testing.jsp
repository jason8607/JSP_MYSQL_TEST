<%@  page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@  page language="java" import="java.sql.*" %>
<jsp:useBean id="database" class="com.database.Database">
<jsp:setProperty property="ip" name="database" value="140.120.49.205" />
<jsp:setProperty property="port" name="database" value="3306" />
<jsp:setProperty property="db" name="database" value="team4" />
<jsp:setProperty property="user" name="database" value="team4" />
<jsp:setProperty property="password" name="database" value="NCHUTeam4!" />
</jsp:useBean>
<%@ page language="java"
    import="org.json.JSONObject"
    import="org.json.JSONArray"
    import="org.json.JSONException"
    import="java.util.*"
    import="java.text.*"
%>
<%
  request.setCharacterEncoding("UTF-8");
  response.setHeader("Access-Control-Allow-Origin", "*");
    // 輸出 JSON 格式
    response.setContentType("application/json");
    // 建立 JSONArray
    JSONArray list = new JSONArray();
    // 建立 JSONObject

    // 建立日期格式
    SimpleDateFormat df = new SimpleDateFormat("YYYY/MM/dd HH:mm:ss");
    // 建立一筆資料
    String year = request.getParameter("year");
    // 建立一筆資料
    String sql ="";
    database.connectDB();
    if(year.equals("all")){
      sql = "select * from animation ;";
    }else{
      sql = "select * from animation where date = '" + year + "';";
    }
    database.query(sql);
    ResultSet rs = database.getRS();

    if(rs!=null){
      while(rs.next()){
        JSONObject object = new JSONObject();
        object.put("id", rs.getString("id"));
        object.put("title", rs.getString("title"));
        object.put("type", rs.getString("type"));
        object.put("type2", rs.getString("type2"));
        object.put("date", rs.getString("date"));
        object.put("season", rs.getString("season"));
        object.put("description", rs.getString("description"));
        object.put("picture", rs.getString("picture"));
        list.put(object);
      }
    }

    out.println(list);
%>
