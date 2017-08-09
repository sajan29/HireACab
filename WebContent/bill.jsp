<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Generate Bill</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<script src="bootstrap/js/bootstrap.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>

<style>


</style>


</head>
<body>
<%@page import="connector.*,java.sql.*" %>

<div class="container-fluid jumbotron" align="center">

<h2><font color="black"><b>Your Bill Is</b></font></h2>

<table class="table table-bordered table-striped table-hover table-condensed" >


<%
try{
	 session=request.getSession(false);
	String uid=(String)session.getAttribute("user");
	
	double x1=0,x2=0,y1=0,y2=0,dist=0,total=0;
	int c;
	PrintWriter out1=response.getWriter();
	Connection cn=ConnectDatabase.getCn();
	String id=request.getParameter("id");
	String date=request.getParameter("bday");
	String from=request.getParameter("from");
	String to=request.getParameter("to");
	String sql="select x,y,car from fromname where name=?";
	PreparedStatement ps=cn.prepareStatement(sql);
	ps.setString(1,from);
	ResultSet rs=ps.executeQuery();
	if(rs.next())
	{
		c=Integer.parseInt(rs.getString(3));
		if(c>0)
		{
			x1=Double.parseDouble(rs.getString(1));
			y1=Double.parseDouble(rs.getString(2));	
			c--;
			sql="update fromname set car=? where name=?";
			ps=cn.prepareStatement(sql);
			ps.setInt(1, c);
			ps.setString(2,from);
			ps.execute();
			
			sql="select x,y,car from fromname where name=?";
			ps=cn.prepareStatement(sql);
			ps.setString(1,to);
			rs=ps.executeQuery();
			if(rs.next())
			{
				c=Integer.parseInt(rs.getString(3));
				x2=Double.parseDouble(rs.getString(1));
				y2=Double.parseDouble(rs.getString(2));
				c++;
				sql="update fromname set car=? where name=?";
				ps=cn.prepareStatement(sql);
				ps.setInt(1, c);
				ps.setString(2,to);
				ps.execute();	
			}
			dist=Math.sqrt((x2-x1)*(x2-x1)+(y2-y1)*(y2-y1));
			dist=((int)(dist*1000))/1000.0;
			total=15*dist;
			total=((int)(total*100))/100.0;
			
		}
		else
		{
			RequestDispatcher rd=request.getRequestDispatcher("oops.html");
			rd.forward(request,response);
		}
	}
	
	//out.println("<br>"+total);
%>	
	<tr>
	<td>User Name:</td><td> <%=uid %> </td>
	</tr>
	<tr>
	<td>From:</td><td> <%=from %> </td>
	<tr>
	<td>To:</td><td> <%=to %> </td>
	</tr>
	<tr>
	<td>Date:</td><td> <%=date %> </td>
	</tr>
	<tr>
	<td>Distance:</td><td> <%=dist%>  KM </td> 
	</tr>
	<tr>
	<td>Amount:</td><td> &#8377;  <%=total %> </td>
	</tr>
	
<%
}catch(Exception e){
	System.out.println(e);
}%>






</table>
<a href="index.html" class="btn btn-primary btn-lg active" role="button">Go To Home Page</a>
</div>


</body>
</html>