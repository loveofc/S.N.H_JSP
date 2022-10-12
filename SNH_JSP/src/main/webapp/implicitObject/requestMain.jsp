<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장 객체 - request</title>
</head>
<body>
	<h2>request 1. 클라이언트와 서버의 환경정보 읽기</h2>
	<a href="./requestWebInfo.jsp?eng=Hello&han=안녕">GET 방식 전송</a>
	<form method="post" action="./requestWebInfo.jsp">
		영어 : <input type="text" name="eng" value="bye"><br/>
		한글 : <input type="text" name="han" value="잘가"><br/>
		<input type="submit" value="post 전송">	
	</form>
	
	<h2>2. 클라이언트의 요청 매개변수 읽기</h2>
	<form method="post" action="requestParameter.jsp">
		아이디 : <input type="text" name="id" value=""><br/>
		성별:
		<input type="radio" name="sex" value="M">남자
		<input type="radio" name="sex" value="F">여자<br/>
		관심사항 : 
		<input type="checkbox" name="favo" value="경제"> 경제
		<input type="checkbox" name="favo" value="정치"> 정치
		<input type="checkbox" name="favo" value="연예"> 연예<br/>
		자기소개 : 
		<textarea name="intro" cols="30" rows="40"></textarea><br/>		
		<input type="submit" value="post 전송">	
	</form>
	
	<h2>3. HTTP 요청 헤더 정보 읽기</h2>
	<a href="requestHeader.jsp">요청 헤더 정보 읽기</a>
</body>
</html>