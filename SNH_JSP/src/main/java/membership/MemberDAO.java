package membership;



import javax.servlet.ServletContext;

import common.JDBCConnect;

public class MemberDAO extends JDBCConnect {
	
	public MemberDAO(ServletContext application) {
		super(application);
	}
	
	public MemberDTO getMemberDTO(String uid, String upass) {
		MemberDTO dto = new MemberDTO();
		String sql = "select * from member where id=? and pass=?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, uid);
			psmt.setString(2, upass);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString("name"));
				dto.setRegidate(rs.getString(4));
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return dto;
	}
}
