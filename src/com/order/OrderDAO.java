package com.order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.util.DBConn;

public class OrderDAO {

   private Connection conn = DBConn.getConnection();
   
   public int insertOrder(OrderDTO dto){
      int result=0;
      PreparedStatement pstmt=null;
      StringBuffer sb=new StringBuffer();
      
      try {
         sb.append("INSERT INTO orderinfo(");
         sb.append("ordernum, userId, ceoId, menuname, price, adrress, coment, payment, tel) ");
         sb.append("VALUES (orderinfo_seq.NEXTVAL,?,?,?,?,?,?,?,?) ");
         
         pstmt=conn.prepareStatement(sb.toString());
         pstmt.setString(1, dto.getUserId());
         pstmt.setString(2, dto.getCeoId());
         pstmt.setString(3, dto.getMenuName());
         pstmt.setInt(4, dto.getPrice());
         pstmt.setString(5, dto.getAdrress());
         pstmt.setString(6, dto.getComent());
         pstmt.setString(7, dto.getPayment());
         pstmt.setString(8, dto.getTel());
         
         result=pstmt.executeUpdate();
         pstmt.close();
         
      } catch (Exception e) {
         System.out.println(e.toString());
      }
      
      return result;
   }
   
   public int dataCount(){
      int result=0;
      PreparedStatement pstmt=null;
      ResultSet rs=null;
      String sql;
      
      try {
         sql="SELECT NVL(COUNT(*),0) FROM orderinfo";
         pstmt=conn.prepareStatement(sql);
         rs=pstmt.executeQuery();
         if(rs.next()){
            result=rs.getInt(1);
         }
         pstmt.close();
         rs.close();
      } catch (Exception e) {
         System.out.println(e.toString());
      }
      
      return result;
   }
   
   public List<OrderDTO> listOrder(int start,int end){
      List<OrderDTO> list = new ArrayList<>();
      PreparedStatement pstmt=null;
      ResultSet rs=null;
      StringBuffer sb=new StringBuffer();
      
      try {
         sb.append("SELECT * FROM (");
         sb.append("   SELECT ROWNUM rnum, tb.* FROM (");
         sb.append("      SELECT ordernum,o.userId,ceoId");
         sb.append("          ,menuname,price,adrress,m.tel");
         sb.append("          ,coment,payment");
         sb.append("      FROM orderinfo o JOIN member2 m ON o.userId=m.userId");
         sb.append("     ORDER BY ordernum DESC");
         sb.append("  )tb WHERE ROWNUM <= ? ");
         sb.append(") WHERE rnum >=? ");
         
         pstmt= conn.prepareStatement(sb.toString());
         pstmt.setInt(1, end);
         pstmt.setInt(2, start);
         
         rs=pstmt.executeQuery();
         
         while(rs.next()){
            OrderDTO dto=new OrderDTO();
            dto.setAdrress(rs.getString("adrress"));
            dto.setCeoId(rs.getString("ceoId")); 
            dto.setComent(rs.getString("coment")); 
            dto.setMenuName(rs.getString("menuName")); 
            dto.setOrdernum(rs.getInt("ordernum")); 
            dto.setPayment(rs.getString("payment")); 
            dto.setPrice(rs.getInt("price")); 
            dto.setTel(rs.getString("tel")); 
            dto.setUserId(rs.getString("userId")); 
            
            list.add(dto);
         }
         rs.close();
         pstmt.close();
      } catch (Exception e) {
         System.out.println(e.toString());
      }
      
      return list;
   }
   
