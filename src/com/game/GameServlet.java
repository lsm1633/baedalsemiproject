package com.game;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.MyServlet;

@WebServlet("/game/*")
public class GameServlet extends MyServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String uri = req.getRequestURI();
		
		if(uri.indexOf("sadari.do")!=-1) {
			
			forward(req, resp, "/WEB-INF/views/game/sadari.jsp");
		} else if(uri.indexOf("cal.do")!=-1) {
			
			forward(req, resp, "/WEB-INF/views/game/cal.jsp");
		}
	}

}
