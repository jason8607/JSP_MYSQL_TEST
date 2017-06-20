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
database.connectDB();
request.setCharacterEncoding("UTF-8");

String p_id = request.getParameter("id");
String p_title = request.getParameter("title");
String p_type = request.getParameter("type");
String p_type2 = request.getParameter("type2");
String p_date = request.getParameter("date");
String p_season = request.getParameter("season");
String p_description = request.getParameter("description");
String p_picture = request.getParameter("picture");
if( p_id !=null && p_title !=null && p_type !=null && p_type2 !=null && p_date !=null && p_season !=null && p_description !=null && p_picture !=null){
database.connectDB();
database.editData(p_id,p_title,p_type,p_type2,p_description,p_date,p_season,p_picture);
}

database.query("select*from animation;");
ResultSet rs = database.getRS();


%>
<!DOCTYPE html>
<html lang="zh-hant">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" type="image/png" sizes="16x16" href="../plugins/images/favicon.png">
    <title>管理後台</title>
    <!-- Bootstrap Core CSS -->
    <link href="bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Menu CSS -->
    <link href="../plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.css" rel="stylesheet">
    <!-- animation CSS -->
    <link href="css/animate.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="css/style.css" rel="stylesheet">
    <!-- color CSS -->
    <link href="css/colors/default.css" id="theme" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<style>
  html{
  overflow-y: scroll;
  }
</style>
</head>

