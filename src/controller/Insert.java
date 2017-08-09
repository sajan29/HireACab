package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connector.ConnectDatabase;

/**
 * Servlet implementation class Insert
 */
@WebServlet("/Insert")
public class Insert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try
		{
			PrintWriter out=response.getWriter();
			Connection cn=ConnectDatabase.getCn();
			String place=request.getParameter("place");
			String x=request.getParameter("x");
			String y=request.getParameter("y");
			String car=request.getParameter("car");
			String sql="insert into fromname values(?,?,?,?)";
			
			PreparedStatement ps=cn.prepareStatement(sql);
			ps.setString(1, place);
			ps.setString(2, x);
			ps.setString(3, y);
			ps.setString(4, car);
			ps.execute();
			
			sql="insert into toname values(?,?,?)";
			
			ps=cn.prepareStatement(sql);
			ps.setString(1, place);
			ps.setString(2, x);
			ps.setString(3, y);
			ps.execute();
			RequestDispatcher rd=request.getRequestDispatcher("admin.jsp");
			rd.forward(request, response);
			
		}
		catch(Exception e)
		{
			System.out.println(e);
		}

	}

}
