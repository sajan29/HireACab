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
 * Servlet implementation class setCar
 */
@WebServlet("/setCar")
public class setCar extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try
		{
			PrintWriter out=response.getWriter();
			Connection cn=ConnectDatabase.getCn();
			String from=request.getParameter("from");
			String car=request.getParameter("car");
			String sql="update fromname set car=? where name=?";
			PreparedStatement ps=cn.prepareStatement(sql);
			ps.setString(1, car);
			ps.setString(2,from);
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

