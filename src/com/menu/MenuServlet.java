package com.menu;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.basket.BasketDAO;
import com.basket.BasketDTO;
import com.member.SessionInfo;
import com.util.MyServlet;
import com.util.MyUtil;

@WebServlet("/menu/*")
public class MenuServlet extends MyServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		MenuDAO dao = new MenuDAO();
		BasketDAO dao2 = new BasketDAO();
		MyUtil util = new MyUtil();
		
		String uri = req.getRequestURI();
		String cp = req.getContextPath();
		
		HttpSession session = req.getSession();
	
		
		
		if(uri.indexOf("list.do")!=-1) {
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			String page = req.getParameter("page");
			int current_page=1;
			if(page!=null)
				current_page = Integer.parseInt(page);
			
			String ceoId = req.getParameter("ceoId");
			String userId;
			if(info == null) {
				userId = "";
			} else {
				userId = info.getUserId();
			}
			
			int numPerPage=100;
			int dataCount, total_page;
			
		
			dataCount = dao.dataCount(ceoId);
		
			total_page = util.pageCount(numPerPage, dataCount);
			
			if(current_page > total_page)
				current_page=total_page;
			
			int start = (current_page-1)*numPerPage+1;
			int end = current_page*numPerPage;
			
			List<MenuDTO> list;
			list = dao.listMenu(start, end, ceoId);
			
			List<BasketDTO> list2;
			if(userId == null) {
				list2 = null;
			} else {
				list2 = dao2.listBasket(userId, ceoId);
			}
			
			String listUrl = cp+"/menu/list.do";
			String paging = util.paging(current_page, total_page, listUrl);
			
			req.setAttribute("list", list);
			req.setAttribute("list2", list2);
			req.setAttribute("dataCount", dataCount);
			req.setAttribute("paging", paging);
			req.setAttribute("page", current_page);
			req.setAttribute("total_page", total_page);
			
			forward(req, resp, "/WEB-INF/views/menu/list.jsp");
		}  else if(uri.indexOf("menuadd_ok.do")!=-1) {
			BasketDTO dto = new BasketDTO();
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			if(info==null) {
				forward(req, resp, "/WEB-INF/views/member/login.jsp");
				return;
			}
			dao2 = new BasketDAO();
			
			String ceoId = req.getParameter("ceoId");
			String userId = info.getUserId();
			String menuName = req.getParameter("name");
			int price = Integer.parseInt(req.getParameter("price"));
		
			 List<BasketDTO> list;
	         if(userId == null) {
	            list = null;
	         } else {
	            list = dao2.listBasket(userId, ceoId);
	         }
	         
	         int i=0;
	         Iterator<BasketDTO> it=list.iterator();
	         while(it.hasNext()){
	            BasketDTO dto2=it.next();
	            if(dto2.getMenuName().equals(menuName) && dto2.getCeoId().equals(ceoId) && dto2.getUserId().equals(userId)){
	               dto.setCeoId(ceoId);
	               dto.setUserId(userId);
	               dto.setMenuName(menuName);
	               dto.setPrice(price);
	               
	               dao2.updateBasket(dto);
	               resp.sendRedirect(cp+"/menu/list.do?ceoId="+ceoId);
	               i=1;
	            }
	         }
	         
	         if(i==0){
	            dto.setCeoId(ceoId);
	            dto.setUserId(userId);
	            dto.setMenuName(menuName);
	            dto.setPrice(price);
	               
	            dao2.insertBasket(dto);      
	            
	            resp.sendRedirect(cp+"/menu/list.do?ceoId="+ceoId);
	         }
		} else if(uri.indexOf("menudelete_ok.do")!=-1) {

			String userId = req.getParameter("userId");
			String ceoId = req.getParameter("ceoId");
			String menuName = req.getParameter("menuName");
		
			
			dao2.deleteBasket(userId, ceoId, menuName);
			resp.sendRedirect(cp+"/menu/list.do?ceoId="+ceoId);
		}
		
	}

}
