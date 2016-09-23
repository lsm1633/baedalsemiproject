package com.menu;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.MyServlet;
import com.util.MyUtil;

@WebServlet("/menu/*")
public class MenuServlet extends MyServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		MenuDAO dao = new MenuDAO();
		MyUtil util = new MyUtil();
		
		String uri = req.getRequestURI();
		String cp = req.getContextPath();
		
		if(uri.indexOf("list.do")!=-1) {
			
			String page = req.getParameter("page");
			int current_page=1;
			if(page!=null)
				current_page = Integer.parseInt(page);
			
			String ceoId = req.getParameter("ceoId");
			
			int numPerPage=9;
			int dataCount, total_page;
			
		
			dataCount = dao.dataCount(ceoId);
		
			total_page = util.pageCount(numPerPage, dataCount);
			
			if(current_page > total_page)
				current_page=total_page;
			
			int start = (current_page-1)*numPerPage+1;
			int end = current_page*numPerPage;
			
			List<MenuDTO> list;
			list = dao.listMenu(start, end, ceoId);
			
			String listUrl = cp+"/menu/list.do";
			String paging = util.paging(current_page, total_page, listUrl);
			
			req.setAttribute("list", list);
			req.setAttribute("dataCount", dataCount);
			req.setAttribute("paging", paging);
			req.setAttribute("page", current_page);
			req.setAttribute("total_page", total_page);
			
			forward(req, resp, "/WEB-INF/views/menu/list.jsp");
		}
		
	}

}
