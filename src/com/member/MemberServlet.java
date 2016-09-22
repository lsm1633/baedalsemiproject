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
	    else if(uri.indexOf("searchId.do")!=-1){
	    	//id ã��
	    	req.setAttribute("title", "ID ã��");
	    	req.setAttribute("mode", "id");
	    	forward(req, resp, "/WEB-INF/views/member/search.jsp");
	    }
	    else if(uri.indexOf("searchId_ok.do")!=-1){
	    	//idã�� ��
	    	
	    	String userName = req.getParameter("userName");
	    	String tel = req.getParameter("tel");
	    	
	    	MemberDTO dto = dao.readNameMember(userName);  
	    	
	    	int chk = dao.searchId(userName);


	    	if(chk == 1 && dto.getEnabled()!=0 &&dto.getTel().equals(tel))
	    		
	    		req.setAttribute("message","ȸ������ id�� "+dto.getUserId()+" �Դϴ�.");
		   
	    	else if(chk == 1 && dto.getEnabled()==0)
	    			req.setAttribute("message","Ż���� �����Դϴ�.");
	    			
	    	else if(chk == 0)
	    		req.setAttribute("message","�������� �ʴ� �����Դϴ�.");	
	    		
	    	else
	    		req.setAttribute("message","�Է��Ͻ� ������ ��ġ���� �ʽ��ϴ�.");
	    	
	    	req.setAttribute("title", "ID ã��");
	    	req.setAttribute("mode", "id");
	    	
	    	forward(req, resp, "/WEB-INF/views/member/search.jsp");
	    	
	    }
	    
	    else if(uri.indexOf("searchPwd.do")!=-1){
	    	req.setAttribute("title", "PWD ã��");
	    	req.setAttribute("mode", "pwd");
	    	
	    	forward(req, resp, "/WEB-INF/views/member/search.jsp");
	    }
	    else if(uri.indexOf("searchPwd_ok.do")!=-1){
	    	//�н����� ã��
	    	String userId = req.getParameter("userId");
	    	String userName = req.getParameter("userName");
	    	String tel = req.getParameter("tel");
	    	String email = req.getParameter("email");
	    	
	    	MemberDTO dto = dao.readMember(userId);  
	    	
	    	int chk = dao.searchId(userName);

	    	if(chk == 1 && dto.getEnabled()!=0 &&dto.getTel().equals(tel)&& dto.getEmail().equals(email)){
	    		//��ġ������� ��й�ȣ ����
	    		
	    		req.setAttribute("userId",dto.getUserId());
	    		forward(req, resp, "/WEB-INF/views/member/updatePwd.jsp");
	    		return;
	    	}
	    		
	    	else if(chk == 1 && dto.getEnabled()==0)
	    			req.setAttribute("message","Ż���� �����Դϴ�.");
	    			
	    	else if(chk == 0)
	    		req.setAttribute("message","�������� �ʴ� �����Դϴ�.");	
	    		
	    	else
	    		req.setAttribute("message","�Է��Ͻ� ������ ��ġ���� �ʽ��ϴ�.");
	    	
	    	req.setAttribute("title", "PWD ã��");
	    	req.setAttribute("mode", "pwd");
	    	
	    	forward(req, resp, "/WEB-INF/views/member/search.jsp");
	    }
	    else if(uri.indexOf("updatePwd_ok.do")!=-1){
	    	String userId = req.getParameter("userId");
	    	
	    	MemberDTO dto = dao.readMember(userId);

	        dto.setUserPwd(req.getParameter("userPwd1"));
	        
	        int result = dao.updatePwd(dto);
	        if(result != 1){
	        	
	        	req.setAttribute("userId", userId);
	        	forward(req, resp, "/WEB-INF/views/member/updatePwd.jsp");
	        	return;
	        }
	        
	        StringBuffer sb = new StringBuffer();
	        sb.append("��й�ȣ ������ �Ϸ�Ǿ����ϴ�.<br>");
	        sb.append("����ȭ������ �̵��մϴ�.<br>");
	        
	        req.setAttribute("title", "��й�ȣ ����");
	        req.setAttribute("message", sb.toString());
	        
	        forward(req, resp, "/WEB-INF/views/member/complete.jsp");
	    			
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
	        	info = new SessionInfo();
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
	    else if(uri.indexOf("pwdChk.do")!=-1){
	    	//�������� ��й�ȣȮ��
	    	SessionInfo info = (SessionInfo)session.getAttribute("member");
	    	if(info == null){
	    		forward(req, resp, "/WEB-INF/views/member/login.jsp");
	    		return;
	    	}
	    	
	    	forward(req, resp, "/WEB-INF/views/member/pwdChk.jsp");
	    }
	    else if(uri.indexOf("update.do")!=-1){
	    	
	    	SessionInfo info = (SessionInfo)session.getAttribute("member");
	    	if(info == null){
	    		forward(req, resp, "/WEB-INF/views/member/login.jsp");
	    		return;
	    	}
	    	
	    	String userId = info.getUserId();
	        String userPwd = req.getParameter("userPwd");
	        
	        MemberDTO dto = dao.readMember(userId);
	        
	        if(dto!=null && dto.getUserPwd().equals(userPwd) && dto.getEnabled()==1){
	        	 //�н�������ġ -> ȸ����������
	        	
	        	req.setAttribute("dto", dto);
	        	req.setAttribute("mode", "update");
		    	req.setAttribute("title", "ȸ������ ����");
		    	
		    	forward(req, resp, "/WEB-INF/views/member/join.jsp");
	        	 
	        	return;
	        }
	        req.setAttribute("message", "�н����尡 ��ġ���� �ʽ��ϴ�.");

	        forward(req, resp, "/WEB-INF/views/member/pwdChk.jsp");
	    	
	    }
	    else if(uri.indexOf("update_ok.do")!=-1){
	    	SessionInfo info = (SessionInfo)session.getAttribute("member");
	    	if(info == null){
	    		forward(req, resp, "/WEB-INF/views/member/login.jsp");
	    		return;
	    	}
	    	
	    	String userId = info.getUserId();
	    	MemberDTO dto = dao.readMember(userId);
	    	
	    	dto.setUserName(req.getParameter("userName"));
	        dto.setUserPwd(req.getParameter("userPwd"));
	        
	        dto.setEmail(req.getParameter("email"));
	        dto.setTel(req.getParameter("tel"));
	        dto.setAddr1(req.getParameter("addr1"));
	        dto.setAddr2(req.getParameter("addr2"));
	        
	        int result = dao.updateMember(dto);
	        if(result != 1){
	        	String message = "���������� �����ϼ̽��ϴ�.";
	        	req.setAttribute("title", "ȸ����������");
	        	req.setAttribute("mode", "update");
	        	req.setAttribute("message", message);
	        	forward(req, resp, "/WEB-INF/views/member/join.jsp");
	        	return;
	        }
	        
	        StringBuffer sb = new StringBuffer();
	        sb.append("<b>"+dto.getUserName()+"</b>�� ȸ���������� �Ϸ�Ǿ����ϴ�.<br>");
	        sb.append("����ȭ������ �̵��մϴ�.<br>");
	         
	        req.setAttribute("title", "���� ����");
	        req.setAttribute("message", sb.toString());
	         
	        forward(req, resp, "/WEB-INF/views/member/complete.jsp");
	    }
	    else if(uri.indexOf("leave.do")!=-1){
	    	SessionInfo info = (SessionInfo)session.getAttribute("member");
	    	if(info == null){
	    		forward(req, resp, "/WEB-INF/views/member/login.jsp");
	    		return;
	    	}
	    	
	    	//Ż���ϱ�
	    	forward(req, resp, "/WEB-INF/views/member/leave.jsp");
	    	
	    }
	    else if(uri.indexOf("leave_ok.do")!=-1){
	    	//Ż�� ����
	    	
	    	SessionInfo info = (SessionInfo)session.getAttribute("member");
	    	if(info == null){
	    		forward(req, resp, "/WEB-INF/views/member/login.jsp");
	    		return;
	    	}
	    	
	    	String userId = info.getUserId();
	    	dao.deleteMember(userId);
	    	
	    	session.removeAttribute("member");
	        session.invalidate();
	    	resp.sendRedirect(cp+"/");
	    }
	    
	}

}
