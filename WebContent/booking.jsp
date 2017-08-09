<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Booking</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<script src="bootstrap/js/bootstrap.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>


<script type="text/javascript">
function check()
{
	var opt1=document.frm2.from.value;
	var opt2=document.frm2.to.value;
	var url="ComputeFare?uopt1="+opt1+"&uopt2="+opt2;
	var obj=new XMLHttpRequest();
	obj.onreadystatechange=function(){
		if(obj.status==200&&obj.readyState==4){
			document.getElementById("sid").innerHTML=obj.responseText;
		}
	}
	obj.open("GET",url,true);
	obj.send();
	
}

</script>


<style type="text/css">
body{
background-image:url("1.jpg");

}
.fr
{
	margin-top:80px;
}
#tb
{
margin-top:20px;
}
td{
padding:10px;
}
.well
{
width:500px;
}

</style>
</head>
<body>
<%@page import="connector.*,java.sql.*,java.util.Date" %>
<h1 align="center"><font color="red"><b>Booking Page</b></font></h1>
<h2 align="center"><font color="red"><b>Book and Enjoy the Ride</b></font></h2>

<form name="frm2" action="bill.jsp">
<div class="container fr" align="center">
<div class="well">



<%
	try
	{
		Date dNow = new Date( );
	    SimpleDateFormat ft = new SimpleDateFormat ("yyyy.MM.dd");
	    out.print( "<p id='tb'><b>System Date: " + ft.format(dNow) + "</b><p><br>");
	%>
	<%}catch(Exception e)
	{
		
	}%>
<table>
<tr>
<td>	
From:
</td>
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
<td>
To:
</td>
<td>
<select name="to">
<%
try{
	Connection cn=ConnectDatabase.getCn();
	String toplace="select name from toname";
	PreparedStatement ps=cn.prepareStatement(toplace);
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
</tr>
<tr>
<td colspan="2">Date:</td>
<td colspan="2"><input type="date" name="bday"></td>
</tr>
<tr></tr>
<tr>
	<td>
		Computed Fare:
		
	</td>
	
	<th>
		<div id="sid" align="center">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
		
		</div>
	</th>
	<td>
		<input type="button" onclick="check()" value="Compute">
	</td>
	
</tr>
<tr>
<td height="100" colspan="4" align="center">
<input type="submit" class="btn btn-info" value="Book The Cab">
</td>
</tr>

</table>
</div>
</div>
</form>

</body>
</html>