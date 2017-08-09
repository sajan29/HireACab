<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style>
body {

background-color: lightgrey;

}
table,td{

border-collapse: collapse;
}
td{
padding: 5px;
}
tr:hover{
 background: white;
}
button{
	background-color:white;
	height:30px;
}
button:hover{
	background-color: black;
	color: white;
}
</style>
<script type="text/javascript">
function check()
{
	var fn=document.frm.fn;
	var ln=document.frm.ln;
	var uid=document.frm.uid;
	var upass=document.frm.upass;
	var ph=document.frm.phn;
	var mid=document.frm.mid;
	if(fn.value=="")
	{
		alert("Please enter first name");
		fn.focus();
		return false;
	}
	else if(ln.value=="")
	{
		alert("Please enter last name");
		ln.focus();
		return false;
	}
	else if(uid.value=="")
	{
		alert("Enter user id");
		uid.focus();
		return false;
	}
	else if(upass.value=="")
	{
		alert("Enter password");
		upass.focus();
		return false;
	}
	else if(upass.value.length<6)
	{
		alert("Password must be greater than 6 characters");
		upass.focus();
		upass.select();
		return false;
	}
	else if(ph.value=="")
	{
		alert("Enter phone number");
		ph.focus();
		return false;
	}
	else if(isNaN(ph.value))
	{
		alert("Phone number must be numeric");
		ph.select();
		ph.focus();
		return false;
	}
	else if(ph.value.length!=10)
	{
		alert("Not a valid phone number");
		ph.select();
		ph.focus();
		return false;
	}
	else if(mid.value=="")
	{
		alert("Enter email id");
		mid.focus();
		return false;
	}	
}
function check1(){
	var uid=document.frm.uid.value;
	var url="CheckUid?uuid="+uid;
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

<title>Sign Up Page</title>
</head>
<body>
<form name="frm" onsubmit="return check()" action="NewReg">
<h1 align="center"><font color="black">Sign Up form</font></h1>
<table  align="center">
<tr >
<td width="500"><font size=5 color="blue">Enter First Name:</font></td><td><input type="text"  name="fn" ></td>
</tr>
<tr>
<td><font size=5 color="blue">Enter Last Name:</font></td><td><input type="text" name="ln"></td>
</tr>
<tr>
<td><font size=5 color="blue">Enter User ID:</font></td><td><input type="text" name="uid"></td>
<td><input type="button" value="Check availability" onclick="check1()"></td>
<td><div id="sid"></div></td>
</tr>
<tr>
<td><font size=5 color="blue">Enter Your Password:</font></td><td><input type="password" name="upass"></td>
</tr>
<tr>
<td><font size=5 color="blue">Enter Mobile Number:</font></td><td><input type="text" name="phn"></td>
</tr>
<tr>
<td><font size=5 color="blue">Enter Your Email ID:</font></td><td><input type="text" name="mid"></td>
</tr>
<tr>
<td colspan="2" align="center"><button type="submit">Sign Up</button></td>
</tr>
</table>
</form>
</body>
</html>