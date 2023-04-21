<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>

<jsp:useBean id = "database" class = "com.SqlAction.TravelSqlAction" >
	<jsp:setProperty property = "ip" name = "database" value = "localhost"/>
	<jsp:setProperty property = "port" name = "database" value = "5432"/>
	<jsp:setProperty property = "db" name = "database" value = "postgres"/>
	<jsp:setProperty property = "user" name = "database" value = "postgres"/>
	<jsp:setProperty property = "pwd" name = "database" value = "postgre"/>
</jsp:useBean>

<%
	String id = request.getParameter("id");
	database.connectDB();
	database.querybyid("travel", id);
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
// 			out.println("rs === " + rs);
			//rs.next()為true false 若有下一筆則true
			while(rs.next()){
				String name = rs.getString("name");
				String location = rs.getString("location");
				String description = rs.getString("description");
				String photo = rs.getString("photo");
				String createtime = rs.getString("createtime");
			
	%>
	
	<div class="card">
		<div class="card-image" style="padding:2vh;">
			<img src=<%=photo%> style="width:17vh;height:19vh;">
		</div>
		<div class="card-content">
			<h style="font-size:20px;font-weight:bold;"><%=name%></h>
			<p><%=description%></p>
		</div>
	</div>
	<%}} %>
	
	</div>

</body>
</html>