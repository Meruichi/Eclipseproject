package model.animal;

import model.common.JDBCUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class AnimalDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql_insertAll = "insert into animal values((select nvl(max(animal_number),0)+1 from animal),null,?,?,?,?,?,?,?,'false')";

	// 순서 : 1.구분(species) , 2.성별(gender), 3,4.크기(weight 이상,미만), 5,6.연령(age 이상,이하), 7.이름검색(name)
	String sql_select = "SELECT * FROM animal WHERE animal_species = ? AND animal_gender = ? AND (animal_weight >= ? and animal_weight < ?) AND (animal_age >= ? and animal_age <= ?) AND animal_name LIKE '%'||?||'%' ;";
	String sql_selectAll = "SELECT * FROM animal";
	String sql_selectOne = "SELECT * FROM animal WHERE animal_number = ? ";
	
	
	public void insertAll(ArrayList<AnimalVO> datas) {
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(sql_insertAll);
			for (AnimalVO data : datas) {
				pstmt.setInt(1, data.getAnimal_number());
				pstmt.setString(2, data.getAnimal_name());
				pstmt.setString(3, data.getAnimal_species());
				pstmt.setString(4, data.getAnimal_type());
				pstmt.setString(5, data.getAnimal_gender());
				pstmt.setString(6, data.getAnimal_age());
				pstmt.setInt(7, data.getAnimal_weight());
				pstmt.setString(8, data.getAnimal_image());
				pstmt.executeUpdate();
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("init 데이터 insert 중 문제발생");
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
	}
	// 조건부 동물 검색
	public void select(ArrayList<AnimalVO> datas) {
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(sql_insertAll);
			for (AnimalVO data : datas) {
				pstmt.setString(1, data.getAnimal_species());
				pstmt.setString(2, data.getAnimal_gender());
				pstmt.setInt(3, data.getAnimal_weight()); // ~이상
				pstmt.setInt(4, data.getAnimal_weight()); // ~미만
				pstmt.setString(5, data.getAnimal_age()); // ~이상
				pstmt.setString(6, data.getAnimal_age()); // ~이하
				pstmt.setInt(7, data.getAnimal_number());
				pstmt.executeUpdate();
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("init 데이터 select 중 문제발생");
		} finally {
			JDBCUtil.disconnect(pstmt, conn);
		}
		
		
	}
    //전체 동물 조회
    public ArrayList<AnimalVO> selectAll() { 
        conn = JDBCUtil.connect();
        ArrayList<AnimalVO> datas = new ArrayList<AnimalVO>();
        try {
            pstmt = conn.prepareStatement(sql_selectAll);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
            	AnimalVO vo = new AnimalVO();
                vo.setAnimal_number(rs.getInt("Animal_number"));
                vo.setSupporter_id(rs.getString("Supporter_id"));
                vo.setAnimal_name(rs.getString("Animal_name"));
                vo.setAnimal_species(rs.getString("Animal_species"));
                vo.setAnimal_type(rs.getString("Animal_type"));
                vo.setAnimal_gender(rs.getString("Animal_gender"));
                vo.setAnimal_age(rs.getString("Animal_age"));
                vo.setAnimal_weight(rs.getInt("Animal_weight"));
                vo.setAnimal_image(rs.getString("Animal_image"));
                vo.setIsAdoption(rs.getString("IsAdoption"));
                System.out.println("dao : "+vo);
                datas.add(vo);
            }
        } catch (SQLException e) {
            System.out.println("AnimalDAO의 selectAll()에서 문제 발생");
            e.printStackTrace();
        } finally {
            JDBCUtil.disconnect(pstmt, conn);
        }
        return datas;
    }
    //동물 상세보기
    public ArrayList<AnimalVO> selectOne() { 
        conn = JDBCUtil.connect();
        ArrayList<AnimalVO> datas = new ArrayList<AnimalVO>();
        try {
            pstmt = conn.prepareStatement(sql_selectAll);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
            	AnimalVO vo = new AnimalVO();
                vo.setAnimal_number(rs.getInt("Animal_number"));
                vo.setSupporter_id(rs.getString("Supporter_id"));
                vo.setAnimal_name(rs.getString("Animal_name"));
                vo.setAnimal_species(rs.getString("Animal_species"));
                vo.setAnimal_type(rs.getString("Animal_type"));
                vo.setAnimal_gender(rs.getString("Animal_gender"));
                vo.setAnimal_age(rs.getString("Animal_age"));
                vo.setAnimal_weight(rs.getInt("Animal_weight"));
                vo.setAnimal_image(rs.getString("Animal_image"));
                vo.setIsAdoption(rs.getString("IsAdoption"));
                datas.add(vo);
            }
        } catch (SQLException e) {
            System.out.println("AnimalDAO의 selectOne()에서 문제 발생");
            e.printStackTrace();
        } finally {
            JDBCUtil.disconnect(pstmt, conn);
        }
        return datas;
    }
}
