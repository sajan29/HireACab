package controller;
import java.sql.*;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import connector.*;
/**
 * Servlet implementation class CheckId
 */
@WebServlet("/CheckId")
public class CheckId extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// TODO Auto-generated method stub
		try{
			
			PrintWriter out=response.getWriter();
			Connection cn=ConnectDatabase.getCn();
			String uid=request.getParameter("uid");
			String upass=request.getParameter("upass");
			if(uid.equals("admin")&&upass.equals("admin"))
			{
				RequestDispatcher rd=request.getRequestDispatcher("admin.jsp");
				rd.forward(request,response);
			}
			else{
			String search="select FIRSTNAME from REGDATA where USERID=? and PASSWORD=?";
			PreparedStatement ps=cn.prepareStatement(search);
			ps.setString(1, uid);
			ps.setString(2,upass);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				HttpSession s1=request.getSession();
				s1.setAttribute("user", rs.getString(1));
				RequestDispatcher rd=request.getRequestDispatcher("booking.jsp");
				rd.forward(request,response);
			}
			else
			{
				out.println("<font color='white' size='5px'><b>Wrong id or password<b></font>");
				RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
				rd.include(request,response);
			}
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		
	}
}
	
	


