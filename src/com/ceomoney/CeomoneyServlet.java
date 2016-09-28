package com.ceomoney;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ceomember.SessionInfo;
import com.order.OrderDAO;
import com.order.OrderDTO;
import com.util.MyServlet;

@WebServlet("/ceomoney/*")
public class CeomoneyServlet extends MyServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String uri = req.getRequestURI();
		
		
		Date dd=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd"); 
		String today=sdf.format(dd);
		HttpSession session = req.getSession();
		
		if(uri.indexOf("money.do")!=-1){			
	        SessionInfo info2= (SessionInfo)session.getAttribute("ceomember");
	        if (info2 == null) {
	        	req.setAttribute("mode", "login");
				forward(req, resp, "/WEB-INF/views/ceomember/ceologin.jsp");
				return;
			}
	        String ceoId=info2.getCeoId();	        	        
	        String start=req.getParameter("start");
	        String last=req.getParameter("last");
	
	        
	        
	        if(start==null){
	        	start=today;
	        }
	        if(last==null){
	        	last=today;
	        }
	        
	        
	        
	        OrderDAO dao = new OrderDAO();
	        List<OrderDTO> list=null;
	        if(start.equals(today) && last.equals(today))
	            list = dao.listOrder(ceoId,today);
	        else
	        	list = dao.listOrder(ceoId,start,last);
	        
	         
	         req.setAttribute("list", list);
	         
	    	forward(req, resp, "/WEB-INF/views/ceomoney/ceomoney.jsp");
	    }
		
	}
	
}
