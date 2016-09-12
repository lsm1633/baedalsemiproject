package com.ceomember;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.MyServlet;

@WebServlet("/ceomember/*")
public class MemberServlet extends MyServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		String uri=req.getRequestURI();
	    String cp=req.getContextPath();
	    
	    HttpSession session = req.getSession();
	    
	    if(uri.indexOf("join.do")!=-1){
	    	//회원가입 폼
	    	
	    	req.setAttribute("mode", "created");
	    	req.setAttribute("title", "회원가입");
	    	
	    	forward(req, resp, "/WEB-INF/views/ceomember/join.jsp");
	    }
		
	}

}
