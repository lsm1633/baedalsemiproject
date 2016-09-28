package com.orderlist;

import java.io.IOException;
import java.net.URLDecoder;

import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.SessionInfo;
import com.util.MyServlet;
import com.util.MyUtil;

@WebServlet("/orderlist/*")
public class OrderListServlet extends MyServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		OrderListDAO dao = new OrderListDAO();
		MyUtil util = new MyUtil();
		
		// 로그인 정보
		HttpSession session = req.getSession();
		SessionInfo info = (SessionInfo)session.getAttribute("member");
						
		String uri = req.getRequestURI();
		String cp = req.getContextPath();
		
		if(uri.indexOf("orderlist.do")!=-1) {
			// 게시물 리스트
			String page = req.getParameter("page");
			String userId=info.getUserId();
			
			int current_page=1;
			if(page!=null)
				current_page = Integer.parseInt(page);			
			
			
			int numPerPage=10;
			int dataCount, total_page;
			
			dataCount = dao.dataCount(userId);		
			
			total_page = util.pageCount(numPerPage, dataCount);
			
			if(current_page > total_page)
				current_page=total_page;
			
			int start = (current_page-1)*numPerPage+1;
			int end = current_page*numPerPage;
			
			List<OrderListDTO> list = dao.listNotice(userId,start,end);			
			
			int listNum,n=0;
			Iterator<OrderListDTO> it = list.iterator();
			while(it.hasNext()) {
				OrderListDTO dto = it.next();
				listNum=dataCount-(start+n-1);
				dto.setListNum(listNum);
				n++;
			}
			
			String listUrl;
			String articleUrl;
			
			
			listUrl=cp+"/orderlist/orderlist.do";
			articleUrl=cp+"/orderlist/article.do?page="+current_page;
			
			
			String paging = util.paging(current_page, total_page, listUrl);
			
			// 데이터 포워딩
			req.setAttribute("list", list);			
			req.setAttribute("articleUrl", articleUrl);
			req.setAttribute("dataCount", dataCount);
			req.setAttribute("paging", paging);
			req.setAttribute("page", current_page);
			req.setAttribute("total_page", total_page);
			
			forward(req, resp, "/WEB-INF/views/orderlist/orderlist.jsp");
		}  else if(uri.indexOf("article.do") != -1) {
			// 글보기
			
			int orderNum = Integer.parseInt(req.getParameter("num"));
			String page = req.getParameter("page");
			
			String searchKey = req.getParameter("searchKey");
			String searchValue = req.getParameter("searchValue");
			if(searchKey==null) {
				searchKey="subject";
				searchValue="";
			}
			searchValue=URLDecoder.decode(searchValue, "utf-8");			
		 
			
			// 게시물 가져오기
			OrderListDTO dto = dao.readOrderlist(orderNum);
			if(dto==null) {
				resp.sendRedirect(cp+"/orderlist/orderlist.do?page=" + page);
				return;
			}		    			
						
			String params = "page=" + page;			
			
			// 전송값 포워딩
			req.setAttribute("dto", dto);			
			req.setAttribute("params", params);
			req.setAttribute("page", page);
			
			forward(req, resp, "/WEB-INF/views/orderlist/article.jsp");		
		} 
		
	}

}