<body class="fix-header">
    <!-- ============================================================== -->
    <!-- Preloader -->
    <!-- ============================================================== -->
    <div class="preloader">
        <svg class="circular" viewBox="25 25 50 50">
            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10" />
        </svg>
    </div>
    <!-- ============================================================== -->
    <!-- Wrapper -->
    <!-- ============================================================== -->
    <div id="wrapper">
        <!-- ============================================================== -->
        <!-- Topbar header - style you can find in pages.scss -->
        <!-- ============================================================== -->
        <nav class="navbar navbar-default navbar-static-top m-b-0">
            <div class="navbar-header">
                <div class="top-left-part">
                    <!-- Logo -->
                    <a class="logo" href="index.jsp"></a>
                    <h style="font-size:25px;">作品後台管理</h>

                </div>
            </div>
            <!-- /.navbar-header -->
            <!-- /.navbar-top-links -->
            <!-- /.navbar-static-side -->
        </nav>
        <!-- End Top Navigation -->
        <!-- ============================================================== -->
        <!-- Left Sidebar - style you can find in sidebar.scss  -->
        <!-- ============================================================== -->
        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav slimscrollsidebar">
                <div class="sidebar-head">
                    <h3><span class="fa-fw open-close"><i class="ti-close ti-menu"></i></span> <span class="hide-menu">Navigation</span></h3>
                </div>
                <ul class="nav" id="side-menu">
                    <li style="padding: 70px 0 0;">
                        <a href="index.jsp" class="waves-effect"><i class="fa fa-clock-o fa-fw" aria-hidden="true"></i>資料管理</a>
                    </li>
                    <li >
                        <a href="editmember.jsp" class="waves-effect"><i class="fa fa-clock-o fa-fw" aria-hidden="true"></i>會員資料管理</a>
                    </li>
                  </ul>
            </div>
        </div>
        <!-- ============================================================== -->
        <!-- End Left Sidebar -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Page Content -->
        <!-- ============================================================== -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row bg-title">
                    <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                        <h4 class="page-title">資料管理</h4> </div>
                    <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                        <ol class="breadcrumb">
                            <li><a href="#">後台管理系統</a></li>
                            <li class="active"><a href="#">資料管理</a></li>
                        </ol>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /row -->
                <div class="row">
                    <div class="col-sm-12">
                        <div class="white-box">
                            <h3 class="box-title">資料表單</h3>
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">
                              新增資料
                            </button>
                             <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>id</th>
                                            <th>名稱</th>
                                            <th>類型1</th>
                                            <th>類型2</th>
                                            <th>年份</th>
                                            <th>季份</th>
                                            <th>描述</th>
                                            <th>縮圖</th>
                                            <th>刪除資料</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                      <%
                                     if (rs !=null){
                                       while(rs.next()){
                                         String id=rs.getString("id");
                                         String title=rs.getString("title");
                                         String picture=rs.getString("picture");
                                         String type=rs.getString("type");
                                         String type2=rs.getString("type2");
                                         String date=rs.getString("date");
                                         String season=rs.getString("season");
                                         String description=rs.getString("description");
                                      %>
                                        <tr>
                                          <form id="form<%=id%>" action="index.jsp" method="POST">
                                            <td><%=id%></td>
                                            <td id="title<%=id%>"><%=title%></td>
                                            <td id="type<%=id%>"><%=type%></td>
                                            <td id="type2<%=id%>"><%=type2%></td>
                                            <td id="date<%=id%>"><%=date%></td>
                                            <td id="season<%=id%>"><%=season%></td>
                                            <td id="description<%=id%>"><%=description%></td>
                                            <td id="picture<%=id%>"><img id="picURL<%=id%>" src="<%=picture%>" width=50></td>
                                            <td>
                                            <button type="button" id="edit<%=id%>" class="btn btn-primary">修改</button>
                                            </td>
                                            <td>
                                            <button id="delete<%=id%>"  type="button" class="btn btn-danger">刪除</button>
                                            </td>
                                          </form>
                                        </tr>
                                        <%}}%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel1" style="display: none;">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                                <h4 class="modal-title" id="exampleModalLabel1">新增動畫資料</h4> </div>
                            <div class="modal-body">
                                <form action="new.jsp" method="post">
                                  <div class="form-group">
                                    <label for="title" class="control-label">名稱</label>
                                    <input type="text" class="form-control" name="title">
                                  </div>
                                  <div class="form-group">
                                      <label for="type" class="control-label">類型1</label>
                                      <input type="text" class="form-control" name="type">
                                  </div>
                                  <div class="form-group">
                                      <label for="type2" class="control-label">類型2</label>
                                      <input type="text" class="form-control" name="type2">
                                  </div>
                                  <div class="form-group">
                                      <label for="description" class="control-label">描述</label>
                                      <input type="text" class="form-control" name="description">
                                  </div>
                                  <div class="form-group">
                                      <label for="date" class="control-label">年份</label>
                                      <input type="text" class="form-control" name="date">
                                  </div>
                                  <div class="form-group">
                                      <label for="season" class="control-label">季份</label>
                                      <input type="text" class="form-control" name="season">
                                  </div>
                                  <div class="form-group">
                                      <label for="picture" class="control-label">圖片連結</label>
                                      <textarea class="form-control" name = "picture"></textarea>
                                  </div>
                                  <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">關閉</button>
                                    <input type="submit" class="btn btn-primary" value="新增作品">
                                  </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
            <footer class="footer text-center"> 2017 &copy;動漫論壇</footer>
        </div>
        <!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->
    <!-- jQuery -->
    <script src="../plugins/bower_components/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- Menu Plugin JavaScript -->
    <script src="../plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.js"></script>
    <!--slimscroll JavaScript -->
    <script src="js/jquery.slimscroll.js"></script>
    <!--Wave Effects -->
    <script src="js/waves.js"></script>
    <!-- Custom Theme JavaScript -->
    <script src="js/custom.min.js"></script>
    <script>
    $(document).ready(function(){
$("button").on("click",function(){
var click_text=  $(this).text();
switch(click_text){
  case"修改":
  var id =$(this).attr("id").split("edit")[1];
  $("#title"+id).html('<input type = "text" name = "title" id = "input_title' +id+ '"value="'+$("#title"+id).text()+'"/>');
  $("#type"+id).html('<input type = "text" name = "type" id = "input_type' +id+ '"value="'+$("#type"+id).text()+'"/>');
  $("#type2"+id).html('<input type = "text" name = "type2" id = "input_type2' +id+ '"value="'+$("#type2"+id).text()+'"/>');
  $("#date"+id).html('<input type = "text" name = "date" id = "input_date' +id+ '"value="'+$("#date"+id).text()+'"/>');
  $("#season"+id).html('<input type = "text" name = "season" id = "input_season' +id+ '"value="'+$("#season"+id).text()+'"/>');
  $("#picture"+id).html('<input type = "text" name = "picture" id = "input_picture' +id+ '"value="'+$("#picURL"+id).attr("src")+'"/>');
  $("#description"+id).html('<textarea name="description" id = "input_description' +id+ '"value="'+$("#description"+id).text()+'">' +$("#description"+id).text()+'</textarea>');
  $(this).attr("id","storeEdit"+id);
  $(this).html("儲存");
  break;
  case "儲存":
  var id=$(this).attr("id").split("storeEdit")[1];
  var title=$("#input_title"+id).val();
  var type=$("#input_type"+id).val();
  var type2=$("#input_type2"+id).val();
  var date=$("#input_date"+id).val();
  var season=$("#input_season"+id).val();
  var description=$("#input_description"+id).val();
  var picture=$("#input_picture"+id).val();
  var id_input =$("<input>").attr("type","hidden").attr("name","id").val(id);

  $("#form" + id).append(id_input);
  $("#form" + id).append($("#input_title"+id));
  $("#form" + id).append($("#input_type"+id));
  $("#form" + id).append($("#input_type2"+id));
  $("#form" + id).append($("#input_date"+id));
  $("#form" + id).append($("#input_season"+id));
  $("#form" + id).append($("#input_description"+id));
  $("#form" + id).append($("#input_picture"+id));
  $("#form" + id).submit();
  break;

case "刪除":
var id=$(this).attr("id").split("delete")[1];

var id_input =$("<input>").attr("type","hidden").attr("name","id").val(id);
var title_input =$("<input>").attr("type","hidden").attr("name","title").val($("#title"+id).text());
var type_input =$("<input>").attr("type","hidden").attr("name","type").val($("#type"+id).text());
var type2_input =$("<input>").attr("type","hidden").attr("name","type2").val($("#type2"+id).text());
var date_input =$("<input>").attr("type","hidden").attr("name","date").val($("#date"+id).text());
var season_input =$("<input>").attr("type","hidden").attr("name","season").val($("#season"+id).text());
var description_input =$("<input>").attr("type","hidden").attr("name","description").val($("#description"+id).text());
var picture_input =$("<input>").attr("type","hidden").attr("name","picture").val($("#picURL"+id).attr("src"));

$("#form" + id).attr("action","delete.jsp");
$("#form" + id).append(id_input);
$("#form" + id).append(title_input);
$("#form" + id).append(type_input);
$("#form" + id).append(type2_input);
$("#form" + id).append(date_input);
$("#form" + id).append(season_input);
$("#form" + id).append(description_input);
$("#form" + id).append(picture_input);
$("#form" + id).submit();
break;

}
});
    });
    </script>
</body>

</html>
