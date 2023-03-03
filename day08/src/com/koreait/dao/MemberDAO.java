package com.koreait.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.koreait.beans.MemberBean;
public class MemberDAO {
	// age_db.jsp -> getAge
	public int getAge(String name) {
		int age = 0;
		
		try {
	 	Connection conn = DBConnection.getConnection();
	 	String sql = "SELECT age FROM MEMBER WHERE name = ?";
	 	PreparedStatement pstm = conn.prepareStatement(sql);
	 	
	 	pstm.setString(1, name);
		ResultSet rs = pstm.executeQuery();
		
		if(rs.next()) {
			age = rs.getInt(1);
			
		}
		
		} 
		catch(SQLException e) {
					e.printStackTrace();}
		
		
		return age;
	}
		public ArrayList<MemberBean> selectAll(){
			String sql = "select * from member";
			ArrayList<MemberBean> result = new ArrayList<MemberBean>();
			try {
		 	Connection conn = DBConnection.getConnection();			
		 	PreparedStatement pstm = conn.prepareStatement(sql);
		 	ResultSet rs = pstm.executeQuery();
		 	
		 	while( rs.next()) {
		 		MemberBean member = new MemberBean();
		 		member.setName(rs.getString(1));
		 		member.setAge(rs.getInt(2));
		 		result.add(member);
		 	}
		 	
		 	
			}catch(SQLException e) {e.printStackTrace();}
			return result;
		}
	
}
