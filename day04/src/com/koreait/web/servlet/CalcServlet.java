package com.koreait.web.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/calc")
public class CalcServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest arg0, HttpServletResponse arg1) throws ServletException, IOException {
		
		arg0.setCharacterEncoding("UTF-8");		
		
		arg1.setCharacterEncoding("UTF-8");
		arg1.setContentType("text/html charset=UTF-8");	
		
		// Application 저장소 선언
		ServletContext application = arg0.getServletContext();
		
		PrintWriter out = arg1.getWriter();
		String value_ = arg0.getParameter("value");
		String op = arg0.getParameter("operator");
		
		int value = 0;
		
		if( !value_.equals("")) {
			value = Integer.parseInt(value_);
		}
		
		// 계산
		if( op.equals("=")) {
			int x = (Integer)application.getAttribute("value"); // application에 저장된 값
			
			int y = value; // 2번쨰로 요청보낸 값
			String operator = (String)application.getAttribute("op");
			
			int result = 0;
			
			if(operator.equals("+")){
				result = x + y;
			}else {result = x - y;}
			out.println("결과 값 : " + result);
		}else {//op값이 + 또는 - 이면, application 저장
			application.setAttribute("value", value);
			application.setAttribute("op", op);
			}
		
		
	}
}
