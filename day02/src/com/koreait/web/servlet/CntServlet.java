package com.koreait.web.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/cnt")
public class CntServlet extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest arg0, HttpServletResponse arg1) throws ServletException, IOException {
		arg1.setCharacterEncoding("UTF-8");
		arg1.setContentType("text/html charset=UTF-8");
		/*
		 * CntServlet을 servlet class로 사용하여
		 * 사용자 url 요청: http://localhost:9090/cnt?cnt=5
		 * 화면출력 내용 :	1: 안녕 servlet
		 * 				2: 안녕 servlet
		 * 				3: 안녕 servlet
		 * 				4: 안녕 servlet
		 * 				5: 안녕 servlet     (총 5개)
		 * 사용자 url요청 : http://localhost:9090/cnt?    null or ""
		 * 화면 출력 내용 :	1: 안녕 servlet
		 * 				...
		 * 				100: 안녕 servlet */
		
		String paramCnt = arg0.getParameter("cnt");
		int cnt = 0;
		if( paramCnt != null && !paramCnt.equals("") ) {
			cnt = Integer.parseInt(paramCnt);
		}else {cnt = 100;}		
	
		PrintWriter out = arg1.getWriter();
		for(int i=1; i<=cnt; i++) {
			out.println(i + ": 안녕 Servlet" + "<br>");	
		}

	}

}
