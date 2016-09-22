package com.storeMenu;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ceomember.SessionInfo;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.util.FileManager;
import com.util.MyServlet;
import com.util.MyUtil;

@WebServlet("/storeMenu/*")
public class StoreMenuServlet extends MyServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String uri = req.getRequestURI();
		String cp = req.getContextPath();

		// 로그인 정보를 세션에서 가져오기
		HttpSession session = req.getSession();
		
		SessionInfo info = (SessionInfo) session.getAttribute("ceomember");
		if (info == null) { // 로그인되지 않은 경우
			resp.sendRedirect(cp + "/ceomember/login.do");
			return;
		}

		// 이미지를 저장할 경로(pathname)
		String root = session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"photo";
		File f=new File(pathname);
		if(! f.exists()) { // 폴더가 존재하지 않으면
			f.mkdirs();
		}
		
		MenuDAO dao = new MenuDAO();
		MyUtil util=new MyUtil();
		
		// uri에 따른 작업 구분
		if (uri.indexOf("menu.do") != -1) {
			//메뉴리스트
			String page=req.getParameter("page");
			int current_page=1;
			if(page!=null)
				current_page=Integer.parseInt(page);
			
			//세션정보에 따라 해당 점포의 메뉴만 볼수있게
			String ceoId = info.getCeoId();	
			
			// 전체데이터 개수
			int dataCount = dao.dataCount(ceoId);
			
			// 전체페이지수
			int numPerPage=6;
			int total_page=util.pageCount(numPerPage, dataCount);
			if(current_page>total_page)
				current_page=total_page;
			
			// 게시물 가져올 시작과 끝위치
			int start=(current_page-1)*numPerPage+1;
			int end=current_page*numPerPage;
					
			// 게시물 가져오기
			List<MenuDTO> list = dao.listMenu(start, end, ceoId);
			
			//페이징처리
			String listUrl = cp+"/storeMenu/menu.do";
			String articleUrl = cp+"/storeMenu/article.do?page="+current_page;
			String paging = util.paging(current_page, total_page,listUrl);
			
			// 포워딩할 list.jsp에 넘길 값
			req.setAttribute("list", list);
			req.setAttribute("dataCount", dataCount);
			req.setAttribute("articleUrl", articleUrl);
			req.setAttribute("page", current_page);
			req.setAttribute("total_page", total_page);
			req.setAttribute("paging", paging);
			
			forward(req, resp, "/WEB-INF/views/business/menu.jsp");
		}
		else if (uri.indexOf("menuCreated.do") != -1) {
			//메뉴추가폼
			
			req.setAttribute("title", "메뉴추가");
			req.setAttribute("mode", "created");
			forward(req, resp, "/WEB-INF/views/business/menuCreated.jsp");
		}
		else if(uri.indexOf("menuCreated_ok.do")!=-1){
			// 메뉴추가
			String encType="utf-8";
			int maxSize=5*1024*1024;
			
			MultipartRequest mreq=new MultipartRequest(
					req, pathname, maxSize, encType,
					new DefaultFileRenamePolicy());
			
			MenuDTO dto = new MenuDTO();
			
			if(mreq.getFile("upload")!=null){
				dto.setCeoId(info.getCeoId());
				
				dto.setCate(mreq.getParameter("cate"));
				dto.setName(mreq.getParameter("name"));
				dto.setContent(mreq.getParameter("content"));
				dto.setPrice(Integer.parseInt(mreq.getParameter("price")));
				dto.setImageFilename(mreq.getParameter("imageFileName"));
				

				
				// 서버에 저장된 파일명
				String saveFilename=mreq.getFilesystemName("upload");
				
				// 파일이름변경
				saveFilename = FileManager.doFilerename(pathname, saveFilename);
				
				dto.setImageFilename(saveFilename);
				
				// 저장
				dao.insertMenu(dto);
			}
			resp.sendRedirect(cp+"/storeMenu/menu.do");
		}
		else if(uri.indexOf("article.do")!=-1){
			int num=Integer.parseInt(req.getParameter("num"));
			String page=req.getParameter("page");
			
			MenuDTO dto = dao.readMenu(num);
			if(dto==null){
				resp.sendRedirect(cp+"/storeMenu/menu.do?page="+page);
				return;
			}
			
			dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
			
			req.setAttribute("dto", dto);
			req.setAttribute("page", page);
			
			String path="/WEB-INF/views/business/menuArticle.jsp";
			forward(req, resp, path);
			
		}
		else if(uri.indexOf("update.do")!=-1){
			//수정폼
			String page=req.getParameter("page");
			int num=Integer.parseInt(req.getParameter("num"));
			MenuDTO dto = dao.readMenu(num);
			
			if(dto==null){
				resp.sendRedirect(cp+"/storeMenu/menu.do?page="+page);
				return;
			}
			
			// 게시물을 올린 사용자가 아니면
			if(! dto.getCeoId().equals(info.getCeoId())) {
				resp.sendRedirect(cp+"/");
				return;
			}
			
			req.setAttribute("dto", dto);
			req.setAttribute("page", page);
			
			req.setAttribute("mode", "update");
			
			forward(req, resp, "/WEB-INF/views/business/menuCreated.jsp");
			
		}
		else if(uri.indexOf("update_ok.do")!=-1) {
			//수정완료
			
			String encType="utf-8";
			int maxSize=5*1024*1024;
			
			MultipartRequest mreq=new MultipartRequest(
					req, pathname, maxSize, encType,
					new DefaultFileRenamePolicy());
			
			String page=mreq.getParameter("page");
			String imageFilename=mreq.getParameter("imageFilename");
			
			MenuDTO dto = new MenuDTO();
			dto.setNum(Integer.parseInt(mreq.getParameter("num")));
			dto.setName(mreq.getParameter("name"));
			dto.setCate(mreq.getParameter("cate"));
			dto.setContent(mreq.getParameter("content"));
			dto.setPrice(Integer.parseInt(mreq.getParameter("price")));
			
			// 이미지 파일을 업로드 한경우
			if(mreq.getFile("upload")!=null) {
			// 기존 이미지 파일 지우기
			FileManager.doFiledelete(pathname, imageFilename);
							
			// 서버에 저장된 파일명
			String saveFilename=mreq.getFilesystemName("upload");
							
			// 파일 이름 변경
			saveFilename = FileManager.doFilerename(pathname, saveFilename);
							
			dto.setImageFilename(saveFilename);
			
		}else {
			// 새로운 이미지 파일을 올리지 않은 경우 기존 이미지 파일로
			dto.setImageFilename(imageFilename);
		}
			
			dao.updateMenu(dto);
			resp.sendRedirect(cp+"/storeMenu/menu.do?page="+page);	
		
		}
		else if(uri.indexOf("delete.do")!=-1) {
			//삭제
			int num=Integer.parseInt(req.getParameter("num"));
			String page=req.getParameter("page");
			
			MenuDTO dto = dao.readMenu(num);
			// 게시물을 올린 사용자나 admin이 아니면
			if(! dto.getCeoId().equals(info.getCeoId()) && ! info.getCeoId().equals("admin")) {
				resp.sendRedirect(cp+"/photo/list.do?page="+page);
				return;
			}
			// 이미지 파일 지우기
			FileManager.doFiledelete(pathname, dto.getImageFilename());
						
			// 테이블 데이터 삭제
			dao.deleteMenu(num);
						
			resp.sendRedirect(cp+"/storeMenu/menu.do?page="+page);	
		}

	}
}
