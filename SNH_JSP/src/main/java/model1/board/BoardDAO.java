package model1.board;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import common.DBConnPool;

public class BoardDAO extends DBConnPool{

	public BoardDAO() {
		super();
	}
	
	//게시글 갯수 가져오기
	public int selectCount(Map<String, Object> map) {
		int totalCount =0;
		String sql = "select count(*) from board";
		if(map.get("searchWord") != null) {
			sql += "where"+map.get("searchField")+" "
				+ "like '%"+map.get("searchWord")+"%'";
		}
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			rs.next();
			totalCount = rs.getInt(1);
		}catch(Exception ex) {
			System.out.println("게시물 총 갯수 카운트 중 오류 발생");
			ex.printStackTrace();
		}
		
		return totalCount;
		
	}
	
	//게시글 전체 목록 가져오기
	public List<BoardDTO> selectList(Map<String, Object> map){
		List<BoardDTO> lists = new ArrayList<BoardDTO>();
		String sql = "select * from board";
		if(map.get("searchWord") != null) {
			sql += "where"+map.get("searchField")+" "
				+ "like '%"+map.get("searchWord")+"%'";				
		}
		sql += " order by num desc";
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setContent(rs.getString("content"));
				dto.setId(rs.getString("id"));
				dto.setNum(rs.getString("num"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setTitle(rs.getString("title"));
				dto.setVisitcount(rs.getString("visitcount"));
				lists.add(dto);				
			}
			
		}catch(Exception ex) {
			System.out.println("게시물 조회 중 예외 발생");
			ex.printStackTrace();
		}
				
				
		return lists;
	}
	
}
