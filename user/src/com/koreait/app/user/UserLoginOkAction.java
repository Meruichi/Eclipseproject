package com.koreait.app.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;
import com.koreait.app.user.dao.UserDAO;


public class UserLoginOkAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		UserDAO udao = new UserDAO();
		
		String userid = req.getParameter("userid");
		String userpw = req.getParameter("userpw");
		
		if(udao.login(userid,userpw) ) { //성공시
			System.out.println("로그인 성공");
			forward.setPath("/app/main/mainview.jsp");
		} else { // 실패시
			forward.setPath("/app/main/loginview.jsp?flag=false");
		}
		
		
		forward.setRedirect(false);
		
		return forward;
	}

	
	
}
