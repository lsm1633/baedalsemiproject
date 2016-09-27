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
import com.ceomember.SessionInfo;

@WebServlet("/ceomember/*")
public class CeoMemberServlet extends MyServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		String uri=req.getRequestURI();
	    String cp=req.getContextPath();
	    
	    HttpSession session = req.getSession();	    	    
	    CeoMemberDAO dao=new CeoMemberDAO();
	    
	    if(uri.indexOf("join.do")!=-1){
	    	//ȸ������ ��
	    	
	    	req.setAttribute("mode", "created");
	    	req.setAttribute("title", "ȸ������");
	    	
	    	forward(req, resp, "/WEB-INF/views/ceomember/ceojoin.jsp");
	    }else if(uri.indexOf("join_idchk.do")!=-1){
	    	//id�ߺ� Ȯ��
	    	String pathname="c:/"+File.separator+"storePhoto";
	    	File f=new File(pathname);
	    	if(! f.exists()){ // ������ �������� ������
	    		f.mkdirs(); // ��������� �����.
	    	}	    	
	    	String encType="UTF-8";
	    	int maxFilesize=5*1024*1024;
	    	
	    	MultipartRequest mreq=null;
	    	mreq=new MultipartRequest(req,pathname,maxFilesize,encType,new DefaultFileRenamePolicy());
	    	
	    	String ceoId = mreq.getParameter("ceoId");
	    	
	    	CeoMemberDTO dto = dao.readMemberid(ceoId); 
	    	StringBuffer sb=new StringBuffer();
	    	
		    if(dto==null)
		    	sb.append("�ߺ��� ���̵� �����ϴ�.");
		    else
		    	sb.append("�ߺ��� ���̵� �ֽ��ϴ�.");
	    	
	    	req.setAttribute("mode", "created");
	    	req.setAttribute("title", "ȸ������");
	    	req.setAttribute("message2", sb.toString());
	    	
	    	forward(req, resp, "/WEB-INF/views/ceomember/ceojoin.jsp");
	    	
	    }else if(uri.indexOf("join_numchk.do")!=-1){
	    	//����ڹ�ȣ �ߺ� Ȯ��
	    	String pathname="c:/"+File.separator+"storePhoto";
	    	File f=new File(pathname);
	    	if(! f.exists()){ // ������ �������� ������
	    		f.mkdirs(); // ��������� �����.
	    	}	    	
	    	String encType="UTF-8";
	    	int maxFilesize=5*1024*1024;
	    	
	    	MultipartRequest mreq=null;
	    	mreq=new MultipartRequest(req,pathname,maxFilesize,encType,new DefaultFileRenamePolicy());
	    	
	    	
	    	String ceoCodeNum = mreq.getParameter("ceoCodeNum");
	    	
	    	CeoMemberDTO dto = dao.readMembernum(ceoCodeNum); 
	    	StringBuffer sb=new StringBuffer();
	    	
	    	if(dto==null)
			   	sb.append("�ߺ��� ����ڹ�ȣ�� �����ϴ�.");
			else
			  	sb.append("�ߺ��� ����ڹ�ȣ�� �ֽ��ϴ�.");
	    		    	
	    	req.setAttribute("mode", "created");
	    	req.setAttribute("title", "ȸ������");
	    	req.setAttribute("message1", sb.toString());
	    	
	    	forward(req, resp, "/WEB-INF/views/ceomember/ceojoin.jsp");
	    	
	    }else if(uri.indexOf("join_ok.do")!=-1){
	    	
	    	String pathname="c:/"+File.separator+"storePhoto";
	    	File f=new File(pathname);
	    	if(! f.exists()){ // ������ �������� ������
	    		f.mkdirs(); // ��������� �����.
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
	    	
	    	dto.setStoreAddr1(mreq.getParameter("storeAddr1"));
	    	dto.setStoreAddr2(mreq.getParameter("storeAddr2"));
	    	
	    	dto.setStoreTel(mreq.getParameter("storeTel"));
	    	dto.setStoreType(mreq.getParameter("storeType"));
	    	dto.setStorePhoto(mreq.getFilesystemName("storePhoto")); 	
	    	
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
			
	    } else if(uri.indexOf("login.do")!=-1){
	    	req.setAttribute("mode", "login");
			forward(req, resp, "/WEB-INF/views/ceomember/ceologin.jsp");
		} else if(uri.indexOf("login_ok.do")!=-1){
			String ceoId = req.getParameter("ceoId");
	        String ceoPwd = req.getParameter("ceoPwd");
	        
	        CeoMemberDTO dto = dao.readMemberid(ceoId); 
	        
	        if(dto!=null && dto.getCeoPwd().equals(ceoPwd)&& dto.getEnabled()==1){
	        	 //�α��� ����
	        	
	        	SessionInfo info = new SessionInfo();
	        	info.setCeoId(dto.getCeoId());
	        	info.setCeoName(dto.getCeoName());
	        	
	        	session.setAttribute("ceomember", info);
	        		        	
	        	resp.sendRedirect(cp+"/ceomain/ceomain.do"); 
	        	 
	        	return;
	        }
	        req.setAttribute("mode", "login");
	        req.setAttribute("message", "���̵� �Ǵ� �н����尡 ��ġ���� �ʽ��ϴ�.");	          
			forward(req, resp, "/WEB-INF/views/ceomember/ceologin.jsp");
			
		} else if(uri.indexOf("logout.do")!=-1){
	          //�α׾ƿ�
	          session.removeAttribute("ceomember");
	          session.invalidate();
	          resp.sendRedirect(cp+"/ceomain/ceomain.do");
	          
	     } else if(uri.indexOf("ceoinfo.do")!=-1) {
	    	SessionInfo info=(SessionInfo)session.getAttribute("ceomember");
	    	String ceoId=info.getCeoId();
	    	CeoMemberDTO dto=dao.readMemberid(ceoId);
	       		    	
	    	if(dto==null) {
	    		resp.sendRedirect(cp+"/ceomain/ceomain.do");
	    		return;
	    	}	
	    	
	    	req.setAttribute("dto", dto);
	    	req.setAttribute("mode", "ceoinfo");
	    	forward(req, resp, "/WEB-INF/views/ceomember/ceoinfo.jsp");
	    	
	     } else if(uri.indexOf("ceoinfo_update.do")!=-1) {
		    	SessionInfo info=(SessionInfo)session.getAttribute("ceomember");
		    	String ceoId=info.getCeoId();
		    	CeoMemberDTO dto=dao.readMemberid(ceoId);
		       	   	
		    	
		    	req.setAttribute("dto", dto);
		    	req.setAttribute("mode", "ceoinfo_update");
		    	forward(req, resp, "/WEB-INF/views/ceomember/ceoinfo_update.jsp");
		    	
		   } else if(uri.indexOf("ceoinfo_update_ok.do")!=-1) {
			 String ceoId=req.getParameter("ceoId");
		     CeoMemberDTO dto=dao.readMemberid(ceoId);
	    	 	    	 
	    	 dto.setCeoId(req.getParameter("ceoId"));
	    	 dto.setCeoPwd(req.getParameter("ceoPwd"));
	    	 dto.setAskPwd(req.getParameter("askPwd"));
	    	 dto.setAnsPwd(req.getParameter("ansPwd"));
	    	 dto.setCeoName(req.getParameter("ceoName"));

	    	 dto.setCeoTel1(req.getParameter("ceoTel1"));
	    	 dto.setCeoTel2(req.getParameter("ceoTel2"));
	    	 dto.setCeoTel3(req.getParameter("ceoTel3"));

	    	 dto.setCeoBirth1(req.getParameter("ceoBirth1"));
	    	 dto.setCeoBirth2(req.getParameter("ceoBirth2"));
	    	 dto.setCeoBirth3(req.getParameter("ceoBirth3"));

	    	 dto.setCeoEmail1(req.getParameter("ceoEmail1"));
	    	 dto.setCeoEmail2(req.getParameter("ceoEmail2"));    	
	    	 
	    	 dao.updateCeoMember(dto);
	    	 
	    	 resp.sendRedirect(cp+"/ceomember/ceoinfo.do");

	     } else if(uri.indexOf("storeInfo.do")!=-1){
	    	
	    	 SessionInfo info=(SessionInfo)session.getAttribute("ceomember");
	    	 String ceoId=info.getCeoId();
	    	 CeoMemberDTO dto=dao.readMemberid(ceoId);

	    	 if(dto==null) {
	    		 resp.sendRedirect(cp+"/storeMenu/menu.do");
	    		 return;
	    	 }	    	 	    	 
	    	 
	    	 if(dto.getRegion().equals("Seoul")){
	    		 dto.setRegion("����");
	    	 } else if(dto.getRegion().equals("Gyeonggi")) {
	    		 dto.setRegion("���");
	    	 } else if(dto.getRegion().equals("Incheon")) {
	    		 dto.setRegion("��õ");
	    	 }
 	 
	
	    	 if(dto.getStoreType().equals("chinese")){
	    		 dto.setStoreType("�߽�");
	    	 } else if(dto.getStoreType().equals("chicken")) {
	    		 dto.setStoreType("ġŲ");
	    	 } else if(dto.getStoreType().equals("snack")) {
	    		 dto.setStoreType("�н�");
	    	 } else if(dto.getStoreType().equals("pizza")) {
	    		 dto.setStoreType("����");
	    	 }

	    	 req.setAttribute("dto", dto);	    
	    	 req.setAttribute("mode", "storeUpdate");

	     	 forward(req, resp, "/WEB-INF/views/ceomember/storeInfo.jsp");
	  	   	    	 
	     } else if(uri.indexOf("storeUpdate.do")!=-1) {
	    	 SessionInfo info=(SessionInfo)session.getAttribute("ceomember");
	    	 String ceoId=info.getCeoId();
	    	 CeoMemberDTO dto=dao.readMemberid(ceoId);

	    	 if(dto==null) {
	    		 resp.sendRedirect(cp+"/storeMenu/menu.do");
	    		 return;
	    	 }	    	 	    	 
	    	
	    	 req.setAttribute("dto", dto);	    
	    	 req.setAttribute("mode", "storeUpdate");

	     	 forward(req, resp, "/WEB-INF/views/ceomember/storeUpdate.jsp"); 	    	 
	    	 
	     } else if(uri.indexOf("update_numchk.do")!=-1){
	    	//����ڹ�ȣ �ߺ� Ȯ��
		    	String pathname="c:/"+File.separator+"storePhoto";
		    	File f=new File(pathname);
		    	if(! f.exists()){
		    		f.mkdirs();
		    	}	    	
		    	String encType="UTF-8";
		    	int maxFilesize=5*1024*1024;
		    	
		    	MultipartRequest mreq=null;
		    	mreq=new MultipartRequest(req,pathname,maxFilesize,encType,new DefaultFileRenamePolicy());		    	
		    	
		    	String ceoCodeNum = mreq.getParameter("ceoCodeNum");
		    	
		    	CeoMemberDTO dto = dao.readMembernum(ceoCodeNum); 
		    	StringBuffer sb=new StringBuffer();
		    	
		    	if(dto==null)
				   	sb.append("�ߺ��Դϴ�.");
				else
				  	sb.append("�ߺ��� �ƴմϴ�.");
		    		    	
		    	req.setAttribute("mode", "created");
		    	req.setAttribute("title", "ȸ������");
		    	req.setAttribute("message1", sb.toString());
		    	
		    	forward(req, resp, "/WEB-INF/views/ceomember/storeUpdate.jsp");
	    
	     } else if(uri.indexOf("storeUpdate_ok.do")!=-1) {
	    	 
	    	 String pathname="c:/"+File.separator+"storePhoto";
	    	 File f=new File(pathname);
	    	 if(! f.exists()){
	    		 f.mkdirs();
	    	 }	    	
	    	 String encType="UTF-8";
	    	 int maxFilesize=5*1024*1024;

	    	 MultipartRequest mreq=null;
	    	 mreq=new MultipartRequest(req, pathname, maxFilesize, encType, new DefaultFileRenamePolicy());
	    	     	 
	    	 String ceoId=mreq.getParameter("ceoId");
	    	 CeoMemberDTO dto=dao.readMemberid(ceoId);
	    	 	    	 
	    	 dto.setStoreName(mreq.getParameter("storeName"));
	    	 dto.setCeoCodeNum(mreq.getParameter("ceoCodeNum"));
	    	 dto.setStoreTel(mreq.getParameter("storeTel"));
	    	 dto.setStoreType(mreq.getParameter("storeType"));
	    	 dto.setStoreAddr(mreq.getParameter("storeAddr"));
	    	 dto.setStorePhoto(mreq.getParameter("storePhoto"));
	    	 dto.setRegion(mreq.getParameter("region"));
	    	 
	    	 dao.updateStoreInfo(dto);
	    	 
	    	 resp.sendRedirect(cp+"/ceomember/storeInfo.do"); 	 	    	 	    	 
	     } else if(uri.indexOf("findid.do")!=-1){
             //IDã��(�̸�,����ó)
           
           req.setAttribute("mode", "findid");             
           forward(req, resp, "/WEB-INF/views/ceomember/ceologin.jsp");
           
       }else if(uri.indexOf("findid_ok.do")!=-1){
             //IDȮ��(������ ID����� ����ȭ��,Ʋ���� �޼��� ǥ���� �ٽ� IDã��ȭ��)
          String ceoName = req.getParameter("ceoName");
           String ceoTel = req.getParameter("ceoTel");
           
           CeoMemberDTO dto = dao.findMemberid(ceoName,ceoTel); 
                      
           
           if(dto!=null && dto.getEnabled()==1){
               //ã�� ����
              String ceoId=dto.getCeoId();
              
              req.setAttribute("title", "IDã�� ����");
            req.setAttribute("message", ceoName+"���� ID��"+ceoId+"�Դϴ�.");              
            
            forward(req,resp,"/WEB-INF/views/ceomember/ceocomplete.jsp");
            return;
           }
           
           req.setAttribute("mode", "findid");
           req.setAttribute("message", "�̸� �Ǵ� ����ó�� �߸� �����߰ų� ���Ե��� ���� ID �Դϴ�.");             
         
         forward(req, resp, "/WEB-INF/views/ceomember/ceologin.jsp");          
          
         
       }else if(uri.indexOf("findpwd1.do")!=-1){
             //passwordã�� 1�ܰ�(ID,�̸�)
           req.setAttribute("mode", "findpwd1");             
          forward(req, resp, "/WEB-INF/views/ceomember/ceologin.jsp");  
          
       }else if(uri.indexOf("findpwd1_ok.do")!=-1){
             //passwordã�� 1�ܰ�(������ 2�ܰ�����,Ʋ���� 1�ܰ� ȭ��)
          String ceoId = req.getParameter("ceoId");
           String ceoName = req.getParameter("ceoName");
           
           CeoMemberDTO dto = dao.findMemberpwd1(ceoId,ceoName); 
                      
           
           if(dto!=null && dto.getEnabled()==1){
              //ã�� ����              
              req.setAttribute("askPwd", dto.getAskPwd());
              req.setAttribute("mode", "findpwd2");              
              forward(req, resp, "/WEB-INF/views/ceomember/ceologin.jsp");                
              return;
           }          
            
          req.setAttribute("mode", "findpwd1");
          req.setAttribute("message", "�̸��� �߸� �����߰ų� ���Ե��� ���� ID �Դϴ�.");
          forward(req, resp, "/WEB-INF/views/ceomember/ceologin.jsp");  
       }else if(uri.indexOf("findpwd2_ok.do")!=-1){
           //passwordã�� 2�ܰ�(������ ������� ����,Ʋ���� 2�ܰ� ȭ��)
           String ansPwd = req.getParameter("ansPwd");
           
           CeoMemberDTO dto = dao.findMemberpwd2(ansPwd); 
                      
           
           if(dto.getAnsPwd().equals(ansPwd)){
              //ã�� ����
                            
              req.setAttribute("mode", "updatepwd");
              req.setAttribute("ceoId", dto.getCeoId());
            forward(req,resp,"/WEB-INF/views/ceomember/ceologin.jsp");                
            return;
           }
           
           req.setAttribute("mode", "findpwd2");
           req.setAttribute("message", "�ùٸ� �亯�� �ƴմϴ�.");             
         
         forward(req, resp, "/WEB-INF/views/ceomember/ceologin.jsp");        
          
       }else if(uri.indexOf("updatepwd_ok.do")!=-1){
           //password �����ϱ�(�����Ϸ��ϸ� ����ȭ��)
          String ceoId=req.getParameter("ceoId");
          
          CeoMemberDTO dto=dao.readMemberid(ceoId);
          
          dto.setCeoPwd(req.getParameter("ceoPwd"));           
          
           int result=dao.updatePwd(dto);                       
           
           if(result==1){
              //���� ����                      
              
              req.setAttribute("title", "�н�������� ����");
            req.setAttribute("message","���������� �����Ǿ����ϴ�.<br>���ο� �н������ �α��� �ϼ���.");
              
            forward(req,resp,"/WEB-INF/views/ceomember/ceocomplete.jsp");                
            return;
           }
           
           req.setAttribute("mode", "updatepwd");
           req.setAttribute("ceoId", dto.getCeoId());
           req.setAttribute("message", "������ �����߽��ϴ�. �ٽ��Է��ϼ���.");
         forward(req,resp,"/WEB-INF/views/ceomember/ceologin.jsp");     
          
       }
   }
	
}
