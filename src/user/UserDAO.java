package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() { //mysql�� �����ϵ��� �ϴ� �κ�
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
			pstmt = conn.prepareStatement(sql); //sql injection�� ����ϱ� ���� ����
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString(1).equals(userPW)) {
					return 1; //�α��� ����
				}
				else
					return 0; // ��й�ȣ ����ġ
			}
			return -1; // id������ �ǹ�
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -2; //DB����
	}
}
