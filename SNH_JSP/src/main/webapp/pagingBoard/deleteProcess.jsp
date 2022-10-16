<%@page import="model1.board.BoardDTO"%>
<%@page import="utils.JSFunction"%>
<%@page import="model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String num = request.getParameter("num");
	BoardDTO dto =new BoardDTO();
	BoardDAO dao = new BoardDAO();
	dto = dao.selectView(num);	
	String sessionId = session.getAttribute("userId").toString();	
	int result = 0;
	
	if(sessionId.equals(dto.getId())){
		result = dao.delete(num);
		if(result ==1){
			JSFunction.alertLocation("삭제완료됬습니다.", "list.jsp", out);
		}else{
			JSFunction.alertBack("섹제 실패했습니다.", out);
		}
	}else{
		JSFunction.alertBack("본인만 삭제할 수 있습니다.", out);
		return;
	}
	
	
	
	
	
%>