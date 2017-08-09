<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin Page</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<script src="bootstrap/js/bootstrap.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<style>

</style>
</head>
<body>
<%@ page import="connector.*,java.sql.*" %>
<h1 align="center">Admin Page</h1>
<div class="container-fluid" >
	<div class="col-xs-6" id="ta1">
	<h3><b>Database</b></h3>
	<table class="table table-bordered table-striped table-hover table-condensed">
	<tr>
	<th>Place</th>
	<th>X</th>
	<th>Y</th>
	<th>Car</th>
	</tr>
	<%
	try{
	Connection cn=ConnectDatabase.getCn();
	String sql="select * from fromname";
	PreparedStatement ps=cn.prepareStatement(sql);
	ResultSet rs=ps.executeQuery();
	while(rs.next()){
%>
<tr>
<td><%=rs.getString(1) %></td>
<td><%=rs.getString(2) %></td>
<td><%=rs.getString(3) %></td>
<td><%=rs.getString(4) %></td>
</tr>
<%}%>
<%}catch(Exception e)
	{
		System.out.println(e);
	}
%>

	</table>
	</div>
	<div class="col-xs-6" id="ta">
	<h3><b>Set number of Cars</b></h3>
<form action="setCar">
	<table align="center">
	<tr>
	<td>
	<select name="from">
	<%
	try{
	Connection cn=ConnectDatabase.getCn();
	String fromplace="select name from fromname";
	PreparedStatement ps=cn.prepareStatement(fromplace);
	ResultSet rs=ps.executeQuery();
	while(rs.next()){
	%>
	<option value="<%=rs.getString(1) %>"> <%=rs.getString(1) %> </option>
<%}%>
		
<%} catch(Exception e){
	System.out.println(e);
}%>
	
	</select>
	</td>
	<td><input type="text" name="car" ></input></td>
	</tr>
	<tr>
	<td colspan="2" align="center"><input type="submit" value="Set"></td>
	</tr>
	</table>
</form>
	</div>
</div>
<div class="container-fluid">
	<div class="col-xs-6">
	<h3><b>Insert Into Database</b></h3>
<form action="Insert">
	<table align="center">
	<tr>
	<td><input type="text" placeholder="Place" name="place"></td>
	<td><input type="text" placeholder="x"name="x"></td>
	</tr>
	<tr>
	<td><input type="text" placeholder="y" name="y"></td>
	<td><input type="text" placeholder="cars"name="car"></td>
	</tr>
	<tr>
	<td colspan="2" align="center"><input type="submit" value="Insert"></td>
	</tr>
	</table>
</form>
	</div>
	<div class="col-xs-6">
	<h3><b>Delete From Database</b></h3>
<form action="Delete">
	<table align="center">
	<tr>
	<td>

	<select name="place">
	<%
	try{
	Connection cn=ConnectDatabase.getCn();
	String fromplace="select name from fromname";
	PreparedStatement ps=cn.prepareStatement(fromplace);
	ResultSet rs=ps.executeQuery();
	while(rs.next()){
	%>
	<option value="<%=rs.getString(1) %>"> <%=rs.getString(1) %> </option>
<%}%>
		
<%} catch(Exception e){
	System.out.println(e);
}%>
	
	</select>


</td>
	<td><input type="submit" value="Delete"></td>
	
	
	
	</tr>
	</table>
</form>
	</div>
	
</div>	
<footer align="center">
<a href="index.html" class="btn btn-primary btn-lg active" role="button">Go To Home Page</a>
</footer>


</body>
</html>