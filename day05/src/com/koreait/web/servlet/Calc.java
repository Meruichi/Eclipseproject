package com.koreait.web.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/calc")
public class Calc extends HttpServlet{
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doPost호출");
		// doGet(req, resp);  방법1 doPost에서 doGet을 호출 > doget메서드의 방법이 사용됨.
		doProcess(req, resp); // 방법2 공통메서드 만들어서 쓰기
	}
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int num1 = Integer.parseInt(req.getParameter("num1"));
		int num2 = Integer.parseInt(req.getParameter("num2"));
		
		PrintWriter out = resp.getWriter();
		out.println("<html><body>" + (num1 + num2) + "</body></html>");
	}
	
	// 공통메서드로 따로 관리
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		int num1 = Integer.parseInt(req.getParameter("num1"));
		int num2 = Integer.parseInt(req.getParameter("num2"));
		
		PrintWriter out = resp.getWriter();
		out.println("<html><body>" + (num1 + num2) + "</body></html>");
	}
}
