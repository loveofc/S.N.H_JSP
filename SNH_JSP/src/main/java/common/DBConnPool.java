package common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBConnPool {
	public Connection con;
	public Statement stmt;
	public PreparedStatement psmt;
	public ResultSet rs;
	
	//기본생성자
	public DBConnPool() {
		try {
			//InitialContext는 네이밍 서비스를 이용하기 위한 시작점
			Context initCtx = new InitialContext();
			//자바의 네이밍 서비스에서 이름과 실제 객체를 연결해주는 개념이 context
			//lookup메서드에 이름을 건네면 원하는 객체를 찾아온다
			//java:comp/env는 현재 웹 애플리케이션의 루트 디렉터리이다
			//웹 애플리케이션이 사용할 수 있는 모든 자원은 java:comp/env아래에 위치
			Context ctx = (Context)initCtx.lookup("java:comp/env");
			DataSource source = (DataSource)ctx.lookup("dbcp_myoracle");
			
			//커넥션 풀을 통해 연결 얻기
			con = source.getConnection();

			
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	public void close() {
		try {
			if(rs!=null)rs.close();
			if(stmt!=null)stmt.close();
			if(psmt!=null)psmt.close();
			if(con!=null)con.close();

			
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
}
