<%@page import="java.util.Collection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//응답 헤더에 추가할 값 준비
SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd");
long add_date = s.parse(request.getParameter("add_date")).getTime();
int add_int = Integer.parseInt(request.getParameter("add_int"));
String add_str = request.getParameter("add_str");

//응답 헤더에 값 추가
response.addDateHeader("testDay", add_date);
response.addIntHeader("testNumber", add_int);
response.addIntHeader("testNumber", 9876);
response.addHeader("testName", add_str);
response.setHeader("testName", "testName");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Response Headers</title>
</head>
<body>
	<h2>응답 헤더 정보 출력하기</h2>
	<ul>
		<%
			Collection<String> headerNames = response.getHeaderNames();
			for (String hName : headerNames) {
				String hValue = response.getHeader(hName);
		%>
				<li><%=hName%> : <%=hValue%></li>
		<%
			}
		%>
	</ul>
	
	<h2>testNumber만 출력하기</h2>
	<ul>
		<%
			Collection<String> testNumber = response.getHeaders("testNumber");
			for (String tNum : testNumber) {
		%>
				<li>testNumber : <%=tNum%></li>
		<%
			}
		%>
	</ul>
</body>
</html>