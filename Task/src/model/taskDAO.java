package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class taskDAO {
	String name = null;
	int cnt = 0;
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	ArrayList<DTO> array = null;
	public void conn() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String db_url = "jdbc:oracle:thin:@localhost:1521:xe";
			String db_id = "hr";
			String db_pw = "hr";
			conn = DriverManager.getConnection(db_url, db_id, db_pw);			
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void close() {

		try {
			if (rs != null) {
				rs.close();
			}
			if (psmt != null) {
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
	
	public ArrayList<DTO> graph(DTO dto) {
		array = new ArrayList<DTO>();
		conn();
		
		try {
			String sql = "select current_dt, activity, feed, drinking from task where camera_id = ? and object_id = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getCamera_id());
			psmt.setString(2, dto.getObject_id());

			rs = psmt.executeQuery();
			while(rs.next()) {
				String current_dt = rs.getString(1);
				String activity = rs.getString(2);
				String feed = rs.getString(3);
				String drinking = rs.getString(4);
				dto = new DTO(current_dt,dto.getCamera_id(),dto.getObject_id(),activity,feed,drinking);
				
				array.add(dto);
			}
			
		} catch (SQLException e) {		
			e.printStackTrace();
		} finally {
			
			close();
			
		}
		
		return array;
		
	}
	
	
}
