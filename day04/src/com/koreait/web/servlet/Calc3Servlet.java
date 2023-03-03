package com.koreait.web.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/calc3")
public class Calc3Servlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest arg0, HttpServletResponse arg1) throws ServletException, IOException {
		
		arg0.setCharacterEncoding("UTF-8");		
		
		arg1.setCharacterEncoding("UTF-8");
		arg1.setContentType("text/html charset=UTF-8");	
		
		// cookie 배열
		Cookie[] cookies = arg0.getCookies();
		
		PrintWriter out = arg1.getWriter();
		String value_ = arg0.getParameter("value");
		String op = arg0.getParameter("operator");
		
		int value = 0;
		
		if( !value_.equals("")) {
			value = Integer.parseInt(value_);
		}
		
		// 계산
		if( op.equals("=")) {
			// cookie 저장된 값
			int x = 0;
			int y = value;
			// cookies 꺼내기
			for( Cookie c : cookies) {
				if(c.getName().equals("value")){
				x = Integer.parseInt(c.getValue());
				break;
				}
			}
			String operator = "";
			
			for( Cookie c : cookies) {
				if(c.getName().equals("op")){
					operator = c.getValue();
					break;
				}
			}
			
			int result = 0;
			
			if(operator.equals("+")){
				result = x + y;
			}else {result = x - y;}
			out.println("결과 값 : " + result);
		}else {//op값이 + 또는 - 이면, cookies 저장
				// cookie는 문자열 형태만 담을 수 있다.
			Cookie valueCookie = new Cookie("value", String.valueOf(value));
			Cookie opCookie = new Cookie("op", op);
			
			// 사용자에게 cookie 전달
			arg1.addCookie(valueCookie);
			arg1.addCookie(opCookie);
			
			// 페이지 전환
			arg1.sendRedirect("calc3.html");
			
			
			}
		
		
	}
}
