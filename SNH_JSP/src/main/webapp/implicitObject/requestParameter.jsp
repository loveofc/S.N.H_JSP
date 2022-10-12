<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클라이언트의 요청 매개변수 읽기</title>
</head>
<body>
	<h2>클라이언트의 요청 매개변수 읽기</h2>
	<%
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String sex = request.getParameter("sex");
		String[] favo = request.getParameterValues("favo");
		String favoStr = "";
		if(favo != null){
			for(int i = 0 ; i <favo.length;i++){
				favoStr += "<li>"+favo[i]+"</li>";
			}
		}
		String intro = request.getParameter("intro").replace("\r\n","<br/>");
	%>
	<ul>
		<li>아이디 : <%=id %></li>
		<li>성별 : <%=sex %></li>
		<li>-좋아하는 것-</li>
		<%=favoStr %>
		<li>자기소개 : <%=intro %></li>
	</ul>
</body>
</html>