package com.koreait.app.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.ActionForward;

@WebServlet("*.bo")
public class BoardFrontController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp)  
			throws ServletException, IOException {
		String requestURI = req.getRequestURI();
		ActionForward forward = null;
		
		switch (requestURI) {
			case "/board/Boardlist.bo":
				forward = new BoardListAction().execute(req, resp);
				break;
			case "/board/BoardWrite.bo":
				forward = new ActionForward(true, req.getContextPath() + "/app/board/boardwrite.jsp");
				break;
			case "/board/BoardWriteOk.bo":
				forward = new BoardWriteOkAction().execute(req, resp);
				break;
			case "/board/BoardView.bo":
				forward = new BoardViewAction().execute(req, resp);
				break;
			case "/board/AddReply.bo":
				forward = new AddReplyAction().execute(req, resp);
				break;
			case "/board/UpdateReply.bo":
				forward = new UpdateReplyAction().execute(req, resp);
				break;
			case "/board/DeleteReply.bo":
				forward = new DeleteReplyAction().execute(req, resp);
				break;
				
		} 
		
		if( forward != null ) {
			if( forward.isRedirect() ) {	// redirect
				resp.sendRedirect(forward.getPath());
			} else {						// forward
				RequestDispatcher disp = req.getRequestDispatcher(forward.getPath());
				disp.forward(req, resp);
			}
		}
		
	}
	
}


















