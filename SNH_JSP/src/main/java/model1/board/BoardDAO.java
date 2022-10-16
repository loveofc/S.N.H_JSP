package model1.board;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.DBConnPool;

public class BoardDAO extends DBConnPool {

	public BoardDAO() {
		super();
	}

	// 게시글 갯수 가져오기
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;
		String sql = "select count(*) from board";
		if (map.get("searchWord") != null) {
			sql += " where " + map.get("searchField") + " " + " like '%" + map.get("searchWord") + "%'";
		}

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			rs.next();
			totalCount = rs.getInt(1);
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return totalCount;
	}

	// 게시글 전체 목록 가져오기
	public List<BoardDTO> selectList(Map<String, Object> map) {
		List<BoardDTO> lists = new ArrayList<BoardDTO>();
		String sql = "select * from board";
		if (map.get("searchWord") != null) {
			sql += " where " + map.get("searchField") + " " + " like '%" + map.get("searchWord") + "%'";
		}
		sql += " order by num desc";
		System.out.println(sql);
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setContent(rs.getString("content"));
				dto.setId(rs.getString("id"));
				dto.setNum(rs.getString("num"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setTitle(rs.getString("title"));
				dto.setVisitcount(rs.getString("visitcount"));
				lists.add(dto);
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return lists;
	}
	//페이징 기능 
	public List<BoardDTO> selectListPage(Map<String, Object>map){
		List<BoardDTO> lists = new Vector<BoardDTO>();
		String sql = "select * from ( select Tb.*, rownum rNum from ( select * from board";
		if(map.get("searchWord") !=null) {
			sql += " where "+map.get("searchField")
				+" like '%"+map.get("searchWord")+"%'";
		}
		sql += " order by num desc )Tb) where rNum between ? and ?";
		try {
			 psmt = con.prepareStatement(sql);
			 psmt.setString(1, map.get("start").toString());
			 psmt.setString(2, map.get("end").toString());
			 rs = psmt.executeQuery();
			while (rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setContent(rs.getString("content"));
				dto.setId(rs.getString("id"));
				dto.setNum(rs.getString("num"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setTitle(rs.getString("title"));
				dto.setVisitcount(rs.getString("visitcount"));
				lists.add(dto);
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return lists;
	}

	// 게시글 데이터를 받아 DB에 추가
	public int insertWrite(BoardDTO dto) {
		int result = 0;
		String sql = "insert into board("
					+"num, title, content, id, visitcount) values ("
					+"seq_board_num.nextval ,  ?, ?, ?, 0)";
		System.out.println("insertWrite");
		System.out.println(dto.getTitle());
		System.out.println(dto.getContent());
		System.out.println(dto.getId());
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getId());

			result = psmt.executeUpdate(); // 성공 시 추가한 행의 개수를 돌려줍니다.
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return result;
	}
	
	//지정한 게시물을 찾아 내용을 반환합니다
	public BoardDTO selectView(String num) {
		BoardDTO dto = new BoardDTO();
		String sql = "select b.*, m.name"
				+" from member m inner join board b"
				+" on m.id=b.id "
				+" where num=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, num);
			rs = psmt.executeQuery();

			if(rs.next()) {
				dto.setNum(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString("visitcount"));
				dto.setName(rs.getString("name"));
			}
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		return dto;
	}
	//게시물 카운팅
	public void updateVisitCount(String num) {
		String sql = "update board set visitcount = visitcount + 1 where num=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, num);
			psmt.executeQuery();//executeUpdate도 가능하며 적용된 행의 개수르 알 필요가 없다면 query를 사용해도 무방

			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	
	//수정하기
	public int updateEdit(BoardDTO dto) {
		int result = 0;
		String sql = "update board set title = ?, content = ? where num = ? ";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getNum());
			result = psmt.executeUpdate();
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		return result;
	}
	
	//delete
	public int delete(String num) {
		int result = 0;
		String sql = "delete from board where num = ? ";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, num);
			result = psmt.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		
		return result;
	}

}
