<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.DBConnPool"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 추가 테스트</title>
</head>
<body>
	<h2>회원 추가 테스트</h2>
	<%
		DBConnPool pool = new DBConnPool();
		String id ="test2";
		String pwd="1111";
		String name="테스트회원1";
		
		//쿼리문 생성
		String sql="insert into member values(?,?,?, sysdate)";
		PreparedStatement psmt = pool.con.prepareStatement(sql);
		psmt.setString(1, id);
		psmt.setString(2, pwd);
		psmt.setString(3,name);
		
		int inResult = psmt.executeUpdate();
		out.print(inResult+"행이 입력되었습니다.");
		
		sql="select * from member";
		Statement stmt = pool.con.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		

		while(rs.next()){
			id = rs.getString(1);
			pwd = rs.getString(2);
			name = rs.getString("name");
			java.sql.Date regidate = rs.getDate("regidate");
			out.print("<ul>");
			out.print("<li> 아이디: "+id+"</li>");
			out.print("<li> 비번: "+pwd+"</li>");
			out.print("<li> 이름: "+name+"</li>");
			out.print("<li> 등록날짜: "+regidate+"</li>");
			out.print("</ul>");
		}

		
		pool.close();
	%>
</body>
</html>