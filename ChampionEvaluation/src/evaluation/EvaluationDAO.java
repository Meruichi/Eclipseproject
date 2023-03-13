package evaluation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DatabaseUtil;

public class EvaluationDAO {

	public int write(EvaluationDTO evaluationDTO) {
		String SQL = "INSERT INTO EVALUATION VALUES(NULL, ?, ?, ?, ?, ?, ?, ?, ?, ?, 0)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			// secure코딩(replace)
			pstmt.setString(1, evaluationDTO.getUserID().replace("<", "&lt;").replace(">", "&gt;").replace("\r\n", "<br>"));
			pstmt.setString(2, evaluationDTO.getChampionName().replace("<", "&lt;").replace(">", "&gt;").replace("\r\n", "<br>"));
			pstmt.setString(3, evaluationDTO.getChampionSeason().replace("<", "&lt;").replace(">", "&gt;").replace("\r\n", "<br>"));
			pstmt.setString(4, evaluationDTO.getChampionDivide().replace("<", "&lt;").replace(">", "&gt;").replace("\r\n", "<br>"));
			pstmt.setString(5, evaluationDTO.getEvaluationTitle().replace("<", "&lt;").replace(">", "&gt;").replace("\r\n", "<br>"));
			pstmt.setString(6, evaluationDTO.getEvaluationContent().replace("<", "&lt;").replace(">", "&gt;").replace("\r\n", "<br>"));
			pstmt.setString(7, evaluationDTO.getTotalScore().replace("<", "&lt;").replace(">", "&gt;").replace("\r\n", "<br>"));
			pstmt.setString(8, evaluationDTO.getLaneScore().replace("<", "&lt;").replace(">", "&gt;").replace("\r\n", "<br>"));
			pstmt.setString(9, evaluationDTO.getTeamFightScore().replace("<", "&lt;").replace(">", "&gt;").replace("\r\n", "<br>"));
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {if(conn != null) conn.close();}catch(Exception e) {e.printStackTrace();}
			try {if(pstmt != null) pstmt.close();}catch(Exception e) {e.printStackTrace();}
			try {if(rs != null) rs.close();}catch(Exception e) {e.printStackTrace();}
		}
		return -1; //데이터베이스 오류
	}
	
	public ArrayList<EvaluationDTO> getList (String championDivide, String searchType,
			String search, int pageNumber){
		if(championDivide.equals("전체")) {
			championDivide = "";
		}
		ArrayList<EvaluationDTO> evaluationList = null;
		String SQL = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			if(searchType.equals("최신순")) {
				SQL = "SELECT * FROM EVALUATION WHERE championDivide LIKE ? AND CONCAT(championName, evaluationTitle, evaluationContent) LIKE"
						+ "? ORDER BY evaluationID DESC LIMIT " + pageNumber * 5 + ", " + pageNumber * 5 + 6;
			}else if(searchType.equals("추천순")) {
				SQL = "SELECT * FROM EVALUATION WHERE championDivide LIKE ? AND CONCAT(championName, evaluationTitle, evaluationContent) LIKE"
						+ "? ORDER BY recommendCount DESC LIMIT " + pageNumber * 5 + ", " + pageNumber * 5 + 6;
			}
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, "%" + championDivide + "%");
			pstmt.setString(2, "%" + search + "%");
			rs = pstmt.executeQuery();
			evaluationList = new ArrayList<EvaluationDTO>();
			while(rs.next()) {
				EvaluationDTO evaluation = new EvaluationDTO(
						rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getString(6),
						rs.getString(7),
						rs.getString(8),
						rs.getString(9),
						rs.getString(10),
						rs.getInt(11)						
					);
					evaluationList.add(evaluation);
			}
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {if(conn != null) conn.close();}catch(Exception e) {e.printStackTrace();}
			try {if(pstmt != null) pstmt.close();}catch(Exception e) {e.printStackTrace();}
			try {if(rs != null) rs.close();}catch(Exception e) {e.printStackTrace();}
		}
		return evaluationList; // 검색 실패시엔 null값이 반환됨
		}
	
	public int recommend(String evaluationID) {
		String SQL = "UPDATE EVALUATION SET recommendCount = recommendCount + 1 WHERE evaluationID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, Integer.parseInt(evaluationID));
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {if(conn != null) conn.close();}catch(Exception e) {e.printStackTrace();}
			try {if(pstmt != null) pstmt.close();}catch(Exception e) {e.printStackTrace();}
			try {if(rs != null) rs.close();}catch(Exception e) {e.printStackTrace();}
		}
		return -1; // database오류
	}
	
	public int delete(String evaluationID) {
		String SQL = "DELETE FROM EVALUATION WHERE evaluationID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, Integer.parseInt(evaluationID));
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {if(conn != null) conn.close();}catch(Exception e) {e.printStackTrace();}
			try {if(pstmt != null) pstmt.close();}catch(Exception e) {e.printStackTrace();}
			try {if(rs != null) rs.close();}catch(Exception e) {e.printStackTrace();}
		}
		return -1; // database오류
	}
	
	public String getUserID(String evaluationID) {
		String SQL = "SELECT userID FROM EVALUATION WHERE evaluationID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, Integer.parseInt(evaluationID));
			rs =  pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {if(conn != null) conn.close();}catch(Exception e) {e.printStackTrace();}
			try {if(pstmt != null) pstmt.close();}catch(Exception e) {e.printStackTrace();}
			try {if(rs != null) rs.close();}catch(Exception e) {e.printStackTrace();}
		}
		return null; // 존재하지 않는 강의평가글
	}
	
	
}
