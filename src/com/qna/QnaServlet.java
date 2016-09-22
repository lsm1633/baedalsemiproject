package com.qna;

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
//import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSession;

import com.member.SessionInfo;
import com.util.MyServlet;
import com.util.MyUtil;
//세션정보 클래스

@WebServlet("/qna/*")
public class QnaServlet extends MyServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		String uri=req.getRequestURI();
		String cp=req.getContextPath();
		
		QnaDAO dao=new QnaDAO();
		MyUtil util=new MyUtil();
		
		HttpSession session=req.getSession();
		SessionInfo info=(SessionInfo)session.getAttribute("member");
				
		if(info==null) {
			forward(req, resp, "/WEB-INF/views/member/login.jsp");
			return;
		}
		
		if(uri.indexOf("qna.do")!=-1) {			
			// 글 리스트
			String page=req.getParameter("page");
			String userId=info.getUserId(); //로그인 세션 아이디정보
			
			int current_page=1;
			
			if(page!=null)
				current_page=Integer.parseInt(page);
			
			// 검색
			String searchKey=req.getParameter("searchKey");
			String searchValue=req.getParameter("searchValue");
			if(searchKey==null) {
				searchKey="subject";
				searchValue="";
			}
			// GET 방식인 경우 디코딩
			if(req.getMethod().equalsIgnoreCase("GET")) {
				searchValue=URLDecoder.decode(searchValue, "utf-8");
			}
			
			// 전체 데이터 개수
			int dataCount;
			dataCount=dao.dataCount(userId);	
			
			
			// 전체 페이지 수
			int numPerPage=10;
			int total_page=util.pageCount(numPerPage, dataCount);
			
			if(current_page>total_page)
				current_page=total_page;
			
			// 게시물 가져올 시작과 끝
			int start=(current_page-1)*numPerPage+1;
			int end=current_page*numPerPage;
			
			// 게시물 목록 가져오기
			List<QnaDTO> list=null;
			
			if(userId.equals("admin"))
				list=dao.listQna_Admin(start, end);	//관리자			
			else
				list=dao.listQna(start, end, userId); //일반 사용자	
			
			// 리스트 글번호 만들기
	        Date endDate = new Date();
	        long gap;
			
			int listNum, n=0;
			Iterator<QnaDTO>it=list.iterator();
			
			while(it.hasNext()) {
				QnaDTO dto=it.next();
				listNum=dataCount-(start+n-1);
				dto.setListNum(listNum);
				
				try {
					SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					Date beginDate = formatter.parse(dto.getCreated());
	
					gap=(endDate.getTime() - beginDate.getTime()) / (60*60* 1000);
					dto.setGap(gap);
				} catch(Exception e) {
					
				}	            
	            dto.setCreated(dto.getCreated().substring(0, 10));
				
				n++;
			}
			
			String params="";
			if(searchValue.length()!=0) {
				// 검색인 경우 검색값 인코딩
				searchValue=URLEncoder.encode(searchValue, "utf-8");
				params="searchKey="+searchKey+
						 "&searchValue="+searchValue;
			}
			
			// 페이징 처리
			String listUrl=cp+"/qna/qna.do";
			String articleUrl=cp+"/qna/article.do?page="+current_page;
			if(params.length()!=0) {
				listUrl+="?"+params;
				articleUrl+="&"+params;
			}
			
			String paging=util.paging(current_page, total_page, listUrl);
			
			// 포워딩할 JSP로 넘길 속성
			req.setAttribute("list", list);
			req.setAttribute("page", current_page);
			req.setAttribute("total_page", total_page);
			req.setAttribute("dataCount", dataCount);
			req.setAttribute("paging", paging);
			req.setAttribute("articleUrl", articleUrl);
			
			forward(req, resp, "/WEB-INF/views/qna/qna.jsp");
		} else if(uri.indexOf("created.do")!=-1) {
			// 글쓰기 폼
			
			req.setAttribute("mode", "created");
			forward(req, resp, "/WEB-INF/views/qna/created.jsp");
		} else if(uri.indexOf("created_ok.do")!=-1) {
			// 글 저장
			QnaDTO dto=new QnaDTO();
			
			dto.setUserId(info.getUserId());
			dto.setSubject(req.getParameter("subject"));
			dto.setContent(req.getParameter("content"));		
			
			dao.insertQna(dto, "created");
			
			resp.sendRedirect(cp+"/qna/qna.do");
			
		} else if(uri.indexOf("article.do")!=-1) {
			//글 보기
			//파라미터: boardNum, page, [searchKey, searchValue]
			int boardNum=Integer.parseInt(req.getParameter("boardNum"));
			String page=req.getParameter("page");
			String searchKey=req.getParameter("searchKey");
			String searchValue=req.getParameter("searchValue");
						
			if(searchKey==null) {
				searchKey="subject";
				searchValue="";
			}
			
			//조회수 증가
			dao.updateHitCount(boardNum);
			
			//게시물 가져오기
			QnaDTO dto=dao.readQna(boardNum);
			if(dto==null) { //게시물 없으면 다시 리스트로
				resp.sendRedirect(cp+"/qna/qna.do?page="+page);
				return;
			}
			
			int lineCount=dto.getContent().split("\n").length;
			dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
			
			//이전글 다음글
			QnaDTO preReadDTO=dao.preReadQna(dto.getGroupNum(), dto.getOrderNo(), searchKey, searchValue);
			QnaDTO nextReadDTO=dao.nextReadQna(dto.getGroupNum(), dto.getOrderNo(), searchKey, searchValue);
			
			//리스트나 이전글/다음글에서 사용할 파라미터
			String params="page="+page;
			if(searchValue.length()!=0) {
				params="&searchKey="+searchKey+"&searchValue="+URLEncoder.encode(searchValue, "UTF-8");
			}
			
			//JSP로 전달할 속성
			req.setAttribute("dto", dto);
			req.setAttribute("page", page);
			req.setAttribute("preReadDto", preReadDTO);
			req.setAttribute("nextReadDto", nextReadDTO);
			req.setAttribute("lineCount", lineCount);
			req.setAttribute("params", params);
			
			forward(req, resp, "/WEB-INF/views/qna/article.jsp");
		} else if(uri.indexOf("reply.do")!=-1){
			// 답변 폼 ==> 답변 업데이트
			// - 넘길 파라미터: subject, content / (hidden으로) groupNum, orderNo, depth, parent, parent_id
			int boardNum=Integer.parseInt(req.getParameter("boardNum"));
			String page=req.getParameter("page");
			
			QnaDTO dto=dao.readQna(boardNum);
			if(dto==null) {
				resp.sendRedirect(cp+"/qna/qna.do?page="+page);
				return;
			}
			
			dto.setContent("["+dto.getSubject()+"] 에 대한 답변입니다." );
			
			req.setAttribute("dto", dto);
			req.setAttribute("page", page);
			req.setAttribute("mode", "reply");

			forward(req, resp, "/WEB-INF/views/qna/created.jsp");
			
		} else if(uri.indexOf("reply_ok.do")!=-1) {
			// 답변 완료
			QnaDTO dto=new QnaDTO();
			
			dto.setUserId(info.getUserId());
			dto.setSubject(req.getParameter("subject"));
			dto.setContent(req.getParameter("content"));
			dto.setGroupNum(Integer.parseInt(req.getParameter("groupNum")));
			dto.setDepth(Integer.parseInt(req.getParameter("depth")));
			dto.setOrderNo(Integer.parseInt(req.getParameter("orderNo")));
			dto.setParent(Integer.parseInt(req.getParameter("parent")));
			dto.setParent_id(req.getParameter("parent_id"));
			
			String page=req.getParameter("page");
			
			dao.insertQna(dto, "reply");
			
			resp.sendRedirect(cp+"/qna/qna.do?page="+page);
		
		} else if(uri.indexOf("update.do")!=-1) {
			// 수정 폼
			String page=req.getParameter("page");
			int boardNum=Integer.parseInt(req.getParameter("boardNum"));
			QnaDTO dto=dao.readQna(boardNum);
			
			if(dto==null) {
				resp.sendRedirect(cp+"/qna/qna.do?page="+page);
				return;
			}
			
			req.setAttribute("dto", dto);
			req.setAttribute("page", page);
			req.setAttribute("mode", "update");
			forward(req, resp, "/WEB-INF/views/qna/created.jsp");
			
		} else if(uri.indexOf("update_ok.do")!=-1) {
			// 수정 완료
			String page=req.getParameter("page");
			
			if(req.getMethod().equalsIgnoreCase("GET")) {
				resp.sendRedirect(cp+"/qna/qna.do?page="+page);
				return;
			}
			
			QnaDTO dto=new QnaDTO();
			dto.setBoardNum(Integer.parseInt(req.getParameter("boardNum")));
			dto.setSubject(req.getParameter("subject"));
			dto.setContent(req.getParameter("content"));
			
			dao.updateQna(dto);
			
			resp.sendRedirect(cp+"/qna/qna.do?page="+page);
			
		} else if(uri.indexOf("delete.do")!=-1) {
			// 삭제 완료
			String page=req.getParameter("page");
			int boardNum=Integer.parseInt(req.getParameter("boardNum"));
			QnaDTO dto=dao.readQna(boardNum);
			
			if(dto==null) {
				resp.sendRedirect(cp+"/qna/qna.do?page="+page);
				return;
			}
			dao.deleteQna(boardNum);
			resp.sendRedirect(cp+"/qna/qna.do?page="+page);
		}		
	}
}
