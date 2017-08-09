package controller;
import connector.*;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class CheckUid
 */
@WebServlet("/CheckUid")
public class CheckUid extends HttpServlet {
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
			String uid=request.getParameter("uuid");
			String sql="select USERID from REGDATA where USERID=?";
			PreparedStatement ps=cn.prepareStatement(sql);
			ps.setString(1, uid);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
				out.print("<font color='red'>Already Exist</font>");
				
			}
			else
			{
				out.print("<font color='green'>Valid User Id</font>");
			}
			
			
			
			
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		
	}

}
