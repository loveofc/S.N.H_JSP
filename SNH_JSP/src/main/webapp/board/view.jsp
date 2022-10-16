<%@page import="model1.board.BoardDTO"%>
<%@page import="model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String num =request.getParameter("num");
	
	BoardDAO dao = new BoardDAO();
	dao.updateVisitCount(num);
	BoardDTO dto = dao.selectView(num);
	dao.close();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기 페이지</title>
<script>
function deletePost(){
	var confirmed = confirm("정말로 삭제하겠습니까?");
	if(confirmed){
		var form = document.writeFrm;
		form.method="post";
		form.action="deleteProcess.jsp";
		form.submit();
	}
}

</script>
</head>
<body>
<jsp:include page="../common/Link.jsp"/>
<h2>회원제 게시판 - 상세보기</h2>
<form name="writeFrm">
	<input type="hidden" name="num" value="<%=dto.getNum() %>">
	<table border="1" style="width:100%;">
		<tr>
			<td>번호</td>
			<td><%=dto.getName() %></td>
			<td>작성자</td>
			<td><%=dto.getName() %></td>
		</tr>
		<tr>
			<td>작성일</td>
			<td><%=dto.getPostdate() %></td>
			<td>조회수</td>
			<td><%=dto.getVisitcount() %>
			
		</tr>
		<tr>
			<td>제목</td>
			<td colspan="3"><%=dto.getTitle() %></td>
		</tr>
		<tr>
			<td>내용</td>
			<td colspan="3" height="100"><%=dto.getContent().replace("\r\n","<br/>") %></td>
		</tr>
		<tr>
			<td colspan="4" align="center">
				<%
					if(session.getAttribute("userId")!=null && session.getAttribute("userId").toString().equals(dto.getId())){
				%>
				<button type="button" onclick="location.href='edit.jsp?num=<%=dto.getNum() %>';">수정하기</button>
				<button type="button" onclick="deletePost();">삭제하기</button>
				<%} %>
				<button type="button" onclick="location.href='list.jsp'">목록 보기</button>
			</td>
		</tr>
	
	
	</table>

</form>
</body>
</html>