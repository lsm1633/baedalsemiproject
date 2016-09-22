package com.main;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.notice.NoticeDAO;
import com.notice.NoticeDTO;
import com.util.MyServlet;

@WebServlet("/main.do")
public class MainServlet extends MyServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String uri = req.getRequestURI();
		String cp = req.getContextPath();
		NoticeDAO dao = new NoticeDAO();
		
		if(uri.indexOf("main.do")!=-1) {
			String page = req.getParameter("page");
	         int current_page=1;
	         if(page!=null)
	            current_page = Integer.parseInt(page);
	                                    
	         // 공지글 리스트
	         List<NoticeDTO> listNotice = null;
	         listNotice = dao.listNotice();
	         Iterator<NoticeDTO> itNotice = listNotice.iterator();
	                  
	         while(itNotice.hasNext()) {
	            NoticeDTO dto = itNotice.next();
	            dto.setCreated(dto.getCreated().substring(0, 10));
	         }                                       
	         
	         String articleUrl=cp+"/notice/article.do?page="+current_page;                                          
	         
	         req.setAttribute("listNotice", listNotice);
	         req.setAttribute("articleUrl", articleUrl);
			
			forward(req, resp, "/WEB-INF/views/main/main.jsp");
		}
		
		
	}
	
}
