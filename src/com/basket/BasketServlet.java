package com.basket;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.SessionInfo;
import com.util.MyServlet;

@WebServlet("/basket/*")
public class BasketServlet extends MyServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		BasketDAO dao = new BasketDAO();
		
		HttpSession session = req.getSession();
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		String uri = req.getRequestURI();
		String cp = req.getContextPath();
		
		if(uri.indexOf("menuadd_ok.do")!=-1) {
			BasketDTO dto = new BasketDTO();
			
			String ceoId = req.getParameter("ceoId");
			String userId = info.getUserId();
			String menuName = req.getParameter("menuName");
			int price = Integer.parseInt(req.getParameter("price"));
			
			dto.setUserId(userId);
			dto.setCeoId(ceoId);
			dto.setMenuName(menuName);
			dto.setPrice(price);
			
			dao.insertBasket(dto);
			resp.sendRedirect(cp+"/menu/list.do?ceoId="+ceoId);
		}
	}


}
