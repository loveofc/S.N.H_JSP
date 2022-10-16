<%@page import="model1.board.BoardDAO"%>
<%@page import="model1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./isLoggedin.jsp" %>
<%
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	BoardDTO dto = new BoardDTO();
	BoardDAO dao = new BoardDAO();
	
	dto.setTitle(title);
	dto.setContent(content);
	dto.setId(session.getAttribute("userId").toString());
	
	int result = dao.insertWrite(dto);
	/* int result = 0;
	for(int i = 0 ; i<=100;i++){
		dto.setTitle(title+"-"+i);
		result = dao.insertWrite(dto);
	} */
	dao.close();
	
	if(result==1){
		response.sendRedirect("list.jsp");
	}else{
		JSFunction.alertBack("글쓰기에 실패하였습니다.", out);
	}
%>