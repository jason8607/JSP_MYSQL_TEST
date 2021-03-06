package com.database;
import java.sql.*;
public class Database{
private  Connection con = null;
private  ResultSet rs = null;
private  Statement stmt = null;
private  String ip ="";
private  String port ="";
private  String url ="";
private  String db="";
private  String user ="";
private  String password="";
private  String driver="com.mysql.jdbc.Driver";

public Database(){

}


public void sendComment(String ani_id,String acc_id,String content){
  try{
    String sql = "insert into comment(ani_id,acc_id,content) value(?,?,?)";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1,ani_id);
    ps.setString(2,acc_id);
    ps.setString(3,content);
    int a = ps.executeUpdate();
//    ps.close();
//     con.close();
  }catch(Exception ex){
    System.out.println(ex);
  }
}


public void creatAccount(String account,String password,String name,String birth,String email,String phone){
  try{
    String sql = "insert into member(account,password,name,birth,email,phone) value(?,?,?,?,?,?)";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1,account);
    ps.setString(2,password);
    ps.setString(3,name);
    ps.setString(4,birth);
    ps.setString(5,email);
    ps.setString(6,phone);
    int a = ps.executeUpdate();
//    ps.close();
//     con.close();
  }catch(Exception ex){
    System.out.println(ex);
  }
}

public void insertData(String title,String type,String type2,String description,String date,String season,String picture){
try{
String sql ="insert into animation (title,type,type2,description,date,season,picture)values(?,?,?,?,?,?,?)";
PreparedStatement ps =con.prepareStatement(sql);
ps.setString(1,title);
ps.setString(2,type);
ps.setString(3,type2);
ps.setString(4,description);
ps.setString(5,date);
ps.setString(6,season);
ps.setString(7,picture);
int a = ps.executeUpdate();
// // ps.close();
// con.close();
}
catch(Exception ex){
System.out.println(ex);
}
}

public void editprofile(String account,String password,String name,String birth,String email,String phone){
  try{
  String sql ="update member set password ='"+password+"',  name='"+name+"', birth='"+birth+"',email='"+email+"',phone='"+phone+"' where account="+account;
  int a = stmt.executeUpdate(sql);
  // con.close();
  }
  catch(Exception ex){
    System.out.println(ex);
  }
}

public void editaccess(String account,String access){
  try{
  String sql ="update member set access = '"+access+"' where account= '" + account +"';";
  int a = stmt.executeUpdate(sql);
  // con.close();
  }
  catch(Exception ex){
    System.out.println(ex);
  }
}

public void editData(String id,String title,String type,String type2,String description,String date,String season,String picture){
try{
String sql ="update animation set title ='"+title+"',  type='"+type+"', type2='"+type2+"',description='"+description+"',date='"+date+"',season='"+season+"',picture='"+picture+"' where id="+id;
int a = stmt.executeUpdate(sql);
// con.close();
}
catch(Exception ex){
  System.out.println(ex);
}

}

public void delComment(String cid){
  try{
  String sql ="delete from comment where cid="+cid+";";
  int a = stmt.executeUpdate(sql);
  }
  catch(Exception ex){
    System.out.println(ex);
  }
}

public void deleteData(String id){
try{
String sql ="delete from animation  where id="+id+";";
int a = stmt.executeUpdate(sql);
// con.close();
}
catch(Exception ex){
  System.out.println(ex);
}

}


public void connectDB(){
  try{
  url = "jdbc:mysql://"+ ip + ":" + port + "/"+ db +"?useUnicode=true&characterEncoding=utf-8";
  Class.forName(driver);
  con =DriverManager.getConnection(url , user , password);
  stmt = con.createStatement();
//   con.close();
  }catch(Exception ex){
    System.out.println(ex);
    }
}
public void query(String sql){
try{
  rs = stmt.executeQuery(sql);
//   con.close();
}
catch(Exception ex){
 System.out.println(ex);
}

}
public Connection getCon(){
return con;
}

public ResultSet getRS(){
return rs;
}

public void setIp(String ip){
this.ip = ip;
}

public void setPort(String port){
this.port = port;
}

public void setUrl(String ip,String port){
this.url = "jdbc:mysql://"+ ip + ":" + port + "/";
}

public void setDb(String dbName){
this.db = dbName;
}

public void setUser(String username){
this.user = username;
}

public void setPassword(String password){
this.password = password;
}

public void setDriver(String driver){
this.driver = driver;
}



}
