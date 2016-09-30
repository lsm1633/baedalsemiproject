package com.orderlist;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


import com.util.DBConn;

public class OrderListDAO {
   private Connection conn = DBConn.getConnection();
   
   public int dataCount(String userId) {
      int result = 0;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      String sql;
      
      try {
         sql = "SELECT NVL(COUNT(*), 0) FROM orderinfo WHERE userId=?";
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, userId);
         
         
         rs = pstmt.executeQuery();
         if(rs.next()) {
            result = rs.getInt(1);
         }
         pstmt.close();
         rs.close();
      } catch (Exception e) {
         System.out.println(e.toString());
      }
      return result;
   }
   public int dataCountAdmin() {
      int result = 0;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      String sql;
      
      try {
         sql = "SELECT NVL(COUNT(*), 0) FROM orderinfo";
         pstmt = conn.prepareStatement(sql);
                  
         rs = pstmt.executeQuery();
         
         if(rs.next()) {
            result = rs.getInt(1);
         }
         pstmt.close();
         rs.close();
      } catch (Exception e) {
         System.out.println(e.toString());
      }
      return result;
   }
   public List<OrderListDTO> orderList(String userId,int start,int end) {
      List<OrderListDTO> list = new ArrayList<>();
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      StringBuffer sb = new StringBuffer();
      
      try {
         sb.append("SELECT * FROM (SELECT ROWNUM rnum, tb.* FROM (SELECT ordernum,created,storeName,REPLACE(menuname,'+','.') menuname,price,payment from orderinfo oi join ceomember2 cm2 on oi.ceoId=cm2.ceoId WHERE userId=? ORDER BY ordernum DESC) tb WHERE ROWNUM <= ?)WHERE rnum >= ?");
         
         pstmt = conn.prepareStatement(sb.toString());
         pstmt.setString(1, userId);
         pstmt.setInt(2, end);
         pstmt.setInt(3, start);
         
         rs = pstmt.executeQuery();
         
         while(rs.next()) {
            
            OrderListDTO dto = new OrderListDTO();
            
            dto.setOrderNum(rs.getInt("ordernum")); 
            dto.setCreated(rs.getString("created"));
            dto.setStoreName(rs.getString("storeName"));
            dto.setMenuName(rs.getString("menuname"));
            dto.setPrice(rs.getInt("price"));
            dto.setPayment(rs.getString("payment"));            
            
            list.add(dto);
         }
         rs.close();
         pstmt.close();
      } catch (Exception e) {
         System.out.println(e.toString());
      }
      return list;
   }
   public List<OrderListDTO> orderListAdmin(int start,int end) {
      List<OrderListDTO> list = new ArrayList<>();
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      StringBuffer sb = new StringBuffer();
      
      try {
         sb.append("SELECT * FROM (SELECT ROWNUM rnum, tb.* FROM (SELECT ordernum,created,storeName,REPLACE(menuname,'+','.') menuname,price,payment from orderinfo oi join ceomember2 cm2 on oi.ceoId=cm2.ceoId ORDER BY ordernum DESC) tb WHERE ROWNUM <= ?)WHERE rnum >= ?");
         
         pstmt = conn.prepareStatement(sb.toString());
         
         pstmt.setInt(1, end);
         pstmt.setInt(2, start);
         
         rs = pstmt.executeQuery();
         
         while(rs.next()) {
            
            OrderListDTO dto = new OrderListDTO();
            
            dto.setOrderNum(rs.getInt("ordernum")); 
            dto.setCreated(rs.getString("created"));
            dto.setStoreName(rs.getString("storeName"));
            dto.setMenuName(rs.getString("menuname"));
            dto.setPrice(rs.getInt("price"));
            dto.setPayment(rs.getString("payment"));            
            
            list.add(dto);
         }
         rs.close();
         pstmt.close();
      } catch (Exception e) {
         System.out.println(e.toString());
      }
      return list;
   }
   public OrderListDTO readOrderlist(int orderNum){
      OrderListDTO dto=null;
      PreparedStatement pstmt=null;
      ResultSet rs=null;
      StringBuffer sb=new StringBuffer();
      
      try {
         sb.append("SELECT ordernum,created,storeName,region,storeAddr,storeTel,REPLACE(menuname,'+','.') menuname,price,payment,adrress,coment from orderinfo oi join ceomember2 cm2 on oi.ceoId=cm2.ceoId WHERE ordernum=?");
         pstmt = conn.prepareStatement(sb.toString());
         pstmt.setInt(1, orderNum);
         rs = pstmt.executeQuery();
         
         if(rs.next()) {
            dto=new OrderListDTO();
            
            dto.setOrderNum(rs.getInt("ordernum"));
            dto.setCreated(rs.getString("created"));
            dto.setStoreName(rs.getString("storeName"));
            dto.setRegion(rs.getString("region"));
            dto.setStoreAddr(rs.getString("storeAddr"));
            dto.setStoreTel(rs.getString("storeTel"));
            dto.setMenuName(rs.getString("menuName"));
            dto.setPrice(rs.getInt("price"));
            dto.setPayment(rs.getString("payment"));
            dto.setAdrress(rs.getString("adrress"));
            dto.setComent(rs.getString("coment"));
            
         }
                  
      } catch (Exception e) {
         System.out.println(e.toString());
      }      
      
      return dto;
   }
   
}