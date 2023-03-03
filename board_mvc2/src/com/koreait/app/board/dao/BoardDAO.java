package com.koreait.app.board.dao;

import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.koreait.app.board.mybatis.SqlMapConfig;


public class BoardDAO {
	SqlSession sqlsession;
	SqlSessionFactory factory = SqlMapConfig.getFactory();

	
	public BoardDAO() {
		// autocommit
		sqlsession = factory.openSession(true);
		
	}

	public List<BoardDTO> getBoardList( int startRow, int endRow ) {
		HashMap<String, Integer> datas = new HashMap<>();
		datas.put("startRow", startRow);
		datas.put("endRow", endRow);
		List<BoardDTO> boardList = sqlsession.selectList("Board.getBoardList", datas);
		return boardList;
	}

	public int getBoardCnt() {
		return sqlsession.selectOne("Board.getBoardCnt");
	}

	public boolean insertBoard(BoardDTO board) {
		boolean result = false;
		
		if(sqlsession.insert("Board.insertBoard", board) == 1) {
			result = true;
		}
		
		System.out.println("result : "+result);
		
		return result;
	}

	public BoardDTO getDetail(int boardnum) {
		return (BoardDTO)sqlsession.selectOne("Board.getDetail", boardnum);
	}

	public void updateReadCount(int boardnum) {
		sqlsession.update("Board.updateReadCount",boardnum);
	}

	public int getSeq() {
		return sqlsession.selectOne("Board.getSeq");
	}

	public boolean addReply(ReplyDTO reply) {
		boolean result = false;
		
		if(sqlsession.insert("Board.addReply", reply) != 0) {
			result = true;
		}
		
		return result;
	}

	public List<ReplyDTO> getReplys(int boardnum) {
		List<ReplyDTO> list =  sqlsession.selectList("Board.getReplys",boardnum);
		return list;
	}

	public boolean updateReply(int replynum, String replycontents) {
		boolean result = false;
		HashMap<String, Object> datas = new HashMap<>();
		datas.put("replynum", replynum);
		datas.put("replycontents", replycontents);
		
		if(sqlsession.update("Board.updateReply", datas) != 0) {
			result = true;
		}
		
		return result;
	}

	public boolean deleteReply(int replynum) {
		boolean result  = false;
		
		if(sqlsession.delete("Board.deleteReply", replynum) == 1) {
			result = true;
		}
		
		return result;
	}
}


















