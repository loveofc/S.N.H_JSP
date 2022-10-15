package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletContext;

public class JDBCConnect {
	public Connection con;
	public Statement stmt;
	public PreparedStatement psmt;
	public ResultSet rs;
	
	
	public JDBCConnect() {
		//JDBC 드라이버 로드
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			
			//DB 연결
			String url = "jdbc:oracle:thin:@DESKTOP-R70HQ54:1521:xe";
			String id = "c##musthave";
			String pwd = "1234";
			try {
				this.con = DriverManager.getConnection(url,id,pwd);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("DB 연결 성공(기본 생성자)");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public JDBCConnect(String driver, String url, String id, String pwd) {
		try {
			Class.forName(driver);
			
			//DB 연결
			String _url = url;
			String _id = id;
			String _pwd = pwd;
			try {
				this.con = DriverManager.getConnection(_url,_id,_pwd);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("DB 연결 성공(매개변수 4개 생성자)");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public JDBCConnect(ServletContext application) {
		try {
			Class.forName(application.getInitParameter("OracleDriver"));
			
			//DB 연결
			String _url = application.getInitParameter("OracleURL");
			String _id = application.getInitParameter("OracleId");
			String _pwd = application.getInitParameter("OraclePwd");
			try {
				this.con = DriverManager.getConnection(_url,_id,_pwd);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("DB 연결 성공(application 생성자)");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public Connection getCon(){
		return this.con;
	}
	
	
	public void close() {
		try {
			if(rs!=null) rs.close();
			if(stmt!=null) stmt.close();
			if(psmt!=null) psmt.close();
			if(con!=null) con.close();
			System.out.println("JDBC 해제");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}
