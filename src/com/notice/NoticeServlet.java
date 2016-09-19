package com.notice;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

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
			// 게시물 리스트
			String page = req.getParameter("page");
			int current_page=1;
			if(page!=null)
				current_page = Integer.parseInt(page);
			
			String searchKey=req.getParameter("searchKey");
			String searchValue = req.getParameter("searchValue");
			if(searchKey==null) {
				searchKey="subject";
				searchValue="";
			}
			if(req.getMethod().equalsIgnoreCase("GET")) {
				searchValue=URLDecoder.decode(searchValue, "utf-8");
			}
			
			int numPerPage=10;
			int dataCount, total_page;
			
			if(searchValue.length()!=0) {
				dataCount = dao.dataCount(searchKey, searchValue);
			} else {
				dataCount = dao.dataCount();
			}
			
			total_page = util.pageCount(numPerPage, dataCount);
			
			if(current_page > total_page)
				current_page=total_page;
			
			int start = (current_page-1)*numPerPage+1;
			int end = current_page*numPerPage;
			
			List<NoticeDTO> list;
			if(searchValue.length()!=0) {
				list = dao.listNotice(start, end, searchKey, searchValue);
			} else {
				list = dao.listNotice(start, end);
			}
			
			// 공지글 리스트
			List<NoticeDTO> listNotice = null;
			listNotice = dao.listNotice();
			Iterator<NoticeDTO> itNotice = listNotice.iterator();
			while(itNotice.hasNext()) {
				NoticeDTO dto = itNotice.next();
				dto.setCreated(dto.getCreated().substring(0, 10));
			}
			
			Date endDate = new Date();
			long gap;
			
			// 리스트 글번호
			int listNum, n=0;
			Iterator<NoticeDTO> it = list.iterator();
			while(it.hasNext()) {
				NoticeDTO dto = it.next();
				listNum=dataCount-(start+n-1);
				dto.setListNum(listNum);
				
				try {
					SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					Date beginDate = formatter.parse(dto.getCreated());
					
					// 날짜차이(일)
	            	gap=(endDate.getTime() - beginDate.getTime()) / (24 * 60 * 60* 1000);
	            	dto.setGap(gap);
					
				} catch (Exception e) {
					System.out.println(e.toString());
				}
				
				dto.setCreated(dto.getCreated().substring(0, 10));
				
				n++;
			}
			
			
			String params = "";
			String listUrl;
			String articleUrl;
			
			if(searchValue.length()==0) {
				listUrl=cp+"/notice/notice.do";
				articleUrl=cp+"/notice/article.do?page="+current_page;
			} else {
				params = "searchKey=" + searchKey;
				params += "&searchValue=" + URLEncoder.encode(searchKey, "UTF-8");
				
				listUrl = cp + "/notice/notice.do?" + params;
				articleUrl = cp + "/notice/article.do?page=" + current_page + "&" + params;
			}
			
			String paging = util.paging(current_page, total_page, listUrl);
			
			// 데이터 포워딩
			req.setAttribute("list", list);
			req.setAttribute("listNotice", listNotice);
			req.setAttribute("articleUrl", articleUrl);
			req.setAttribute("dataCount", dataCount);
			req.setAttribute("paging", paging);
			req.setAttribute("page", current_page);
			req.setAttribute("total_page", total_page);
			
			forward(req, resp, "/WEB-INF/views/notice/notice.jsp");
		} else if(uri.indexOf("created.do")!=-1) {
			
			
			if(info==null) {
				resp.sendRedirect(cp+"/member/login.do");
				return;
			}
			
			// admin만 글쓰기
			if(! info.getUserId().equals("admin")) {
				resp.sendRedirect(cp+"/notice/notice.do");
				return;
			}
			
			
			// 글쓰기 폼 지정
			req.setAttribute("mode", "created");
			forward(req, resp, "/WEB-INF/views/notice/created.jsp");
		} else if (uri.indexOf("created_ok.do")!= -1) {
			
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
			
			
			String encType = "utf-8";
			int maxFilesize=10*1024*1024;
			
			MultipartRequest mreq = new MultipartRequest(
					req, pathname, maxFilesize, encType, 
					new DefaultFileRenamePolicy());
			
			NoticeDTO dto = new NoticeDTO();
			dto.setUserId(info.getUserId());
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
		} else if(uri.indexOf("article.do") != -1) {
			// 글보기
			
			int num = Integer.parseInt(req.getParameter("num"));
			String page = req.getParameter("page");
			
			String searchKey = req.getParameter("searchKey");
			String searchValue = req.getParameter("searchValue");
			if(searchKey==null) {
				searchKey="subject";
				searchValue="";
			}
			searchValue=URLDecoder.decode(searchValue, "utf-8");
			
			// 조회수 증가
			dao.updateHitCount(num);
			
			// 게시물 가져오기
			NoticeDTO dto = dao.readNotice(num);
			if(dto==null) {
				resp.sendRedirect(cp+"/notice/notice.do?page=" + page);
				return;
			}
			
			dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
			
			// 이전, 다음글
			NoticeDTO preReadDTO = dao.preReadNotice(dto.getNum(), searchKey, searchValue);
			NoticeDTO nextReadDTO = dao.nextReadNotice(dto.getNum(), searchKey, searchValue);
			
			String params = "page=" + page;
			if(searchValue.length() != 0) {
				params+="&searchKey="+searchKey;
				params+="&searchValue="+URLEncoder.encode(searchValue, "utf-8");
			}
			
			// 전송값 포워딩
			req.setAttribute("dto", dto);
			req.setAttribute("preReadDto", preReadDTO);
			req.setAttribute("nextReadDto", nextReadDTO);
			req.setAttribute("params", params);
			req.setAttribute("page", page);
			
			forward(req, resp, "/WEB-INF/views/notice/article.jsp");		
		} else if(uri.indexOf("update.do") != -1) {
			// 수정 폼
			if(info==null) {
				resp.sendRedirect(cp+"/member.login.do");
				return;
			}
			
			String page = req.getParameter("page");
			int num = Integer.parseInt(req.getParameter("num"));
			
			NoticeDTO dto = dao.readNotice(num);
			if(dto==null) {
				resp.sendRedirect(cp + "/notice/notice.do?page=" + page);
				return;
			}
			
			// 관리자만 수정
			if( ! info.getUserId().equals(dto.getUserId())) {
				resp.sendRedirect(cp + "notice/notice.do?=page" + page);
				return;
			}
			
			req.setAttribute("dto", dto);
			req.setAttribute("page", page);
			
			req.setAttribute("mode", "update");
			forward(req, resp, "/WEB-INF/views/notice/created/jsp");
		} else if(uri.indexOf("update_ok.do") != -1) {
			// 수정 완료
			if(info==null) {
				resp.sendRedirect(cp+"/member/login.do");
				return;
			}
			
			String encType = "utf-8";
			int maxFilesize = 10*1024*1024;
			
			MultipartRequest mreq = new MultipartRequest(req, pathname,
						maxFilesize, encType, new DefaultFileRenamePolicy());
			NoticeDTO dto = new NoticeDTO();
		}
		
		
	}

}
