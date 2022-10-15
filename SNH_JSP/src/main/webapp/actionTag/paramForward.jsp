<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>param forward</title>
</head>
<body>
	<!-- request영역에 자바 빈즈를 가져온다 -->
	<jsp:useBean id="person" class="common.Person" scope="request"/>
	<h2>포워드된 값 읽기</h2>
	<p>이름 : <jsp:getProperty name="person" property="name"/></p>
	<p>나이 : <jsp:getProperty name="person" property="age"/></p>
	<p>본명 : <%=request.getParameter("param1") %></p>
	<p>출생 : <%=request.getParameter("param2") %></p>
	<p>특징 : <%=request.getParameter("param3") %></p>
	<jsp:include page="inc/paramInclude.jsp">
		<jsp:param name="loc1" value="강원도 영월"/>
		<jsp:param name="loc2" value="김삿갓면"/>
	</jsp:include>

</body>
</html>