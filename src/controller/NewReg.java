package controller;
import connector.*;
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connector.ConnectDatabase;

/**
 * Servlet implementation class NewReg
 */
@WebServlet("/NewReg")
public class NewReg extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try
		{
			PrintWriter out=response.getWriter();
			Connection cn=ConnectDatabase.getCn();
			String fname=request.getParameter("fn");
			String lname=request.getParameter("ln");
			String uid=request.getParameter("uid");
			String upass=request.getParameter("upass");
			String phn =request.getParameter("phn");
			String mid=request.getParameter("mid");
			String sql="insert into REGDATA values(?,?,?,?,?,?)";
			
			PreparedStatement ps=cn.prepareStatement(sql);
			ps.setString(1, fname);
			ps.setString(2, lname);
			ps.setString(3, uid);
			ps.setString(4, upass);
			ps.setString(5, phn);
			ps.setString(6, mid);
			ps.execute();
			out.print("record saved");
			RequestDispatcher rd=request.getRequestDispatcher("resource.html");
			rd.forward(request, response);
			
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}

}
