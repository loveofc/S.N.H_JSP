<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="isLoggedin.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>write</title>
<style>
#textarea, #title{
	display:block;
	margin:0 auto;
	box-sizing : border-box;
	border:0px;
	padding:15px;
}
</style>
<script>
	function validateForm(form) {
		if (!form.title.value) {
			alert("제목를 입력하세요")
			form.title.focus();
			return false;
		}
		if (!form.content.value) {
			alert("내용를 입력하세요")
			form.content.focus();
			return false;
		}
	}
</script>
</head>
<body>
<jsp:include page="../common/Link.jsp" />
<h2>회원제 게시판 - 글쓰기(Write)</h2>
<form name="writeFrm" method="post" action="writeProcess.jsp" onsubmit="return validateForm(this);">
	<table border="1" style="width:100%">
		<tr>
			<td style="text-align:center;">제목</td>
			<td>
				<input type="text" name="title" style="width:100%;" id="title"/>
			</td>
		</tr>
		<tr>
			<td style="text-align:center;">내용</td>
			<td>
				<textarea name="content" style="width:100%; height:100px;" id="textarea"></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="submit">작성 완료</button>
				<button type="reset">다시 입력</button>
				<button type="button" onclick="location.href='list.jsp'">목록 보기</button>
			</td>
		</tr>
		
	</table>
</form>
</body>
</html>