   public OrderDTO readOrder(int num){
      OrderDTO dto =null;
      PreparedStatement pstmt=null;
      ResultSet rs=null;
      StringBuffer sb=new StringBuffer();
      
      try {
         sb.append("SELECT ordernum,o.userId,ceoId,menuname,price,adrress,coment,payment ");
         sb.append(" FROM orderinfo o JOIN member2 m ON o.userId=m.userId WHERE ordernum=?");
         
         pstmt=conn.prepareStatement(sb.toString());
         pstmt.setInt(1, num);
         
         rs=pstmt.executeQuery();
         
         if(rs.next()){
            dto=new OrderDTO();
            
            dto.setAdrress(rs.getString("adrress"));
            dto.setCeoId(rs.getString("ceoId")); 
            dto.setComent(rs.getString("coment")); 
            dto.setMenuName(rs.getString("menuName")); 
            dto.setOrdernum(rs.getInt("ordernum")); 
            dto.setPayment(rs.getString("payment")); 
            dto.setPrice(rs.getInt("price")); 
            dto.setTel(rs.getString("tel")); 
            dto.setUserId(rs.getString("userId")); 
         }
      } catch (Exception e) {
         System.out.println(e.toString());
      }
      
      return dto;
   }
   
   public List<OrderDTO> listOrder(String ceoId,String today){
	      List<OrderDTO> list = new ArrayList<>();
	      PreparedStatement pstmt=null;
	      ResultSet rs=null;
	      StringBuffer sb=new StringBuffer();
	      
	      try {
	         sb.append("SELECT ROWNUM rnum, tb.* FROM (");
	         sb.append("   SELECT ordernum,ceoId,payment,price,created");
	         sb.append("      FROM orderinfo ORDER BY ordernum DESC");
	         sb.append(")tb where ceoid=? and  to_char(created,'yyyy-mm-dd')=?");
	         
	         
	         pstmt= conn.prepareStatement(sb.toString());
	
	         pstmt.setString(1, ceoId);
	         pstmt.setString(2, today);
	         
	         rs=pstmt.executeQuery();
	         
	         while(rs.next()){
	            OrderDTO dto=new OrderDTO();
	            dto.setCeoId(rs.getString("ceoId")); 
	            dto.setOrdernum(rs.getInt("ordernum")); 
	            dto.setPayment(rs.getString("payment")); 
	            dto.setPrice(rs.getInt("price")); 
	            dto.setCreated(rs.getString("created"));
	            
	            list.add(dto);
	         }
	         rs.close();
	         pstmt.close();
	      } catch (Exception e) {
	         System.out.println(e.toString());
	      }
	      
	      return list;
	   }
   
   
   public List<OrderDTO> listOrder(String ceoId,String start,String last){
	      List<OrderDTO> list = new ArrayList<>();
	      PreparedStatement pstmt=null;
	      ResultSet rs=null;
	      StringBuffer sb=new StringBuffer();
	      
	      try {
	    	 sb.append("SELECT * from(");
	         sb.append(" SELECT ROWNUM rnum,tb.* FROM (");
	         sb.append("   SELECT ordernum,ceoId,payment,price,created");
	         sb.append("      FROM orderinfo ORDER BY ordernum DESC");
	         sb.append(" )tb where ceoid=? ");
	         sb.append(") where created between to_date(?,'yyyy-mm-dd')-1 and to_date(?,'yyyy-mm-dd')+1 ");
	         
	         
	         pstmt= conn.prepareStatement(sb.toString());
	
	         pstmt.setString(1, ceoId);
	         pstmt.setString(2, start);
	         pstmt.setString(3, last);
	         
	         rs=pstmt.executeQuery();
	         
	         while(rs.next()){
	            OrderDTO dto=new OrderDTO();
	            dto.setCeoId(rs.getString("ceoId")); 
	            dto.setOrdernum(rs.getInt("ordernum")); 
	            dto.setPayment(rs.getString("payment")); 
	            dto.setPrice(rs.getInt("price")); 
	            dto.setCreated(rs.getString("created"));
	            
	            list.add(dto);
	         }
	         rs.close();
	         pstmt.close();
	      } catch (Exception e) {
	         System.out.println(e.toString());
	      }
	      
	      return list;
	   }
   
   
   
   
}