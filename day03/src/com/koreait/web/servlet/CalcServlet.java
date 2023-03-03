package com.koreait.web.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/calc")
public class CalcServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest arg0, HttpServletResponse arg1) 
			throws ServletException, IOException {
		
//		arg0.setCharacterEncoding("UTF-8");		
		
//		arg1.setCharacterEncoding("UTF-8");
//		arg1.setContentType("text/html charset=UTF-8");
		
		/* calc2의 submit name을 operator가아닌 button으로 했을 때 내가 한것.
		int x = Integer.parseInt(arg0.getParameter("x"));
		int y = Integer.parseInt(arg0.getParameter("y"));
		String btn = arg0.getParameter("button");
		if(btn.equals("덧셈")){
			out.println("result is " + (x + y));}
		else {out.println("result is " + (x - y));} */
		
		String xStr = arg0.getParameter("x");
		String yStr = arg0.getParameter("y");
		String op = arg0.getParameter("operator");
		int x = 0; int y = 0; int result = 0;
		if( xStr != null && !xStr.equals("")) {x = Integer.parseInt(xStr);}
		if( yStr != null && !yStr.equals("")) {y = Integer.parseInt(yStr);}
		
		if(op.equals("덧셈")) {result = x + y;}
		else {result = x - y;}
		arg1.getWriter().println("result is " + result);

	}
}
