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
 * Servlet implementation class Delete
 */
@WebServlet("/Delete")
public class Delete extends HttpServlet {
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
			
			String sql="delete from fromname where name=?";
			PreparedStatement ps=cn.prepareStatement(sql);
			ps.setString(1, place);
			ps.execute();
			sql="delete from toname where name=?";
			ps=cn.prepareStatement(sql);
			ps.setString(1, place);
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
