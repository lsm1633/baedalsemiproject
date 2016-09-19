package com.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.MyServlet;

@WebServlet("/member/*")
public class MemberServlet extends MyServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		String uri=req.getRequestURI();
	    String cp=req.getContextPath();
	    MemberDAO dao = new MemberDAO();
	    
	    HttpSession session = req.getSession();
	    
	    if(uri.indexOf("join.do")!=-1){
	    	//ȸ������ ��
	    	
	    	req.setAttribute("mode", "created");
	    	req.setAttribute("title", "ȸ������");
	    	
	    	forward(req, resp, "/WEB-INF/views/member/join.jsp");
	    }
	    else if(uri.indexOf("join_ok.do")!=-1){
	    	//ȸ�� ����
	    	
	    	MemberDTO dto = new MemberDTO();
	    	dto.setUserId(req.getParameter("userId"));
	    	dto.setUserName(req.getParameter("userName"));
	        dto.setUserPwd(req.getParameter("userPwd"));
	        
	        dto.setEmail(req.getParameter("email"));
	        dto.setTel(req.getParameter("tel"));
	        dto.setAddr1(req.getParameter("addr1"));
	        dto.setAddr2(req.getParameter("addr2"));
	        
	        int result = dao.insertMember(dto);
	        if(result != 1){
	        	String message = "ȸ�����Կ� �����ϼ̽��ϴ�.";
	        	req.setAttribute("title", "ȸ������");
	        	req.setAttribute("mode", "created");
	        	req.setAttribute("message", message);
	        	forward(req, resp, "/WEB-INF/views/member/join.jsp");
	        	return;
	        	
	        }
	        
	        StringBuffer sb = new StringBuffer();
	        sb.append("<b>"+dto.getUserName()+"</b>�� ȸ�������� �Ϸ�Ǿ����ϴ�.<br>");
	        sb.append("����ȭ������ �̵��Ͽ� �α����Ͻñ� �ٶ��ϴ�.<br>");
	         
	        req.setAttribute("title", "ȸ�� ����");
	        req.setAttribute("message", sb.toString());
	         
	        forward(req, resp, "/WEB-INF/views/member/complete.jsp");
	        
	        
	    }
	    else if(uri.indexOf("chkId_ok.do")!=-1){
	    	//���̵��ߺ�üũ
	    	String userId = req.getParameter("userId");
	    	
	    	int chk = dao.idChk(userId);
	    	if(chk == 1)
	    		req.setAttribute("msg","�ش���̵�� ����Ͻ� �� �����ϴ�. �ٸ����̵� �Է����ּ���");
	    	else
	    		req.setAttribute("msg","�ش���̵�� ��밡���մϴ�.");
	    	
	    	req.setAttribute("title", "ȸ������");
        	req.setAttribute("mode", "created");
	    	forward(req, resp, "/WEB-INF/views/member/join.jsp");
	    	
	    }
	    else if(uri.indexOf("login.do")!=-1) {
	          forward(req, resp, "/WEB-INF/views/member/login.jsp");
	      }
	    else if(uri.indexOf("login_ok.do")!=-1){
	    	String userId = req.getParameter("userId");
	        String userPwd = req.getParameter("userPwd");
	        
	        MemberDTO dto = dao.readMember(userId);
	        
	        if(dto!=null && dto.getUserPwd().equals(userPwd) && dto.getEnabled()==1){
	        	 //�α��� ����
	        	
	        	SessionInfo info = new SessionInfo();
	        	info.setUserId(dto.getUserId());
	        	info.setUserName(dto.getUserName());
	        	
	        	session.setAttribute("member", info);
	        	
	        	resp.sendRedirect(cp+"/"); //����������
	        	 
	        	return;
	        }
	        req.setAttribute("message", "���̵� �Ǵ� �н����尡 ��ġ���� �ʽ��ϴ�.");
	         
	        forward(req, resp, "/WEB-INF/views/member/login.jsp");
	    }
	    else if(uri.indexOf("logout.do")!=-1){
	          //�α׾ƿ�
	          session.removeAttribute("member");
	          session.invalidate();
	          resp.sendRedirect(cp+"/");
	          
	     }
	    
	}

}
