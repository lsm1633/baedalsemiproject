package com.Freeboard;

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
/*import javax.servlet.http.HttpSession;*/

/*import com.member.SessionInfo;*/
import com.util.MyServlet;
import com.util.MyUtil;

@WebServlet("/freeboard/*")
public class FreeBoardServlet extends MyServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		/*HttpSession session=req.getSession();
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		if(info==null) {
			forward(req, resp, "/WEB-INF/views/member/login.jsp");
			return;
		}*/
		
		String uri=req.getRequestURI();
		String cp=req.getContextPath();
		FreeBoardDAO dao=new FreeBoardDAO();
		MyUtil util=new MyUtil();
		
		if(uri.indexOf("freeboard.do")!=-1) {
			// �� ����Ʈ
			String page=req.getParameter("page");
			int current_page=1;
			if(page!=null)
				current_page=Integer.parseInt(page);
			
			// �˻�
			String searchKey=req.getParameter("searchKey");
			String searchValue=req.getParameter("searchValue");
			if(searchKey==null) {
				searchKey="subject";
				searchValue="";
			}
			// GET ����� ��� ���ڵ�
			if(req.getMethod().equalsIgnoreCase("GET")) {
				searchValue=URLDecoder.decode(searchValue, "utf-8");
			}
			
			// ��ü ������ ����
			int dataCount;
			if(searchValue.length()==0)
				dataCount=dao.dataCount();
			else
				dataCount=dao.dataCount(searchKey, searchValue);
			
			// ��ü ������ ��
			int numPerPage=10;
			int total_page=util.pageCount(numPerPage, dataCount);
			
			if(current_page>total_page)
				current_page=total_page;
			
			// �Խù� ������ ���۰� ��
			int start=(current_page-1)*numPerPage+1;
			int end=current_page*numPerPage;
			
			// �Խù� ��������
			List<FreeBoardDTO> list=null;
			if(searchValue.length()==0)
				list=dao.listBoard(start, end);
			else
				list=dao.listBoard(start, end, searchKey, searchValue);
			
			// ����Ʈ �۹�ȣ �����
	        Date endDate = new Date();
	        long gap;
			
			int listNum, n=0;
			Iterator<FreeBoardDTO>it=list.iterator();
			while(it.hasNext()) {
				FreeBoardDTO dto=it.next();
				listNum=dataCount-(start+n-1);
				dto.setListNum(listNum);
				
				try {
					SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					Date beginDate = formatter.parse(dto.getCreated());
	/*            
	            	// ��¥����(��)
	            	gap=(endDate.getTime() - beginDate.getTime()) / (24 * 60 * 60* 1000);
	            	dto.setGap(gap);
	*/
					// ��¥����(�ð�)
					gap=(endDate.getTime() - beginDate.getTime()) / (60*60* 1000);
					dto.setGap(gap);
				}catch(Exception e) {
				}
	            
	            dto.setCreated(dto.getCreated().substring(0, 10));
				
				n++;
			}
			
			String params="";
			if(searchValue.length()!=0) {
				// �˻��� ��� �˻��� ���ڵ�
				searchValue=URLEncoder.encode(searchValue, "utf-8");
				params="searchKey="+searchKey+
						 "&searchValue="+searchValue;
			}
			
			// ����¡ ó��
			String listUrl=cp+"/freeboard/freeboard.do";
			String articleUrl=cp+"/freeboard/article.do?page="+current_page;
			if(params.length()!=0) {
				listUrl+="?"+params;
				articleUrl+="&"+params;
			}
			
			String paging=util.paging(current_page, total_page, listUrl);
			
			// �������� JSP�� �ѱ� �Ӽ�
			req.setAttribute("list", list);
			req.setAttribute("page", current_page);
			req.setAttribute("total_page", total_page);
			req.setAttribute("dataCount", dataCount);
			req.setAttribute("paging", paging);
			req.setAttribute("articleUrl", articleUrl);
			
			forward(req, resp, "/WEB-INF/views/freeboard/freeboard.jsp");
		} else if(uri.indexOf("created.do")!=-1) {
			// �۾��� ��
			
			req.setAttribute("mode", "created");
			forward(req, resp, "/WEB-INF/views/freeboard/created.jsp");
		} else if(uri.indexOf("created_ok.do")!=-1) {
			// �� ����
			FreeBoardDTO dto=new FreeBoardDTO();
			
			/*dto.setUserId(info.getUserId());*/
			dto.setSubject(req.getParameter("subject"));
			dto.setContent(req.getParameter("content"));
			
			dao.insertBoard(dto, "created");
			
			resp.sendRedirect(cp+"/freeboard/freeboard.do");
			
		} else if(uri.indexOf("article.do")!=-1) {
			// �ۺ���
			// �Ķ���� : boardNum, page, [searchKey, searchValue]
			int boardNum=Integer.parseInt(req.getParameter("boardNum"));
			String page=req.getParameter("page");
			String searchKey=req.getParameter("searchKey");
			String searchValue=req.getParameter("searchValue");
			if(searchKey==null) {
				searchKey="subject";
				searchValue="";
			}
			
			searchValue=URLDecoder.decode(searchValue, "utf-8");
			
			// ��ȸ�� ����
			dao.updateHitCount(boardNum);
			
			// �Խù� ��������
			FreeBoardDTO dto=dao.readBoard(boardNum);
			if(dto==null) { // �Խù��� ������ �ٽ� ����Ʈ��
				resp.sendRedirect(cp+"/freeboard/freeboard.do?page="+page);
				return;
			}
			
			int linesu = dto.getContent().split("\n").length;
			dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
			
			// ������ ������
			FreeBoardDTO preReadDto=dao.preReadBoard(dto.getGroupNum(), dto.getOrderNo(), 
					searchKey, searchValue);
			FreeBoardDTO nextReadDto=dao.nextReadBoard(dto.getGroupNum(), dto.getOrderNo(), 
					searchKey, searchValue);
			
			// ����Ʈ�� ������/�����ۿ��� ����� �Ķ����
			String params="page="+page;
			if(searchValue.length()!=0) {
				params+="&searchKey="+searchKey
						+"&searchValue="+URLEncoder.encode(searchValue, "utf-8");
			}
			
			// JSP�� ������ �Ӽ�
			req.setAttribute("dto", dto);
			req.setAttribute("linesu", linesu);
			req.setAttribute("page", page);
			req.setAttribute("params", params);
			req.setAttribute("preReadDto", preReadDto);
			req.setAttribute("nextReadDto", nextReadDto);
			
			forward(req, resp, "/WEB-INF/views/freeboard/article.jsp");
			
		} else if(uri.indexOf("reply.do")!=-1) {
			// �亯 ��
			int boardNum=Integer.parseInt(
					req.getParameter("boardNum"));
			String page=req.getParameter("page");
			
			FreeBoardDTO dto=dao.readBoard(boardNum);
			if(dto==null) {
				resp.sendRedirect(cp+"/freeboard/freeboard.do?page="
			           +page);
				return;
			}
			dto.setContent("["+
			         dto.getSubject()+"] �� ���� �亯�Դϴ�.");
			
			req.setAttribute("dto", dto);
			req.setAttribute("page", page);
			req.setAttribute("mode", "reply");
			forward(req, resp, "/WEB-INF/views/freeboard/created.jsp");
			
		} else if(uri.indexOf("reply_ok.do")!=-1) {
			// �亯 �Ϸ�
			FreeBoardDTO dto=new FreeBoardDTO();
			/*dto.setUserId(info.getUserId());*/
			dto.setSubject(req.getParameter("subject"));
			dto.setContent(req.getParameter("content"));
			dto.setGroupNum(Integer.parseInt(req.getParameter("groupNum")));
			dto.setDepth(Integer.parseInt(req.getParameter("depth")));
			dto.setOrderNo(Integer.parseInt(req.getParameter("orderNo")));
			dto.setParent(Integer.parseInt(req.getParameter("parent")));
			
			String page=req.getParameter("page");
			
			dao.insertBoard(dto, "reply");
			
			resp.sendRedirect(cp+"/freeboard/freeboard.do?page="+page);
			
		} else if(uri.indexOf("update.do")!=-1) {
			// ���� ��
			// ���� ��
			String page=req.getParameter("page");
			int boardNum=Integer.parseInt(	req.getParameter("boardNum"));
			FreeBoardDTO dto=dao.readBoard(boardNum);
			
			if(dto==null) {
				resp.sendRedirect(cp+"/freeboard/freeboard.do?page="+page);
				return;
			}
			
			// �Խù��� �ø� ����ڰ� �ƴϸ�
			/*if(! dto.getUserId().equals(info.getUserId())) {
				resp.sendRedirect(cp+"/board/list.do?page="+page);
				return;
			}*/
			
			req.setAttribute("dto", dto);
			req.setAttribute("page", page);
			req.setAttribute("mode", "update");
			forward(req, resp, "/WEB-INF/views/freeboard/created.jsp");
			
		} else if(uri.indexOf("update_ok.do")!=-1) {
			// ���� �Ϸ�
			String page=req.getParameter("page");
			
			if(req.getMethod().equalsIgnoreCase("GET")) {
				resp.sendRedirect(cp+"/freeboard/freeboard.do?page="+page);
				return;
			}
			
			FreeBoardDTO dto=new FreeBoardDTO();
			dto.setBoardNum(Integer.parseInt(req.getParameter("boardNum")));
			dto.setSubject(req.getParameter("subject"));
			dto.setContent(req.getParameter("content"));
			
			dao.updateBoard(dto);
			
			resp.sendRedirect(cp+"/freeboard/freeboard.do?page="+page);
			
		} else if(uri.indexOf("delete.do")!=-1) {
			// ���� �Ϸ�
			String page=req.getParameter("page");
			int boardNum=Integer.parseInt(req.getParameter("boardNum"));
			FreeBoardDTO dto=dao.readBoard(boardNum);
			
			if(dto==null) {
				resp.sendRedirect(cp+"/freeboard/freeboard.do?page="+page);
				return;
			}
			
			// �Խù��� �ø� ����ڳ� admin�� �ƴϸ�
			/*if(! dto.getUserId().equals(info.getUserId()) && ! info.getUserId().equals("admin")) {
				resp.sendRedirect(cp+"/board/list.do?page="+page);
				return;
			}*/
			
			dao.deleteBoard(boardNum);
			resp.sendRedirect(cp+"/freeboard/freeboard.do?page="+page);
		}
		
	}

}
