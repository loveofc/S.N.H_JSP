<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스크립트 요소 활용</title>
</head>
<%!
	public int add(int num1, int num2) {
		return num1+num2;
	}%>
<body>
<% int result = add(1,2); %>

<p>덧셈 결과 1 : <%=result %></p>
<p>덧셈 결과 2 : <%=add(3,5) %></p>
</body>
</html>