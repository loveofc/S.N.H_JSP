<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session</title>
</head>
<body>
	<jsp:include page="../common/Link.jsp"/>
	<h2>로그인 페이지</h2>
	<span style="color:red, font-size:1.2em;">
	<%=request.getAttribute("LoginErrMsg")==null ? "" : request.getAttribute("LoginErrMsg") %>
	</span>
	<%
		//로그인 상태 확인
		if(session.getAttribute("userId")==null){
			
		//로그아웃 상태
	%>
	<script>
		function validateForm(form){
			if(!form.userId.value){
				alert("아이디를 입력하세요")
				return false;
			}
			if(!form.userPwd.value){
				alert("패스워드를 입력하세요")
				return false;			
			}
		}
	</script>
	<form action="loginProcess.jsp" method="post" name="loginFrm" onsubmit="return validateForm(this)">
		아이디 : <input type="text" name="userId"><br/>
		비밀번호 : <input type="password" name="userPwd"><br/>
		<input type="submit" value="로그인하기">
	</form>
	<%}else{%>
		<%=session.getAttribute("userName")%> 회원님, 로그인하셨습니다.<br/>
		<a href="logout.jsp">[로그아웃]</a>
	<%
	}
	%>

	
</body>
</html>