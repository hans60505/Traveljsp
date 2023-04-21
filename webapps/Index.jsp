<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*" %>

<jsp:useBean id = "database" class = "com.SqlAction.TravelSqlAction" >
	<jsp:setProperty property = "ip" name = "database" value = "localhost"/>
	<jsp:setProperty property = "port" name = "database" value = "5432"/>
	<jsp:setProperty property = "db" name = "database" value = "postgres"/>
	<jsp:setProperty property = "user" name = "database" value = "postgres"/>
	<jsp:setProperty property = "pwd" name = "database" value = "postgre"/>
</jsp:useBean>

<%
// 	String ip = "jdbc:postgresql://localhost:5432/postgres";
// 	String user = "postgres";
// 	String pwd = "postgre";
// 	String db = "postgres";
// 	String driver = "org.postgresql.Driver";
// 	String tablename = "travel";
// 	Connection con = null;
// 	Statement stmt = null;
	
// 	//這個保存查回來的資料
// 	ResultSet rs = null;
	
// 	try{
		
// 		String url = ip;
// 		Class.forName(driver).newInstance();
// 		con = DriverManager.getConnection(url,user,pwd);
// 		stmt = con.createStatement();
// 		String sqlstr = "select * from "+ tablename;
// 		rs = stmt.executeQuery(sqlstr);
// // 		out.println(rs);
		
// 	}catch(Exception ex){
// 		out.println(ex);
// 	}

%>


<%
database.connectDB();
database.queryAll("travel");
ResultSet rs = database.getRs();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
</head>
<body>
	<div class="navbar-fixed">
<%-- 	<% out.println(database.getIp()); %> --%>
		<nav>
			<div class="nav=wrapper">
				<center>
					<h style="font-size:25px;font-weight:bold;">旅遊景點</h>
				</center>
			</div>
		</nav>
	</div>
	<div class="row">
		<%
		if(rs != null){
			//rs.next()為true false 若有下一筆則true
			while(rs.next()){
				String id = rs.getString("id");
				String name = rs.getString("name");
				String location = rs.getString("location");
				String description = rs.getString("description");
				String photo = rs.getString("photo");
				String createtime = rs.getString("createtime");
			
		%>
		<div class="col s6">
			<div class="card horizontal">
				<div class="card-image" style="padding:2vh;">
					<img src=<%=photo%> style="width:17vh;height:19vh;">
				</div>
				<div class="card-stacked">
					<div class="card-content">
						<h style="font-size:20px;font-weight:bold;"><%=name%></h>
						<p>地點:<%=location%></p>
						<p>建立於:<%=createtime%></p>
					</div>
					<div class="card-action">
						<a href="Detail.jsp?id=<%=id%>" >詳細資訊</a>
					</div>
				</div>
			</div>
		</div>
		<%}} %>
	</div>

</body>
</html>