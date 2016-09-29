package com.order;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.basket.BasketDAO;
import com.basket.BasketDTO;
import com.member.MemberDAO;
import com.member.MemberDTO;
import com.member.SessionInfo;

import com.util.MyServlet;
@WebServlet("/order/*")
public class OrderServlet extends MyServlet{
   private static final long serialVersionUID = 1L;

   @Override
   protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      req.setCharacterEncoding("UTF-8");
      
      String uri = req.getRequestURI();
      
      HttpSession session = req.getSession();
      
      if(uri.indexOf("order.do")!=-1) {
         SessionInfo info = (SessionInfo)session.getAttribute("member");
         
         String userId = info.getUserId();
         String ceoId = req.getParameter("ceoId");
         
         MemberDAO dao = new MemberDAO();
         MemberDTO dto = new MemberDTO();
         dto = dao.readMember(userId);
      
         String tel = dto.getTel();
         
         BasketDAO dao2 = new BasketDAO();
         
         List<BasketDTO> list;
         list = dao2.listBasket(userId, ceoId);
         
         
         req.setAttribute("list", list);
         req.setAttribute("ceoId", ceoId);
         req.setAttribute("userId", userId);
         req.setAttribute("tel", tel);
         forward(req, resp, "/WEB-INF/views/order/order.jsp");
         
      } else if(uri.indexOf("order_ok.do")!=-1) {
         OrderDTO dto = new OrderDTO();
         OrderDAO dao = new OrderDAO();
         BasketDAO dao2 = new BasketDAO();
         String addr1 = req.getParameter("addr1");
         String addr2 = req.getParameter("addr2");
         String userId = req.getParameter("userId");
         String ceoId = req.getParameter("ceoId");
         
         String adrress = addr1 + " " + addr2;
         
         dto.setAdrress(adrress);
         dto.setCeoId(req.getParameter("ceoId"));
         dto.setComent(req.getParameter("coment"));
         dto.setMenuName(req.getParameter("menuName"));
         dto.setPayment(req.getParameter("payment"));
         dto.setPrice(Integer.parseInt(req.getParameter("price")));
         dto.setUserId(req.getParameter("userId"));
         dto.setTel(req.getParameter("tel"));
         
         int result = dao.insertOrder(dto);
         
         if(result != 1){
            String message = "주문요청이 되지 않았습니다.";
            req.setAttribute("message", message);
            forward(req, resp, "/WEB-INF/views/order/order.jsp");
            return;
         }         
         
         dao2.deleteBasket(userId, ceoId);
         
         StringBuffer sb = new StringBuffer();
         sb.append("주문요청이 완료되었습니다.");
         
         req.setAttribute("title", "주문 완료");
         req.setAttribute("message", sb.toString());
         
         forward(req, resp, "/WEB-INF/views/member/complete.jsp");
         
      }
   }   
}