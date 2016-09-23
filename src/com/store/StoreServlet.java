package com.store;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.notice.NoticeDTO;
import com.util.MyServlet;
import com.util.MyUtil;

@WebServlet("/store/*")
public class StoreServlet extends MyServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		StoreDAO dao = new StoreDAO();
		MyUtil util = new MyUtil();
		
		String uri = req.getRequestURI();
		String cp = req.getContextPath();
		
		if(uri.indexOf("list.do")!=-1) {
			
			String page = req.getParameter("page");
			int current_page=1;
			if(page!=null)
				current_page = Integer.parseInt(page);
			
			String searchKey=req.getParameter("searchKey");
			String searchValue = req.getParameter("searchValue");
			String cate = req.getParameter("cate");
			
			
			if(searchKey==null) {
				searchKey="all";
				searchValue="";
			}
			
			if(cate==null)
				cate="";
			
			if(req.getMethod().equalsIgnoreCase("GET")) {
				searchValue=URLDecoder.decode(searchValue, "utf-8");
			}
			int numPerPage=9;
			int dataCount, total_page;
			
			if(searchValue.length()!=0) {
				dataCount = dao.dataCount(cate,searchKey, searchValue);
			} else {
				dataCount = dao.dataCount(cate,searchKey);
			}
			
			total_page = util.pageCount(numPerPage, dataCount);
			
			if(current_page > total_page)
				current_page=total_page;
			
			int start = (current_page-1)*numPerPage+1;
			int end = current_page*numPerPage;
			
			List<StoreDTO> list;
			if(cate.length()!=0) {
				list = dao.listStore2(start, end, searchKey, cate);
			} else {
				list = dao.listStore(start, end, searchKey, searchValue);
			}
			
			String params = "";
			String listUrl;
			String articleUrl;
			
			if(searchValue.length()==0) {
				listUrl=cp+"/store/list.do";
				articleUrl=cp+"/store/article.do?page="+current_page;
			} else {
				params = "searchKey=" + searchKey;
				params += "&searchValue=" + URLEncoder.encode(searchKey, "UTF-8");
				
				listUrl = cp + "/store/list.do?" + params;
				articleUrl = cp + "/store/article.do?page=" + current_page + "&" + params;
			}
			String paging = util.paging(current_page, total_page, listUrl);
			
			req.setAttribute("list", list);
			req.setAttribute("articleUrl", articleUrl);
			req.setAttribute("dataCount", dataCount);
			req.setAttribute("paging", paging);
			req.setAttribute("page", current_page);
			req.setAttribute("total_page", total_page);
			
			forward(req, resp, "/WEB-INF/views/store/list.jsp");
		}
	}

}
