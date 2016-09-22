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
	    	//회원가입 폼
	    	
	    	req.setAttribute("mode", "created");
	    	req.setAttribute("title", "회원가입");
	    	
	    	forward(req, resp, "/WEB-INF/views/member/join.jsp");
	    }
	    else if(uri.indexOf("join_ok.do")!=-1){
	    	//회원 저장
	    	
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
	        	String message = "회원가입에 실패하셨습니다.";
	        	req.setAttribute("title", "회원가입");
	        	req.setAttribute("mode", "created");
	        	req.setAttribute("message", message);
	        	forward(req, resp, "/WEB-INF/views/member/join.jsp");
	        	return;
	        	
	        }
	        
	        StringBuffer sb = new StringBuffer();
	        sb.append("<b>"+dto.getUserName()+"</b>님 회원가입이 완료되었습니다.<br>");
	        sb.append("메인화면으로 이동하여 로그인하시기 바랍니다.<br>");
	         
	        req.setAttribute("title", "회원 가입");
	        req.setAttribute("message", sb.toString());
	         
	        forward(req, resp, "/WEB-INF/views/member/complete.jsp");
	        
	        
	    }
	    else if(uri.indexOf("chkId_ok.do")!=-1){
	    	//아이디중복체크
	    	String userId = req.getParameter("userId");
	    	
	    	int chk = dao.idChk(userId);
	    	if(chk == 1)
	    		req.setAttribute("msg","해당아이디는 사용하실 수 없습니다. 다른아이디를 입력해주세요");
	    	else
	    		req.setAttribute("msg","해당아이디는 사용가능합니다.");
	    	
	    	req.setAttribute("title", "회원가입");
        	req.setAttribute("mode", "created");
	    	forward(req, resp, "/WEB-INF/views/member/join.jsp");
	    	
	    }
	    else if(uri.indexOf("searchId.do")!=-1){
	    	//id 찾기
	    	req.setAttribute("title", "ID 찾기");
	    	req.setAttribute("mode", "id");
	    	forward(req, resp, "/WEB-INF/views/member/search.jsp");
	    }
	    else if(uri.indexOf("searchId_ok.do")!=-1){
	    	//id찾기 폼
	    	
	    	String userName = req.getParameter("userName");
	    	String tel = req.getParameter("tel");
	    	
	    	MemberDTO dto = dao.readNameMember(userName);  
	    	
	    	int chk = dao.searchId(userName);


	    	if(chk == 1 && dto.getEnabled()!=0 &&dto.getTel().equals(tel))
	    		
	    		req.setAttribute("message","회원님의 id는 "+dto.getUserId()+" 입니다.");
		   
	    	else if(chk == 1 && dto.getEnabled()==0)
	    			req.setAttribute("message","탈퇴한 계정입니다.");
	    			
	    	else if(chk == 0)
	    		req.setAttribute("message","존재하지 않는 계정입니다.");	
	    		
	    	else
	    		req.setAttribute("message","입력하신 정보가 일치하지 않습니다.");
	    	
	    	req.setAttribute("title", "ID 찾기");
	    	req.setAttribute("mode", "id");
	    	
	    	forward(req, resp, "/WEB-INF/views/member/search.jsp");
	    	
	    }
	    
	    else if(uri.indexOf("searchPwd.do")!=-1){
	    	req.setAttribute("title", "PWD 찾기");
	    	req.setAttribute("mode", "pwd");
	    	
	    	forward(req, resp, "/WEB-INF/views/member/search.jsp");
	    }
	    else if(uri.indexOf("searchPwd_ok.do")!=-1){
	    	//패스워드 찾기
	    	String userId = req.getParameter("userId");
	    	String userName = req.getParameter("userName");
	    	String tel = req.getParameter("tel");
	    	String email = req.getParameter("email");
	    	
	    	MemberDTO dto = dao.readMember(userId);  
	    	
	    	int chk = dao.searchId(userName);

	    	if(chk == 1 && dto.getEnabled()!=0 &&dto.getTel().equals(tel)&& dto.getEmail().equals(email)){
	    		//일치했을경우 비밀번호 변경
	    		
	    		req.setAttribute("userId",dto.getUserId());
	    		forward(req, resp, "/WEB-INF/views/member/updatePwd.jsp");
	    		return;
	    	}
	    		
	    	else if(chk == 1 && dto.getEnabled()==0)
	    			req.setAttribute("message","탈퇴한 계정입니다.");
	    			
	    	else if(chk == 0)
	    		req.setAttribute("message","존재하지 않는 계정입니다.");	
	    		
	    	else
	    		req.setAttribute("message","입력하신 정보가 일치하지 않습니다.");
	    	
	    	req.setAttribute("title", "PWD 찾기");
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
	        sb.append("비밀번호 수정이 완료되었습니다.<br>");
	        sb.append("메인화면으로 이동합니다.<br>");
	        
	        req.setAttribute("title", "비밀번호 변경");
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
	        	 //로그인 성공
	        	SessionInfo info = new SessionInfo();
	        	info = new SessionInfo();
	        	info.setUserId(dto.getUserId());
	        	info.setUserName(dto.getUserName());
	        	
	        	session.setAttribute("member", info);
	        	
	        	resp.sendRedirect(cp+"/"); //메인페이지
	        	 
	        	return;
	        }
	        req.setAttribute("message", "아이디 또는 패스워드가 일치하지 않습니다.");
	         
	        forward(req, resp, "/WEB-INF/views/member/login.jsp");
	    }
	    else if(uri.indexOf("logout.do")!=-1){
	          //로그아웃
	          session.removeAttribute("member");
	          session.invalidate();
	          resp.sendRedirect(cp+"/");
	          
	     }
	    else if(uri.indexOf("pwdChk.do")!=-1){
	    	//정보수정 비밀번호확인
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
	        	 //패스워드일치 -> 회원정보수정
	        	
	        	req.setAttribute("dto", dto);
	        	req.setAttribute("mode", "update");
		    	req.setAttribute("title", "회원정보 수정");
		    	
		    	forward(req, resp, "/WEB-INF/views/member/join.jsp");
	        	 
	        	return;
	        }
	        req.setAttribute("message", "패스워드가 일치하지 않습니다.");

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
	        	String message = "정보수정에 실패하셨습니다.";
	        	req.setAttribute("title", "회원정보수정");
	        	req.setAttribute("mode", "update");
	        	req.setAttribute("message", message);
	        	forward(req, resp, "/WEB-INF/views/member/join.jsp");
	        	return;
	        }
	        
	        StringBuffer sb = new StringBuffer();
	        sb.append("<b>"+dto.getUserName()+"</b>님 회원정보수이 완료되었습니다.<br>");
	        sb.append("메인화면으로 이동합니다.<br>");
	         
	        req.setAttribute("title", "정보 수정");
	        req.setAttribute("message", sb.toString());
	         
	        forward(req, resp, "/WEB-INF/views/member/complete.jsp");
	    }
	    else if(uri.indexOf("leave.do")!=-1){
	    	SessionInfo info = (SessionInfo)session.getAttribute("member");
	    	if(info == null){
	    		forward(req, resp, "/WEB-INF/views/member/login.jsp");
	    		return;
	    	}
	    	
	    	//탈퇴하기
	    	forward(req, resp, "/WEB-INF/views/member/leave.jsp");
	    	
	    }
	    else if(uri.indexOf("leave_ok.do")!=-1){
	    	//탈퇴 실행
	    	
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
