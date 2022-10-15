<%@page import="common.JDBCConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JDBC 테스트</title>
</head>
<body>
	<h2>JDBC TEST</h2>
	<%
		String driver = application.getInitParameter("OracleDriver");
		String url = application.getInitParameter("OracleURL");
		String id = application.getInitParameter("OracleId");
		String pwd = application.getInitParameter("OraclePwd");
	
		JDBCConnect jdbc1 = new JDBCConnect();
		jdbc1.close(); 
		
		JDBCConnect jdbc2 = new JDBCConnect(driver,url,id,pwd);
		jdbc2.close();
		
		JDBCConnect jdbc3 = new JDBCConnect(application);
		jdbc3.close();
		
		
	%>
</body>
</html>