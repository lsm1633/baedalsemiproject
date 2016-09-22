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

		// �α��� ������ ���ǿ��� ��������
		HttpSession session = req.getSession();
		
		SessionInfo info = (SessionInfo) session.getAttribute("ceomember");
		if (info == null) { // �α��ε��� ���� ���
			resp.sendRedirect(cp + "/ceomember/login.do");
			return;
		}

		// �̹����� ������ ���(pathname)
		String root = session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"photo";
		File f=new File(pathname);
		if(! f.exists()) { // ������ �������� ������
			f.mkdirs();
		}
		
		MenuDAO dao = new MenuDAO();
		MyUtil util=new MyUtil();
		
		// uri�� ���� �۾� ����
		if (uri.indexOf("menu.do") != -1) {
			//�޴�����Ʈ
			String page=req.getParameter("page");
			int current_page=1;
			if(page!=null)
				current_page=Integer.parseInt(page);
			
			//���������� ���� �ش� ������ �޴��� �����ְ�
			String ceoId = info.getCeoId();	
			
			// ��ü������ ����
			int dataCount = dao.dataCount(ceoId);
			
			// ��ü��������
			int numPerPage=6;
			int total_page=util.pageCount(numPerPage, dataCount);
			if(current_page>total_page)
				current_page=total_page;
			
			// �Խù� ������ ���۰� ����ġ
			int start=(current_page-1)*numPerPage+1;
			int end=current_page*numPerPage;
					
			// �Խù� ��������
			List<MenuDTO> list = dao.listMenu(start, end, ceoId);
			
			//����¡ó��
			String listUrl = cp+"/storeMenu/menu.do";
			String articleUrl = cp+"/storeMenu/article.do?page="+current_page;
			String paging = util.paging(current_page, total_page,listUrl);
			
			// �������� list.jsp�� �ѱ� ��
			req.setAttribute("list", list);
			req.setAttribute("dataCount", dataCount);
			req.setAttribute("articleUrl", articleUrl);
			req.setAttribute("page", current_page);
			req.setAttribute("total_page", total_page);
			req.setAttribute("paging", paging);
			
			forward(req, resp, "/WEB-INF/views/business/menu.jsp");
		}
		else if (uri.indexOf("menuCreated.do") != -1) {
			//�޴��߰���
			
			req.setAttribute("title", "�޴��߰�");
			req.setAttribute("mode", "created");
			forward(req, resp, "/WEB-INF/views/business/menuCreated.jsp");
		}
		else if(uri.indexOf("menuCreated_ok.do")!=-1){
			// �޴��߰�
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
				

				
				// ������ ����� ���ϸ�
				String saveFilename=mreq.getFilesystemName("upload");
				
				// �����̸�����
				saveFilename = FileManager.doFilerename(pathname, saveFilename);
				
				dto.setImageFilename(saveFilename);
				
				// ����
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
			//������
			String page=req.getParameter("page");
			int num=Integer.parseInt(req.getParameter("num"));
			MenuDTO dto = dao.readMenu(num);
			
			if(dto==null){
				resp.sendRedirect(cp+"/storeMenu/menu.do?page="+page);
				return;
			}
			
			// �Խù��� �ø� ����ڰ� �ƴϸ�
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
			//�����Ϸ�
			
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
			
			// �̹��� ������ ���ε� �Ѱ��
			if(mreq.getFile("upload")!=null) {
			// ���� �̹��� ���� �����
			FileManager.doFiledelete(pathname, imageFilename);
							
			// ������ ����� ���ϸ�
			String saveFilename=mreq.getFilesystemName("upload");
							
			// ���� �̸� ����
			saveFilename = FileManager.doFilerename(pathname, saveFilename);
							
			dto.setImageFilename(saveFilename);
			
		}else {
			// ���ο� �̹��� ������ �ø��� ���� ��� ���� �̹��� ���Ϸ�
			dto.setImageFilename(imageFilename);
		}
			
			dao.updateMenu(dto);
			resp.sendRedirect(cp+"/storeMenu/menu.do?page="+page);	
		
		}
		else if(uri.indexOf("delete.do")!=-1) {
			//����
			int num=Integer.parseInt(req.getParameter("num"));
			String page=req.getParameter("page");
			
			MenuDTO dto = dao.readMenu(num);
			// �Խù��� �ø� ����ڳ� admin�� �ƴϸ�
			if(! dto.getCeoId().equals(info.getCeoId()) && ! info.getCeoId().equals("admin")) {
				resp.sendRedirect(cp+"/photo/list.do?page="+page);
				return;
			}
			// �̹��� ���� �����
			FileManager.doFiledelete(pathname, dto.getImageFilename());
						
			// ���̺� ������ ����
			dao.deleteMenu(num);
						
			resp.sendRedirect(cp+"/storeMenu/menu.do?page="+page);	
		}

	}
}
