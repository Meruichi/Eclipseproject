package com.koreait.app.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.app.board.dao.BoardDAO;

public class DeleteReplyAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		BoardDAO bdao = new BoardDAO();
		
		int replynum = Integer.parseInt(req.getParameter("replynum"));
		String boardnum = req.getParameter("boardnum");
		
		if(bdao.deleteReply(replynum) ) {
			forward.setRedirect(true);
			forward.setPath(req.getContextPath() + "/board/BoardView.bo?boardnum=" + boardnum);
		}
		
		
		return forward;
	}
}
