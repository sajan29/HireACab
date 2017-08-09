package connector;
import java.sql.*;
public class ConnectDatabase {
	static Connection cn=null;
	static String driver="com.mysql.jdbc.Driver";
	static String url="jdbc:mysql://localhost:3306/firstdb";
	static String user="root";
	static String pass="sajan";
	
	public static Connection getCn()
	{
		try{
			Class.forName(driver);
			cn=DriverManager.getConnection(url,user,pass);
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return cn;
	}
}
