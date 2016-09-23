package com.ceomember;


import java.io.File;
import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
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
	    	String root=session.getServletContext().getRealPath("/");
	    	// C:\web\work\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\baedalsemiproject
	    	
	    	String pathname=root+File.separator+"uploads"+File.separator+"store";
	    	File f=new File(pathname);
	    	if(! f.exists()){ // 폴더가 존재하지 않으면
	    		f.mkdirs(); // 모든폴더를 만든다.
	    	}	    	
	    	String encType="UTF-8";
	    	int maxFilesize=5*1024*1024;
	    	
	    	MultipartRequest mreq=null;
	    	mreq=new MultipartRequest(req,pathname,maxFilesize,encType,new DefaultFileRenamePolicy());
	    	
	    	String ceoId = mreq.getParameter("ceoId");
	    	String askPwd = mreq.getParameter("askPwd");
	    	String ansPwd = mreq.getParameter("ansPwd");
	    	
	    	String ceoName=mreq.getParameter("ceoName");
	    	String ceoTel2=mreq.getParameter("ceoTel2");
	    	String ceoTel3=mreq.getParameter("ceoTel3");
	    	
	    	String ceoEmail1=mreq.getParameter("ceoEmail1");
	    	String storeName=mreq.getParameter("storeName");
	    	String ceoCodeNum=mreq.getParameter("ceoCodeNum");
	    	String storeAddr=mreq.getParameter("storeAddr");
	    	String storeTel=mreq.getParameter("storeTel");
	    	
	    	
	    	
	    	CeoMemberDTO dto = dao.readMemberid(ceoId); 
	    	StringBuffer sb=new StringBuffer();
	    	
		    if(dto==null)
		    	sb.append("중복된 아이디가 없습니다.");
		    else
		    	sb.append("중복된 아이디가 있습니다.");
	    	
	    	req.setAttribute("mode", "created");
	    	req.setAttribute("title", "회원가입");
	    	
	    	req.setAttribute("ceoId",ceoId);
	    	req.setAttribute("askPwd",askPwd);
	    	req.setAttribute("ansPwd",ansPwd);
	    	req.setAttribute("ceoName",ceoName);
	    	req.setAttribute("ceoTel2",ceoTel2);
	    	req.setAttribute("ceoTel3",ceoTel3);
	    	req.setAttribute("ceoEmail1",ceoEmail1);
	    	req.setAttribute("storeName",storeName);
	    	req.setAttribute("ceoCodeNum",ceoCodeNum);
	    	req.setAttribute("storeAddr",storeAddr);
	    	req.setAttribute("storeTel",storeTel);
	    	
	    	
	    	req.setAttribute("message2", sb.toString());
	    	
	    	forward(req, resp, "/WEB-INF/views/ceomember/ceojoin.jsp");
	    	
	    }else if(uri.indexOf("join_numchk.do")!=-1){
	    	//사업자번호 중복 확인
	    	String root=session.getServletContext().getRealPath("/");
	    	// C:\web\work\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\baedalsemiproject    	
	    	
	    	String pathname=root+File.separator+"uploads"+File.separator+"store";
	    	File f=new File(pathname);
	    	if(! f.exists()){ // 폴더가 존재하지 않으면
	    		f.mkdirs(); // 모든폴더를 만든다.
	    	}	    	
	    	String encType="UTF-8";
	    	int maxFilesize=5*1024*1024;
	    	
	    	MultipartRequest mreq=null;
	    	mreq=new MultipartRequest(req,pathname,maxFilesize,encType,new DefaultFileRenamePolicy());
	    	
	    	
	    	String ceoId = mreq.getParameter("ceoId");
	    	String askPwd = mreq.getParameter("askPwd");
	    	String ansPwd = mreq.getParameter("ansPwd");
	    	
	    	String ceoName=mreq.getParameter("ceoName");
	    	String ceoTel2=mreq.getParameter("ceoTel2");
	    	String ceoTel3=mreq.getParameter("ceoTel3");
	    	
	    	String ceoEmail1=mreq.getParameter("ceoEmail1");
	    	String storeName=mreq.getParameter("storeName");
	    	String ceoCodeNum=mreq.getParameter("ceoCodeNum");
	    	String storeAddr=mreq.getParameter("storeAddr");
	    	String storeTel=mreq.getParameter("storeTel");
	    	
	    	CeoMemberDTO dto = dao.readMembernum(ceoCodeNum); 
	    	StringBuffer sb=new StringBuffer();
	    	
	    	if(dto==null)
			   	sb.append("중복된 사업자번호가 없습니다.");
			else
			  	sb.append("중복된 사업자번호가 있습니다.");
	    		    	
	    	req.setAttribute("mode", "created");
	    	req.setAttribute("title", "회원가입");
	    	
	    	req.setAttribute("ceoId",ceoId);
	    	req.setAttribute("askPwd",askPwd);
	    	req.setAttribute("ansPwd",ansPwd);
	    	req.setAttribute("ceoName",ceoName);
	    	req.setAttribute("ceoTel2",ceoTel2);
	    	req.setAttribute("ceoTel3",ceoTel3);
	    	req.setAttribute("ceoEmail1",ceoEmail1);
	    	req.setAttribute("storeName",storeName);
	    	req.setAttribute("ceoCodeNum",ceoCodeNum);
	    	req.setAttribute("storeAddr",storeAddr);
	    	req.setAttribute("storeTel",storeTel);
	    	
	    	req.setAttribute("message1", sb.toString());
	    	
	    	
	    	forward(req, resp, "/WEB-INF/views/ceomember/ceojoin.jsp");
	    	
	    }else if(uri.indexOf("join_ok.do")!=-1){

	    	String root=session.getServletContext().getRealPath("/");
	    	// C:\web\work\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\baedalsemiproject
	    	
	    	String pathname=root+File.separator+"uploads"+File.separator+"store";
	    	File f=new File(pathname);
	    	if(! f.exists()){ // 폴더가 존재하지 않으면
	    		f.mkdirs(); // 모든폴더를 만든다.
	    	}	    	
	    	String encType="UTF-8";
	    	int maxFilesize=5*1024*1024;
	    	
	    	MultipartRequest mreq=null;
	    	mreq=new MultipartRequest(req,pathname,maxFilesize,encType,new DefaultFileRenamePolicy());
	    	
	    	
	    	CeoMemberDTO dto=new CeoMemberDTO();    	
	    	
	    	dto.setCeoId(mreq.getParameter("ceoId"));
	    	dto.setCeoPwd(mreq.getParameter("ceoPwd"));
	    	dto.setAskPwd(mreq.getParameter("askPwd"));
	    	dto.setAnsPwd(mreq.getParameter("ansPwd"));
	    	dto.setCeoName(mreq.getParameter("ceoName"));
	    	
	    	dto.setCeoTel1(mreq.getParameter("ceoTel1"));
	    	dto.setCeoTel2(mreq.getParameter("ceoTel2"));
	    	dto.setCeoTel3(mreq.getParameter("ceoTel3"));
	    	
	    	dto.setCeoBirth1(mreq.getParameter("ceoBirth1"));
	    	dto.setCeoBirth2(mreq.getParameter("ceoBirth2"));
	    	dto.setCeoBirth3(mreq.getParameter("ceoBirth3"));
	    	
	    	dto.setCeoEmail1(mreq.getParameter("ceoEmail1"));
	    	dto.setCeoEmail2(mreq.getParameter("ceoEmail2"));
	    	
	    	dto.setStoreName(mreq.getParameter("storeName"));
	    	dto.setCeoCodeNum(mreq.getParameter("ceoCodeNum"));
	    	
	    	dto.setRegion(mreq.getParameter("region"));
	    	dto.setStoreAddr(mreq.getParameter("storeAddr"));
	    	
	    	dto.setStoreTel(mreq.getParameter("storeTel"));
	    	dto.setStoreType(mreq.getParameter("storeType"));
	    	dto.setStorePhoto(mreq.getFilesystemName("storePhoto"));	    	
	    	
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
	    	req.setAttribute("mode", "login");
			forward(req, resp, "/WEB-INF/views/ceomember/ceologin.jsp");
		}else if(uri.indexOf("login_ok.do")!=-1){
			String ceoId = req.getParameter("ceoId");
	        String ceoPwd = req.getParameter("ceoPwd");
	        
	        CeoMemberDTO dto = dao.readMemberid(ceoId); 
	        
	        if(dto!=null && dto.getCeoPwd().equals(ceoPwd)&& dto.getEnabled()==1){
	        	 //로그인 성공
	        	
	        	SessionInfo info = new SessionInfo();
	        	info.setCeoId(dto.getCeoId());
	        	info.setCeoName(dto.getCeoName());
	        	
	        	session.setAttribute("ceomember", info);
	        		        	
	        	resp.sendRedirect(cp+"/ceomain/ceomain.do"); 
	        	 
	        	return;
	        }
	        req.setAttribute("mode", "login");
	        req.setAttribute("message", "아이디 또는 패스워드가 일치하지 않습니다.");	          
	        
			forward(req, resp, "/WEB-INF/views/ceomember/ceologin.jsp");
		}else if(uri.indexOf("logout.do")!=-1){
	          //로그아웃
	          session.removeAttribute("ceomember");
	          session.invalidate();
	          resp.sendRedirect(cp+"/ceomain/ceomain.do");
	          
	     }else if(uri.indexOf("findid.do")!=-1){
	          //ID찾기(이름,연락처)
	    	 
	    	 req.setAttribute("mode", "findid");	          
	    	 forward(req, resp, "/WEB-INF/views/ceomember/ceologin.jsp");
	    	 
	    }else if(uri.indexOf("findid_ok.do")!=-1){
	          //ID확인(맞으면 ID출력후 메인화면,틀리면 메세지 표시후 다시 ID찾기화면)
	    	String ceoName = req.getParameter("ceoName");
	        String ceoTel = req.getParameter("ceoTel");
	        
	        CeoMemberDTO dto = dao.findMemberid(ceoName,ceoTel); 
	        	        
	        
	        if(dto!=null && dto.getEnabled()==1){
	        	 //찾기 성공
	        	String ceoId=dto.getCeoId();
	        	
	        	req.setAttribute("title", "ID찾기 성공");
				req.setAttribute("message", ceoName+"님의 ID는"+ceoId+"입니다.");	        	
				
				forward(req,resp,"/WEB-INF/views/ceomember/ceocomplete.jsp");
				return;
	        }
	        
	        req.setAttribute("mode", "findid");
	        req.setAttribute("message", "이름 또는 연락처를 잘못 기재했거나 가입돼지 않은 ID 입니다.");	          
			
			forward(req, resp, "/WEB-INF/views/ceomember/ceologin.jsp");	    	
	    	
	      
	    }else if(uri.indexOf("findpwd1.do")!=-1){
	          //password찾기 1단계(ID,이름)
	    	 req.setAttribute("mode", "findpwd1");	          
	    	forward(req, resp, "/WEB-INF/views/ceomember/ceologin.jsp");  
	    	
	    }else if(uri.indexOf("findpwd1_ok.do")!=-1){
	          //password찾기 1단계(맞으면 2단계진행,틀리면 1단계 화면)
	    	String ceoId = req.getParameter("ceoId");
	        String ceoName = req.getParameter("ceoName");
	        
	        CeoMemberDTO dto = dao.findMemberpwd1(ceoId,ceoName); 
	        	        
	        
	        if(dto!=null && dto.getEnabled()==1){
	        	//찾기 성공	        	
	        	req.setAttribute("askPwd", dto.getAskPwd());
	        	req.setAttribute("mode", "findpwd2");	        	
	        	forward(req, resp, "/WEB-INF/views/ceomember/ceologin.jsp"); 	        	 
	        	return;
	        }	    	
	         
	    	req.setAttribute("mode", "findpwd1");
	    	forward(req, resp, "/WEB-INF/views/ceomember/ceologin.jsp");  
	    }else if(uri.indexOf("findpwd2_ok.do")!=-1){
	    	
	        String ansPwd = req.getParameter("ansPwd");
	        
	        CeoMemberDTO dto = dao.findMemberpwd2(ansPwd); 
	        	        
	        
	        if(dto.getAnsPwd().equals(ansPwd)){
	        	 //찾기 성공
	        	String ceoName=dto.getCeoName();
	        	String ceoPwd=dto.getCeoPwd();
	        	
	        	req.setAttribute("title", "패스워드찾기 성공");
				req.setAttribute("message", ceoName+"님의 패스워드는"+ceoPwd+"입니다.");
	        	
				forward(req,resp,"/WEB-INF/views/ceomember/ceocomplete.jsp"); 	        	 
				return;
	        }
	        
	        req.setAttribute("mode", "findpwd2");
	        req.setAttribute("message", "올바른 대답이 아닙니다.");	          
			
			forward(req, resp, "/WEB-INF/views/ceomember/ceologin.jsp");	     
	    	
	    }
	    
	}

}
