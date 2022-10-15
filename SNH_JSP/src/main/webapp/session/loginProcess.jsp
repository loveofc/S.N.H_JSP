<%@page import="membership.MemberDTO"%>
<%@page import="membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String id = request.getParameter("userId");
	String pwd = request.getParameter("userPwd");
	
	MemberDAO dao = new MemberDAO(application);
	MemberDTO dto = dao.getMemberDTO(id, pwd);
	dao.close();
	
	//로그인 성공
	if(dto.getId()!=null){
		session.setAttribute("userId",dto.getId());
		session.setAttribute("userName",dto.getName());
		response.sendRedirect("loginForm.jsp");
	}else{
		request.setAttribute("LoginErrMsg","로그인 오류입니다.");
		request.getRequestDispatcher("loginForm.jsp").forward(request,response);
	}
	
%>
