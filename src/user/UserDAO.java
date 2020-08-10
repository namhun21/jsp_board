package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() { //mysql에 접속하도록 하는 부분
		try {
			String dbUrl = "jdbc:mysql://localhost:3306/BBS?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
			String dbID = "root";
			String dbPW = "1234";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbUrl,dbID,dbPW);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public int login(String userID, String userPW) {
		String sql = "select userPW from user where userID = ?";
		try {
			pstmt = conn.prepareStatement(sql); //sql injection을 방어하기 위한 수단
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString(1).equals(userPW)) {
					return 1; //로그인 성공
				}
				else
					return 0; // 비밀번호 불일치
			}
			return -1; // id없음을 의미
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -2; //DB오류
	}
}
