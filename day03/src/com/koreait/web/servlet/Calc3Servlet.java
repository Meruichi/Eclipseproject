package com.koreait.web.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/calc3")
public class Calc3Servlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest arg0, HttpServletResponse arg1) 
			throws ServletException, IOException {
		String[] numStr = arg0.getParameterValues("num");
			
		int result = 0;
		for(int i=0; i<numStr.length; i++) {
			int num = Integer.parseInt(numStr[i]);
			result += num;
		}
		arg1.getWriter().println("result is " + result);
		// printf도 됨.
	}
}
