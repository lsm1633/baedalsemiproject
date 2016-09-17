package com.notice;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.SessionInfo;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.util.MyServlet;
import com.util.MyUtil;

@WebServlet("/notice/*")
public class NoticeServlet extends MyServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String uri = req.getRequestURI();
		String cp = req.getContextPath();
		
		// 로그인 정보
		HttpSession session = req.getSession();
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		// 파일저장경로 설정
		String root = session.getServletContext().getRealPath("/");
		String pathname = root+File.separator+"uploads"+File.separator+"notice";
		File f = new File(pathname);
		if(! f.exists()) {
			f.mkdirs();
		}
		
		NoticeDAO dao = new NoticeDAO();
		MyUtil util = new MyUtil();
		
		if(uri.indexOf("notice.do")!=-1) {
			
			forward(req, resp, "/WEB-INF/views/notice/notice.jsp");
		} else if(uri.indexOf("created.do")!=-1) {
			
			/*
			if(info==null) {
				resp.sendRedirect(cp+"/member/login.do");
				return;
			}
			
			// admin만 글쓰기
			if(! info.getUserId().equals("admin")) {
				resp.sendRedirect(cp+"/notice/notice.do");
				return;
			}
			*/
			
			// 글쓰기 폼 지정
			req.setAttribute("mode", "created");
			forward(req, resp, "/WEB-INF/views/notice/created.jsp");
		} else if (uri.indexOf("created_ok.do")!= -1) {
			/*
			// 글 저장
			if(info==null) {
				resp.sendRedirect(cp+"/member/login.do");
				return;
			}
			
			// admin만 글을 등록
			if(! info.getUserId().equals("admin")) {
				resp.sendRedirect(cp+"/notice/notice.do");
				return;
			}
			*/
			
			String encType = "utf-8";
			int maxFilesize=10*1024*1024;
			
			MultipartRequest mreq = new MultipartRequest(
					req, pathname, maxFilesize, encType, 
					new DefaultFileRenamePolicy());
			
			NoticeDTO dto = new NoticeDTO();
			//dto.setUserId(info.getUserId());
			dto.setUserId("홍길동");
			if(mreq.getParameter("notice")!=null)
				dto.setNotice(Integer.parseInt(mreq.getParameter("notice")));
			dto.setSubject(mreq.getParameter("subject"));
			dto.setContent(mreq.getParameter("content"));
			
			if(mreq.getFile("upload")!=null){
				dto.setSaveFilename(mreq.getFilesystemName("upload"));
				dto.setOriginalFilename(mreq.getOriginalFileName("upload"));
				dto.setFilesize(mreq.getFile("upload").length());
			}
			dao.insertNotice(dto);
			resp.sendRedirect(cp+"/notice/notice.do");
		}
		
		
	}

}
