package com.freeboard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.MyServlet;

@WebServlet("/freeboard/*")
public class FreeboardServlet extends MyServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String uri = req.getRequestURI();
		if(uri.indexOf("freeboard.do")!=-1) {
			
			forward(req, resp, "/WEB-INF/views/freeboard/freeboard.jsp");
		}
		
	}

}
