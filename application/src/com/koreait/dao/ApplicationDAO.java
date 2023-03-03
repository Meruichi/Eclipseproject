package model.application;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.applcation.ApplicationVO;
import model.common.JDBCUtil;
import java.util.ArrayList;
public class ApplicationDAO {

	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public boolean join(ApplicationVO application){
		String sql = "insert into application values(select nvl(max(application_number),0)+1 from application_number,?,?,?,?)";
		int result = 0;
		
		try {	
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, application.getAnimal_number());  	// page를 통해 get?
			pstmt.setString(2, application.getSupporter_id()); 	// page를 통해 get?
			pstmt.setString(3, application.getApplication_title());
			pstmt.setString(4, application.getApplication_content());
			
			// executeUpdate()
			// - SQL DML(데이터 조작어) 행의 수 return
			// - 결과값이 없는 경우 0 return
			result = pstmt.executeUpdate();
		}catch(SQLException e){ e.printStackTrace();}
		
		if( result != 0) { // 성공일경우
			return true;
		} else{ // 실패일 경우
			return false;
		}

		
		
	}	
}
