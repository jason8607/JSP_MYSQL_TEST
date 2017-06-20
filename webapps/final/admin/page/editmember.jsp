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
String acces = request.getParameter("access");
String acc = request.getParameter("account");
if(acces!=null && acc!=null){
  database.connectDB();
  database.editaccess(acc,acces);
}
database.connectDB();
String sql = "select * from member where access != 'manager' ;";
database.query(sql);
ResultSet rs = null;
rs = database.getRS();
request.setCharacterEncoding("UTF-8");
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
                    <h style="font-size:25px;">會員後台管理</h>

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
                        <h4 class="page-title">會員權限管理</h4> </div>
                    <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                        <ol class="breadcrumb">
                            <li><a href="">後台管理系統</a></li>
                            <li><a href="">會員權限管理</a></li>
                        </ol>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <div class="row">
                  <div class="col-sm-12">
                    <div class="white-box">
                      <h3 class="box-title">資料表單</h3>
                         <div class="table-responsive">
                            <table class="table">
                              <thead>
                                  <tr>
                                    <th>帳號</th>
                                    <th>暱稱</th>
                                    <th>權限</th>
                                    </tr>
                        </thead>
                        <tbody>
                          <%
                         if (rs !=null){
                           while(rs.next()){
                             String account=rs.getString("account");
                             String name=rs.getString("name");
                             String access=rs.getString("access");
                             %>
                             <tr>
                               <form id="form" action="editmember.jsp" method="POST">
                                 <td><%=account%></td>
                                 <td><%=name%></td>
                                 <td>
                                   <select name="access">
                                     <%
                                     if(access.equals("normal")){
                                       %><option value="premium">尊貴會員</option>
                                         <option value="normal" selected>普通會員</option><%
                                     }else{
                                       %><option value="premium" selected>尊貴會員</option>
                                         <option value="normal">普通會員</option><%
                                     }
                                     %>
                                   </select>
                                 </td>
                                 <input type="text" name="account" style="display:none" value="<%=account%>">
                                 <td>
                                 <button type="submit" class="btn btn-primary">修改</button>
                                 </td>
                               </form>
                             </tr>
                             <%
                           }
                         }
                        %>
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
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
    </body>
  </html>
