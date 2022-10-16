<%@page import="model1.board.BoardDAO"%>
<%@page import="model1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./isLoggedin.jsp" %>
<%
	String num = request.getParameter("num");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	BoardDTO dto = new BoardDTO();
	dto.setTitle(title);
	dto.setContent(content);
	dto.setNum(num);
	
	BoardDAO dao = new BoardDAO();
	int affected = dao.updateEdit(dto);
	dao.close();
	if(affected==1){
		response.sendRedirect("view.jsp?num="+num);
		
	}else{
		JSFunction.alertBack("수정하기에 실패하였습니다.", out);
	}
%>
