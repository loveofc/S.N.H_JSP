<%@page import="utils.JSFunction"%>
<%@page import="utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String userId = request.getParameter("userId");
	String userPwd = request.getParameter("userPwd");
	String save_check = request.getParameter("save_check");
	if("must".equals(userId)&&"1234".equals(userPwd)){
		if(save_check !=null && save_check.equals("Y")){
			CookieManager.makeCookie(response,"loginId",userId,86400);
		}else{
			CookieManager.deleteCookie(response,"loginId");
		}
		JSFunction.alertLocation("로그인에 성공", "idSaveMain.jsp", out);
	}else{
		JSFunction.alertBack("로그인 실패", out);
	}
%>