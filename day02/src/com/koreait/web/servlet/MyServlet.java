package com.koreait.web.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/hello")
public class MyServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest arg0, HttpServletResponse arg1)
			throws ServletException, IOException {
		arg1.setCharacterEncoding("UTF-8");
		arg1.setContentType("text/html charset=UTF-8");
		
		String paramCnt = arg0.getParameter("cnt");
		System.out.println("parmaCnt : " + paramCnt);
		int cnt = 0;
		if( paramCnt != null && !paramCnt.equals("") ) {
			cnt = Integer.parseInt(paramCnt);
		}else {cnt = 100;}
		
		//int cnt = Integer.parseInt(arg0.getParameter("cnt"));
		System.out.println("cnt : " + cnt );
			PrintWriter out = arg1.getWriter();
			out.println("안녕 Servlet Annotation!!!!!");
	}
}
