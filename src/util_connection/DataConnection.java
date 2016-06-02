package util_connection;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class DataConnection {
	
	private static final String DBDRIVER = "org.sqlite.JDBC";
	 // 连接驱动
	private static final String DBURL="jdbc:sqlite://e:/guitar.db";
//	private String url = "jdbc:odbc:guitar";  // URL数据库地址ַ
	
	static Connection conn=null;
	public static Connection getConnection(){
		
	  try{
		 Class.forName(DBDRIVER);	
		 conn=DriverManager.getConnection(DBURL);
		}catch(ClassNotFoundException e){
			
		}		
		catch (SQLException e) {
			e.printStackTrace();
			System.out.print("连接失败");
		}
		
		return conn;
}
}