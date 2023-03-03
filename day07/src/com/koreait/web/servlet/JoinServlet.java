package com.koreait.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.beans.UserBean;
import com.koreait.dao.UserDao;

@WebServlet("/join")
public class JoinServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userid = req.getParameter("userid");
		String userpw = req.getParameter("userpw");
		String username = req.getParameter("username");
		String userphone = req.getParameter("userphone");
		
		UserDao udao = new UserDao();
		UserBean bean = new UserBean();
		bean.setUserid(userid);
		bean.setUserpw(userpw);
		bean.setUsername(username);
		bean.setUserphone(userphone);
		
		boolean check = udao.join(bean);
		if( check ){ // true
			//가입성송
		}else{
			//가입 실패
		}	
	}
}
