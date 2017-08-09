<%@page import="connector.*,java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement,java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login Page</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<script src="bootstrap/js/bootstrap.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
function check(){
	var uid=document.frm.uid;
	var upass=document.frm.upass;
	if(uid.value=="")
	{
		alert("Please Enter Userid");
		uid.focus();
		return false;
	}
	else if(upass.value=="")
	{
		alert("Enter Password");
		upass.focus();
		return false;
	}
}

</script>
<style>
#log
{
position:absolute;
top:200px;
left:500px;
}
body {
      
    background-image: url("1.jpg"); 
}
h1 {
	padding: 60px 0px 0px 100px ; 
}
.well{
background-color: lightgrey;
height:200px;
}
button{
margin: 0px 0px 0px 100px;
background-color: grey;
color: white;
}
button:HOVER {
	background-color: white; 
	color: black;
}
</style>

</head>
<body>
<div id="sid">

</div>
<form name="frm" onsubmit="return check()" action="CheckId">
<div class="container-fluid" id="log">
	<div class="well well-lg">
		<h4 align="center"><font color="black"><b>Login Page</b></font></h4>
		<font color="blue"><b>User Id:&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</b></font>
		<input type="text" placeholder="Enter Your User ID" name="uid"><br><br>
		<font color="blue"><b>Password:&nbsp&nbsp&nbsp&nbsp</b></font>
		<input type="password" name="upass"><br><br>
		<button>Log in</button>
	</div>
</div>
</form>


</body>
</html>