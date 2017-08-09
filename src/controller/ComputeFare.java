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
 * Servlet implementation class ComputeFare
 */
@WebServlet("/ComputeFare")
public class ComputeFare extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    
	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
		/*
		PrintWriter out=response.getWriter();
		String s1=request.getParameter("uopt1");
		String s2=request.getParameter("uopt2"); 
		int x[]={0,-1,4,2,1};
		int y[]={0,-1,6,20,25};
		int x1=0,x2=0,y1=0,y2=0;
		double val=0.0,dist=0.0,total=0.0;
		String s[]={"Sealdah","Bidhan Nagar","Howrah","Park Street","Esplanade"};
		for(int i=0;i<5;i++)
		{
			if(s[i].equals(s1))
			{
				x1=x[i];
				y1=y[i];
			}
			if(s[i].equals(s2))
			{
				x2=x[i];
				y2=y[i];
			}
		}
		val=(x2-x1)*(x2-x1)+(y2-y1)*(y2-y1);
		dist=Math.sqrt(val);
		dist=((int)(dist*1000))/1000.0;
		total=15*dist;
		total=((int)(total*100))/100.0;
		out.print(total);*/
		
		try{
			double x1=0,x2=0,y1=0,y2=0,dist=0,total=0;
			PrintWriter out1=response.getWriter();
			Connection cn=ConnectDatabase.getCn();
			String from=request.getParameter("uopt1");
			String to=request.getParameter("uopt2"); 
			String sql="select x,y from fromname where name=?";
			PreparedStatement ps=cn.prepareStatement(sql);
			ps.setString(1,from);
			ResultSet rs=ps.executeQuery();
			if(rs.next())
			{
					x1=Double.parseDouble(rs.getString(1));
					y1=Double.parseDouble(rs.getString(2));	
					sql="select x,y from fromname where name=?";
					ps=cn.prepareStatement(sql);
					ps.setString(1,to);
					rs=ps.executeQuery();
					if(rs.next())
					{
						x2=Double.parseDouble(rs.getString(1));
						y2=Double.parseDouble(rs.getString(2));
					}
					dist=Math.sqrt((x2-x1)*(x2-x1)+(y2-y1)*(y2-y1));
					dist=((int)(dist*1000))/1000.0;
					total=15*dist;
					total=((int)(total*100))/100.0;
					out1.print(total);
			}
			
		}catch(Exception e){
			System.out.println(e);
		}
		}
	}
