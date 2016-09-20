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
	    	//회원가입 폼
	    	
	    	req.setAttribute("mode", "created");
	    	req.setAttribute("title", "회원가입");
	    	
	    	forward(req, resp, "/WEB-INF/views/ceomember/ceojoin.jsp");
	    }else if(uri.indexOf("join_idchk.do")!=-1){
	    	//id중복 확인
	    	String ceoId = req.getParameter("ceoId");
	    	
	    	CeoMemberDTO dto = dao.readMemberid(ceoId); 
	    	StringBuffer sb=new StringBuffer();
	    	
		    if(dto==null)
		    	sb.append("중복된 아이디가 없습니다.");
		    else
		    	sb.append("중복된 아이디가 있습니다.");
	    	
	    	req.setAttribute("mode", "created");
	    	req.setAttribute("title", "회원가입");
	    	req.setAttribute("message2", sb.toString());
	    	
	    	forward(req, resp, "/WEB-INF/views/ceomember/ceojoin.jsp");
	    	
	    }else if(uri.indexOf("join_numchk.do")!=-1){
	    	//사업자번호 중복 확인
	    	String ceoCodeNum = req.getParameter("ceoCodeNum");
	    	
	    	CeoMemberDTO dto = dao.readMembernum(ceoCodeNum); 
	    	StringBuffer sb=new StringBuffer();
	    	
	    	if(dto==null)
			   	sb.append("중복된 사업자번호가 없습니다.");
			else
			  	sb.append("중복된 사업자번호가 있습니다.");
	    		    	
	    	req.setAttribute("mode", "created");
	    	req.setAttribute("title", "회원가입");
	    	req.setAttribute("message1", sb.toString());
	    	
	    	forward(req, resp, "/WEB-INF/views/ceomember/ceojoin.jsp");
	    	
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
				String message="회원 가입이 실패 했습니다.";
				
				req.setAttribute("title", "회원 가입");
				req.setAttribute("mode", "created");
				req.setAttribute("message", message);
				forward(req,resp,"/WEB-INF/views/ceomember/join.jsp");
				return;
			}
			StringBuffer sb=new StringBuffer();
			sb.append("<b>"+dto.getCeoName()+"</b>님 회원가입이 되었습니다.<br>");
			sb.append("메인화면으로 이동하여 로그인 하시기 바랍니다<br>");
			
			req.setAttribute("title", "회원 가입");
			req.setAttribute("message", sb.toString());
			
			forward(req,resp,"/WEB-INF/views/ceomember/ceocomplete.jsp");
	    }else if(uri.indexOf("login.do")!=-1){					
			forward(req, resp, "/WEB-INF/views/ceomember/ceologin.jsp");
		}else if(uri.indexOf("login_ok.do")!=-1){
			String ceoId = req.getParameter("ceoId");
	        String ceoPwd = req.getParameter("ceoPwd");
	        
	        CeoMemberDTO dto = dao.readMemberid(ceoId); 
	        
	        if(dto!=null && dto.getCeoPwd().equals(ceoPwd)){
	        	 //로그인 성공
	        	
	        	SessionInfo info = new SessionInfo();
	        	info.setCeoId(dto.getCeoId());
	        	info.setCeoName(dto.getCeoName());
	        	
	        	session.setAttribute("ceomember", info);
	        		        	
	        	resp.sendRedirect(cp+"/ceomain/ceomain.do"); 
	        	 
	        	return;
	        }
	        req.setAttribute("message", "아이디 또는 패스워드가 일치하지 않습니다.");	          
			
			forward(req, resp, "/WEB-INF/views/ceomember/ceologin.jsp");
		}else if(uri.indexOf("logout.do")!=-1){
	          //로그아웃
	          session.removeAttribute("ceomember");
	          session.invalidate();
	          resp.sendRedirect(cp+"/ceomain/ceomain.do");
	          
	     }
	    
	}

}
