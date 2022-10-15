<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션 태그 - useBean</title>
</head>
<body>
	<h2>useBean 액션 태그</h2>
	<h3>useBean 생성하기</h3>
	<jsp:useBean id="person" class="common.Person" scope="request"/>
	
	<h3>setProperty 액션 태그로 자바빈즈 속성 지정하기</h3>
	<jsp:setProperty property="name" name="person" value="임꺽정"/>
	<jsp:setProperty property="age" name="person" value="20"/>
	
	<h3>getPropert 액션 태그로 자바빈즈 속성 읽기</h3>
	<p>이름: <jsp:getProperty property="name" name="person"/></p>
	<p>나이: <jsp:getProperty property="age" name="person"/></p>
</body>
</html>