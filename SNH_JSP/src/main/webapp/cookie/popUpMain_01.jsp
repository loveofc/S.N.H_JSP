<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String popupMode = "on";

Cookie[] cs = request.getCookies();
if (cs != null) {
	for (Cookie c : cs) {
		String cName = c.getName();
		String cValue = c.getValue();
		if (cName.equals("popupClose")) {
	popupMode = cValue;
		}
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키를 이용한 팝업 관리 ver 0.1</title>
<style>
div#popup {
	position: absolute;
	top: 100px;
	left: 50px;
	color: yellow;
	width: 270px;
	height: 100px;
	background-color: gray;
}

div#popup>div {
	position: relative;
	background-color: #ffffff;
	top: 0px;
	border: 1px solid gray;
	padding: 10px;
	color: black;
}
</style>

</head>
<body>
	<h2>팝업 메인 페이지</h2>
	<%
	for (int i = 0; i < 10; i++) {
		out.print("현재 팝업창은 " + popupMode + " 상태입니다.<br/>");
	}
	if (popupMode.equals("on")) {
	%>
	<div id="popup">
		<h2 align="center">공지사항 팝업입니다.</h2>
		<div align="right">
			<form name="popFrm">
				<input type="checkbox" id="inactiveToday" value="1"> 하루 동안
				열지 않음 <input type="button" value="닫기" id="closeBtn">
			</form>
		</div>
	</div>
	<%
	}
	%>
	<script>
	document.getElementById("closeBtn").onclick = function() {
			document.getElementById("popup").style.display = "none"
			var chkVal = (document.getElementById("inactiveToday").checked == true) ? "1" : "";

			var httpRequest = new XMLHttpRequest();

			if (!httpRequest) {
				alert('XMLHTTP 인스턴스를 만들 수가 없어요 ㅠㅠ');
				return false;
			}
			httpRequest.onreadystatechange = alertContents;
			httpRequest.open('GET', 'popupSetting.jsp?chkVal='+chkVal);
			httpRequest.send();
			

		function alertContents() {
			if (httpRequest.readyState === XMLHttpRequest.DONE) {
				if (httpRequest.status === 200) {
					if(httpRequest.response != null){
						console.log("성공")
						location.reload();
						alert(httpRequest.responseText)
					}
				} else {
					alert('request에 뭔가 문제가 있어요.');
				}
			}
		}
	}
	</script>
</body>
</html>