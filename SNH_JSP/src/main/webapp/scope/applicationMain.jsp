<%@page import="common.Person"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Map<String, Person> maps = new HashMap<>();
	maps.put("actor1", new Person("남지현", 27));
	maps.put("actor2", new Person("김유정", 21));
	application.setAttribute("maps", maps);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>application 영역</title>
</head>
<body>
	<h2>application 영역의 공유</h2>
	application 저장되었습니다.
</body>
</html>