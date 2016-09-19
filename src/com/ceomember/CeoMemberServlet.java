package com.ceomember;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.MyServlet;

@WebServlet("/ceomember/*")
public class CeoMemberServlet extends MyServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		String uri=req.getRequestURI();
	    String cp=req.getContextPath();
	    
	    CeoMemberDAO dao=new CeoMemberDAO();
	    HttpSession session = req.getSession();
	    
	    if(uri.indexOf("join.do")!=-1){
	    	//ȸ������ ��
	    	
	    	req.setAttribute("mode", "created");
	    	req.setAttribute("title", "ȸ������");
	    	
	    	forward(req, resp, "/WEB-INF/views/ceomember/join.jsp");
	    }else if(uri.indexOf("join_ok.do")!=-1){
	    	CeoMemberDTO dto=new CeoMemberDTO();
	    	
	    	dto.setCeoId(req.getParameter("ceoId"));
	    	dto.setCeoPwd(req.getParameter("ceoPwd"));
	    	dto.setCeoName(req.getParameter("ceoName"));
	    	
	    	dto.setCeoTel1(req.getParameter("ceoTel1"));
	    	dto.setCeoTel2(req.getParameter("ceoTel2"));
	    	dto.setCeoTel3(req.getParameter("ceoTel3"));
	    	
	    	dto.setCeoBirth1(req.getParameter("ceoBirth1"));
	    	dto.setCeoBirth2(req.getParameter("ceoBirth2"));
	    	dto.setCeoBirth3(req.getParameter("ceoBirth3"));
	    	
	    	dto.setCeoEmail1(req.getParameter("ceoEmail1"));
	    	dto.setCeoEmail2(req.getParameter("ceoEmail2"));
	    	
	    	dto.setStoreName(req.getParameter("storeName"));
	    	dto.setCeoCodeNum(req.getParameter("ceoCodeNum"));
	    	dto.setStoreTel(req.getParameter("storeTel"));
	    	dto.setStoreType(req.getParameter("storeType"));
	    	
	    	int result=dao.insertCeoMember(dto);
	    	if(result!=1){
				String message="ȸ�� ������ ���� �߽��ϴ�.";
				
				req.setAttribute("title", "ȸ�� ����");
				req.setAttribute("mode", "created");
				req.setAttribute("message", message);
				forward(req,resp,"/WEB-INF/views/ceomember/join.jsp");
				return;
			}
			StringBuffer sb=new StringBuffer();
			sb.append("<b>"+dto.getCeoName()+"</b>�� ȸ�������� �Ǿ����ϴ�.<br>");
			sb.append("����ȭ������ �̵��Ͽ� �α��� �Ͻñ� �ٶ��ϴ�<br>");
			
			req.setAttribute("title", "ȸ�� ����");
			req.setAttribute("message", sb.toString());
			
			forward(req,resp,"/WEB-INF/views/ceomember/ceocomplete.jsp");
	    }
	    
	}

}