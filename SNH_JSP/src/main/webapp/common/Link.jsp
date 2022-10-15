<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<table border="1" width="100%">

	<tr>
		<td align="center">
		<%
			if(session.getAttribute("userId")==null){		
		%>
			<a href="../session/loginForm.jsp">로그인</a>
		<%}else{%>
		<a href="../session/logout.jsp">로그아웃</a>		
		<%}%>
		&nbsp;&nbsp;&nbsp;
		<a href="../session/logout.jsp">게시판(페이징x)</a>	
		&nbsp;&nbsp;&nbsp;
		<a href="../session/logout.jsp">게시판(페이징o)</a>	
		</td>
	</tr>
</table>