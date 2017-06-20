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
String c_id = request.getParameter("c_id");
if(c_id!=null){
  database.connectDB();
  database.delComment(c_id);
}
String id = request.getParameter("id");
database.connectDB();
String sql="select*from animation where id="+ id;
database.query(sql);
ResultSet rs = database.getRS();
%>
<!DOCTYPE html>
<html>
  <head>
  <title>達拉崩巴動漫論壇</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.2/css/materialize.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.2/js/materialize.min.js"></script>
  </head>

    <%
    while(rs.next()){
      String title=rs.getString("title");
      String picture=rs.getString("picture");
      String type=rs.getString("type");
      String type2=rs.getString("type2");
      String date=rs.getString("date");
      String season=rs.getString("season");
      String description=rs.getString("description");
    %>
    <meta charset="utf-8">
    <title></title>

  <body>
    <div class="navbar-fixed">
      <nav>
      <div class="nav-wrapper" style="background-color:#03a9f4">
        <center>
        <h style="font-size:25px;font-weight:bold;"><%=title%></h>
      </center>
        </div>
    </nav>
  </div>
  <div>

    <div class="card ">
      <div class="card-image" >
        <img src="<%=picture%>" style="width:60vh;height:90vh;">
      </div>

        <div class="card-content">
          <h style="font-size:20px;font-weight:bold;"><%=title%></h>
          <p><%=description%></p>
        </div>
        </div>
    <%}%>
  </div>
  <%  String ss = (String)session.getAttribute("account");
    String access = (String)session.getAttribute("access");

      //    out.print(ss);
  %>
    留言:
    <%
    if(ss!=null){%>
      <form action="comment.jsp" method="post">
        <textarea  name="content"></textarea>
        <input type="text" name="ani_id" style="display:none" value="<%=id%>">
        <input type="submit" name="Submit" value="送出">
      </form>
    <%}%>


  <%
    sql = "select*from comment where ani_id='"+ id + "';";
    database.query(sql);
    rs = database.getRS();
    if(rs != null){
    while(rs.next()){
    String ani_id=rs.getString("ani_id");
    String acc_id=rs.getString("acc_id");
    String time=rs.getString("time");
    String content=rs.getString("content");
    String cid = rs.getString("cid");
  %>

  <div class="col s6">

  <div class="card horizontal">

    <div class="card-image" style="padding:2vh;">
    </div>
    <div class="card-stacked">
      <div class="card-content">
        <h style="font-size:40px;font-weight:bold;"></h>
        <p> <%=acc_id%>:<%=content%></p>
        <p style="float:left;">留言時間:<%=time%>
        <%
        if(acc_id.equals(ss) || access.equals("manager")){
          %><p id="del"  onclick="del(<%=cid%>)" style="color:grey;cursor: pointer;" class="right-align">刪除</p><%
        }
        %>
        </p>
      </div>
      </div>
  </div>
</div>

  <%}}%>
    <div class="fixed-action-btn">
        <a class="btn-floating btn-large blue" onclick="window.open('index.jsp','_self');">
          <i class="large material-icons">replay</i>
        </a>
      </div>
      <br><br><br><br>
    <script>
      function del(cid){
        var r = confirm("確認刪除該留言？");
        if (r == true) {
          $.post("detail.jsp",{c_id:cid},function(data){
            window.open('detail.jsp?id=<%=id%>','_self')
          });
        }
      }
    </script>
  </body>
</html>
