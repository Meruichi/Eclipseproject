package com.koreait.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/myservlet")
public class MyServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest arg0, HttpServletResponse arg1)
			throws ServletException, IOException {
		arg0.setAttribute("result", "success");
		
		String[] names = {"lsh", "abc"};
		arg0.setAttribute("names", names);
		
		Map<String, Object> notice = new HashMap<String, Object>();
		notice.put("id", 1);
		notice.put("title", "el학습");
		arg0.setAttribute("notice", notice);

		RequestDispatcher dispatcher = arg0.getRequestDispatcher("/el/el_test3.jsp");
		dispatcher.forward(arg0, arg1);
		
	}
}
