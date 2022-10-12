<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    errorPage="isErrorPage.jsp"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지시어 - errorPage 속성</title>
</head>
<body>
<%
	int myAge = Integer.parseInt(request.getParameter("age"))+10;
	out.println("나이는 : " +myAge);
%>
</body>
</html>