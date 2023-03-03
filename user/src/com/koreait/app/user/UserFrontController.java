package com.koreait.app.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.action.Action;
import com.koreait.action.ActionForward;

@WebServlet("*.us")
public class UserFrontController extends HttpServlet{
	
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
			throws IOException, ServletException {
		String requestURI = req.getRequestURI();
		ActionForward forward = null;
		
		if( requestURI.equals("/user/UserJoin.us") ) {
			forward = new UserJoinAction().execute(req, resp);
			
		}else if(requestURI.equals("/user/userLogin.us")){
			forward = new ActionForward(false, "/app/user/loginview.jsp");
		}else if(requestURI.equals("/user/userLoginOk.us"))	{
			forward = new UserLoginOkAction().execute(req,resp);			
		}
		
		// 일괄처리
		if( forward != null ){
			if( forward.isRedirect() ) {	// redirect
				resp.sendRedirect(forward.getPath());
			} else {						// forward
				RequestDispatcher disp = req.getRequestDispatcher(forward.getPath());
				disp.forward(req, resp);
			}
		}
		
	}

}














