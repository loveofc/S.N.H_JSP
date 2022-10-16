package utils;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import model1.board.BoardDAO;

public class PagingBoard {
	
	public static String pagingStr(int totalCount, int pageSize, int blockPage, int nowPage, String reqUrl,String searchWord, String searchField) {
		String pagingStr ="";
		
		//3단계 : 전체 페이지 수 계산
		int totalPages = (int)(Math.ceil((double)totalCount/pageSize));
		
		
		//4단계 : 이전 페이지 블록 바로가기 출력
		int pageTemp = (((nowPage-1)/blockPage)*blockPage) +1;
		if(pageTemp !=1) {
			pagingStr +="<a href='"+reqUrl+"?pageNum=1&searchWord="+searchWord+"&searchField="+searchField+"'>[첫페이지]</a>&nbsp;";
			pagingStr += "<a href='"+reqUrl+"?pageNum="+(pageTemp-1)+"&searchWord="+searchWord+"&searchField="+searchField+"'>[이전 블록]</a>";
		}
		//5단계 : 각 페이지 번호 출력
		int blockCount =1;
		while(blockCount<=blockPage&&pageTemp <=totalPages) {
			if(pageTemp==nowPage) {
				//혅 페이지는 링크를 걸지 않음
				pagingStr += "&nbsp;"+pageTemp +"&nbsp;";
				
			}else {
				pagingStr += "&nbsp;<a href='"+reqUrl +"?pageNum="+pageTemp+"&searchWord="+searchWord+"&searchField="+searchField+"'>"+pageTemp+"</a>&nbsp;";
			}
			pageTemp++;
			blockCount++;
		}
		//6단계 : '다음 페이지 블록 바로가기' 출력
		if(pageTemp <=totalPages) {
			pagingStr +="<a href='"+reqUrl+"?pageNum="+pageTemp+"&searchWord="+searchWord+"&searchField="+searchField+"'>[다음 블록]</a>";
			pagingStr +="&nbsp;";
			pagingStr +="<a href='"+reqUrl+"?pageNum="+totalPages+"&searchWord="+searchWord+"&searchField="+searchField+"'>[마지막 페이지]</a>";
		}		
		return pagingStr;
	}
	
	
}
