package com.ceomoney;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
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
import com.util.MyUtil;

@WebServlet("/ceomoney/*")
public class CeomoneyServlet extends MyServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String uri = req.getRequestURI();
		String cp=req.getContextPath();
		
		
		OrderDAO dao=new OrderDAO();
		MyUtil util=new MyUtil();	
		
		Date dd=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:MM:SS"); 
		String today=sdf.format(dd);
		
		HttpSession session = req.getSession();
		SessionInfo info= (SessionInfo)session.getAttribute("ceomember");
		
		if(uri.indexOf("money.do")!=-1){			
		       
	        if (info == null) {
	        	req.setAttribute("mode", "login");
				forward(req, resp, "/WEB-INF/views/ceomember/ceologin.jsp");
				return;
			}
	        String ceoId=info.getCeoId();	        	        
	        String start=req.getParameter("start");
	        String last=req.getParameter("last");
   
	        
	        if(start==null){
	        	start=today;
	        }
	        if(last==null){
	        	last=today;
	        }               
	        
	        
	        List<OrderDTO> list=null;
	        if(start.equals(today) && last.equals(today))
	            list = dao.listOrder(ceoId,today);
	        else
	        	list = dao.listOrder(ceoId,start,last);	        
	        
	        
	        req.setAttribute("list", list);	         
	    	forward(req, resp, "/WEB-INF/views/ceomoney/ceomoney.jsp");
	    	
	    } else if (uri.indexOf("orderConfirm.do")!=-1) {	    	
	    	// 주문 리스트
	    	String page=req.getParameter("page");
	    	String ceoId=info.getCeoId(); // 세션에서 아이디 취득
	    	/*
	    	if (info == null) {	    		
	        	req.setAttribute("mode", "login");
				forward(req, resp, "/WEB-INF/views/ceomember/ceologin.jsp");
				return;
			}*/
	    	
	    	int current_page=1;

	    	if(page!=null)
	    		current_page=Integer.parseInt(page);
	    	
	    	// 전체 데이터 개수
	    	int dataCount;
	    	dataCount=dao.dataCount(ceoId);	

	    	// 전체 페이지 수
	    	int numPerPage=10;
	    	int total_page=util.pageCount(numPerPage, dataCount);

	    	if(current_page>total_page)
	    		current_page=total_page;

	    	// 게시물 가져올 시작과 끝
	    	int start=(current_page-1)*numPerPage+1;
	    	int end=current_page*numPerPage;

	    	// 게시물 목록 가져오기
	    	List<OrderDTO> list=null;
			list=dao.listOrder(start, end, ceoId);			

	    	// 리스트 글번호 만들기
	    	Date endDate = new Date();
	    	long gap;

	    	int listNum, n=0;
	    	Iterator<OrderDTO>it=list.iterator();

	    	while(it.hasNext()) {
	    		OrderDTO dto=it.next();
	    		listNum=dataCount-(start+n-1);
	    		dto.setListNum(listNum);

	    		try {
	    			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    			Date beginDate = formatter.parse(dto.getCreated());

	    			gap=(endDate.getTime() - beginDate.getTime()) / (60*60* 1000);
	    			dto.setGap(gap);
	    		} catch(Exception e) {

	    		}	            
	    		dto.setCreated(dto.getCreated().substring(0, 10));
	    		n++;
	    	}

	    	String params="";	    	

	    	// 페이징 처리
	    	String listUrl=cp+"/ceomoney/orderConfirm.do";
	    	String articleUrl=cp+"/ceomoney/orderDetail.do?page="+current_page;
	    	if(params.length()!=0) {
	    		listUrl+="?"+params;
	    		articleUrl+="&"+params;
	    	}

	    	String paging=util.paging(current_page, total_page, listUrl);

	    	// 포워딩할 JSP로 넘길 속성
	    	req.setAttribute("list", list);
	    	req.setAttribute("page", current_page);
	    	req.setAttribute("total_page", total_page);
	    	req.setAttribute("dataCount", dataCount);
	    	req.setAttribute("paging", paging);
	    	req.setAttribute("articleUrl", articleUrl);			

	    	forward(req, resp, "/WEB-INF/views/ceomoney/orderConfirm.jsp");
	    	
	    }else if(uri.indexOf("orderDetail.do")!=-1) {
	    	
	    	//주문 상세 페이지		
			int ordernum=Integer.parseInt(req.getParameter("ordernum"));
			String page=req.getParameter("page");
			
				
			//게시물 가져오기
			OrderDTO dto=dao.readOrder(ordernum);
			if(dto==null) { //게시물 없으면 다시 목록으로
				resp.sendRedirect(cp+"/ceomoney/orderConfirm.do?page="+page);
				return;
			}

			if(dto.getPayment().equals("card")){
				dto.setPayment("카드");
			} else if(dto.getPayment().equals("cash")) {
				dto.setPayment("현금");
			}			
			
			//JSP로 전달할 속성
			req.setAttribute("dto", dto);
			req.setAttribute("page", page);
			
	    	forward(req, resp, "/WEB-INF/views/ceomoney/orderDetail.jsp");
	    }
		
	}
	
}
