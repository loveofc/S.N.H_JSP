<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");

	long creationTime = session.getCreationTime();
	String ct = dateFormat.format(new Date(creationTime));
	long lastTime = session.getLastAccessedTime();
	String lt = dateFormat.format(new Date(creationTime));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session 설정값 확인</title>
</head>
<body>
	<h2>session 설정 확인</h2>
	<ul>
		<li>세션 유지 기간 :<%=session.getMaxInactiveInterval() %></li>
		<li>세션 아이디 : <%=session.getId() %></li>
		<li>최초 요청 시간 :<%=ct %></li>
		<li>마지막 요청 시간 : <%=lt %></li>
	</ul>
</body>
</html>