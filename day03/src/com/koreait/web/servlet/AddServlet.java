package com.koreait.web.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/add")
public class AddServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest arg0, HttpServletResponse arg1) 
			throws ServletException, IOException {
		
//		arg0.setCharacterEncoding("UTF-8");		
		
//		arg1.setCharacterEncoding("UTF-8");
//		arg1.setContentType("text/html charset=UTF-8");
		
		PrintWriter out = arg1.getWriter();
		/* 내 풀이
		int x = Integer.parseInt(arg0.getParameter("x"));
		int y = Integer.parseInt(arg0.getParameter("y"));
		out.println("result is " + (x + y));
		*/
		String xStr = arg0.getParameter("x");
		String yStr = arg0.getParameter("y"); 
		
		int x = 0;
		int y = 0;
		if( xStr != null && !xStr.equals("")) {
				x = Integer.parseInt(xStr);
		}
		if( yStr != null && !yStr.equals("")) {
			y = Integer.parseInt(yStr);
			
		int result = x + y;
		arg1.getWriter().println("result is " + result);
		
		}
	}
}
