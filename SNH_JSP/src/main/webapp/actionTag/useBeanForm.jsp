<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션 태그 폼</title>
</head>
<body>
	<form action="useBeanAction.jsp" method="post">
	이름 : <input type="text" name="name"><br/>
	나이 : <input type="text" name="age"><br/>
	<input type="submit" value="유즈빈 폼으로 전달">
	</form>
</body>
</html>