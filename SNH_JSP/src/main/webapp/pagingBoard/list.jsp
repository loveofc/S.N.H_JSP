<%@page import="utils.PagingBoard"%>
<%@page import="model1.board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	BoardDAO dao = new BoardDAO();

//사용자가 입력한 검색 조건을 Map에 저장
Map<String, Object> param = new HashMap<String, Object>();

String searchField = request.getParameter("searchField");
String searchWord = request.getParameter("searchWord");

if(searchWord != null && !searchWord.equals("")){
	param.put("searchWord",searchWord);
	param.put("searchField",searchField);
	
}else{
	searchWord="";
}
out.print(param.get("searchWord"));
int totalCount = dao.selectCount(param);
//List<BoardDTO> boardLists = dao.selectList(param);

int pageSize = Integer.parseInt(application.getInitParameter("pages_per_page"));
int blockSize = Integer.parseInt(application.getInitParameter("pages_per_block"));
int totalPage = (int)Math.ceil((double)totalCount/pageSize);

int nowPage = 1;
String pageTemp = request.getParameter("pageNum");
if(pageTemp!=null && !pageTemp.equals("")){
	nowPage =  Integer.parseInt(pageTemp);
}
int endPage = nowPage*pageSize;
int startPage = endPage - pageSize + 1;
param.put("start",startPage);
param.put("end",endPage);

List<BoardDTO> boardLists = dao.selectListPage(param);
dao.close();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#wrap{
	width:960px;
 	margin:20px auto;
	padding:10px;
}
</style>
</head>
<body>
<div id="wrap">
	<jsp:include page="../common/Link.jsp"/>
	<h2>목록 보기</h2> - 현재 페이지 : <%=nowPage %> (전체 : <%=totalPage %>)
	<form method="get">
		<table border="1" width="100%">
			<tr>
				<td align="center">
					<select name="searchField">
						<option value="title">제목</option>
						<option value="content">내용</option>
					</select>
					<input type="text" name="searchWord" value="<%=searchWord %>">
					<input type="submit" value="검색하기">
				</td>
			</tr>
		</table>
	</form>
	<table border="1" width="100%">
		<!-- 각 컬럼의 이름 -->
		<tr>
			<td width="10%">번호</td>
			<td width="50%">제목</td>
			<td width="15%">작성자</td>
			<td width="10%">조회수</td>
			<td width="15%">작성일</td>
		</tr>
	<%
		if(boardLists.isEmpty()){
			
	%>
		<tr>
			<td colspan="5" align="center">
			등록된 게시물이 없습니다
			</td>
		</tr>
	<%}else{ 
		
		int count = 0;
		int virtualNum = 0; //화면상 게시물 번호
		for(BoardDTO dto : boardLists){
			virtualNum = totalCount -((nowPage-1)*pageSize+ count++); //전체 게시물 수에서 시작해 1씩 감소
	%>
		<tr>
			<td><%=virtualNum %></td><!-- 게시물 번호 -->
			<td align="left">
				<a href="view.jsp?num=<%=dto.getNum() %>&pageNum=<%=nowPage%>"><%=dto.getTitle()%></a>
			</td>
			<td align="center"><%=dto.getId() %></td>
			<td align="center"><%=dto.getVisitcount() %></td>
			<td align="center"><%=dto.getPostdate() %></td>
		</tr>
	
	<%	
		}
	}
	%>
	</table>
	<!-- 목록 하단의 <글쓰기> 버튼 -->
	<table border="1" width="100%">
		<tr align="center">
			<td>
			<%=PagingBoard.pagingStr(totalCount, pageSize, blockSize, nowPage, request.getRequestURI(), searchWord,searchField) %>
			</td>
			<td>
				<button type="button" onclick="location.href='write.jsp'">글쓰기</button>
			</td>		
		</tr>
	</table>
</div>
</body>
</html>