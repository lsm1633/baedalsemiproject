package com.ceomember;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.util.DBConn;

public class CeoMemberDAO {
   private Connection conn=DBConn.getConnection();
   
   public int insertCeoMember(CeoMemberDTO dto){
      int result=0;
      PreparedStatement pstmt=null;
      StringBuffer sb=new StringBuffer();
      
      try {
    	  if(dto.getCeoTel1().length()!=0&&dto.getCeoTel2().length()!=0&&dto.getCeoTel3().length()!=0)
    		  dto.setCeoTel(dto.getCeoTel1()+"-"+dto.getCeoTel2()+"-"+dto.getCeoTel3());

    	  if(dto.getCeoBirth1().length()!=0&&dto.getCeoBirth2().length()!=0&&dto.getCeoBirth3().length()!=0)
    		  dto.setCeoBirth(dto.getCeoBirth1()+"-"+dto.getCeoBirth2()+"-"+dto.getCeoBirth3());

    	  if(dto.getCeoEmail1().length()!=0&&dto.getCeoEmail2().length()!=0)
    		  dto.setCeoEmail(dto.getCeoEmail1()+"@"+dto.getCeoEmail2());

    	  dto.setStoreAddr(dto.getStoreAddr2());

    	  if(dto.getStoreAddr1().equals("서울")) {
    		  dto.setRegion("Seoul");
    	  } else if(dto.getStoreAddr1().equals("경기")) {
    		  dto.setRegion("Gyeonggi");
    	  } else if(dto.getStoreAddr1().equals("인천")) {
    		  dto.setRegion("Incheon");
    	  }

    	  sb.append("INSERT INTO ceomember1(ceoId,ceoPwd,askPwd,ansPwd,ceoName,ceoBirth,ceoEmail,ceoTel) VALUES(?,?,?,?,?,?,?,?)");
    	  pstmt=conn.prepareStatement(sb.toString());

    	  pstmt.setString(1, dto.getCeoId());
    	  pstmt.setString(2, dto.getCeoPwd());
    	  pstmt.setString(3, dto.getAskPwd());
    	  pstmt.setString(4, dto.getAnsPwd());
    	  pstmt.setString(5, dto.getCeoName());
    	  pstmt.setString(6, dto.getCeoBirth());
    	  pstmt.setString(7, dto.getCeoEmail());
    	  pstmt.setString(8, dto.getCeoTel());


    	  pstmt.executeUpdate();
    	  pstmt.close();
    	  pstmt=null;

    	  sb=new StringBuffer();

    	  sb.append("INSERT INTO ceomember2(ceoId,storeName,ceoCodeNum,storeAddr,storeTel,storeType,storePhoto,region) VALUES(?,?,?,?,?,?,?,?)");
    	  pstmt=conn.prepareStatement(sb.toString());

    	  pstmt.setString(1, dto.getCeoId());
    	  pstmt.setString(2, dto.getStoreName());
    	  pstmt.setString(3, dto.getCeoCodeNum());
    	  pstmt.setString(4, dto.getStoreAddr());
    	  pstmt.setString(5, dto.getStoreTel());
    	  pstmt.setString(6, dto.getStoreType());
    	  pstmt.setString(7, dto.getStorePhoto());
    	  pstmt.setString(8, dto.getRegion());

    	  pstmt.executeUpdate();
    	  pstmt.close();
    	  pstmt=null;
    	  result=1;
      } catch (Exception e) {
    	  System.out.println(e.toString());
      }

      return result;
   }
   
   public CeoMemberDTO readMemberid(String ceoId){
      CeoMemberDTO dto=null;
      
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      StringBuffer sb = new StringBuffer();
      
      try {
         sb.append("SELECT cm1.ceoId,askPwd,ansPwd,enabled,ceoName,ceoPwd,TO_CHAR(ceoBirth, 'YYYY-MM-DD') ceoBirth,ceoEmail,ceoTel,"
         		+ "storeName,ceoCodeNum,storeAddr,storeTel,storeType,storePhoto,region "
               + "FROM ceomember1 cm1 LEFT OUTER JOIN ceomember2 cm2 ON cm1.ceoId=cm2.ceoId WHERE cm1.ceoId=?");
         
         pstmt=conn.prepareStatement(sb.toString());
            
         pstmt.setString(1, ceoId);
         rs = pstmt.executeQuery();
         
         if(rs.next()){
            dto=new CeoMemberDTO();
            
            dto.setCeoId(rs.getString("ceoId"));
            dto.setCeoName(rs.getString("ceoName"));
            dto.setCeoPwd(rs.getString("ceoPwd"));
            dto.setAskPwd(rs.getString("askPwd"));
            dto.setAnsPwd(rs.getString("ansPwd"));
            dto.setEnabled(rs.getInt("enabled"));
            dto.setCeoBirth(rs.getString("ceoBirth"));
            dto.setCeoEmail(rs.getString("ceoEmail"));
            dto.setCeoTel(rs.getString("ceoTel"));
            dto.setStoreName(rs.getString("storeName"));
            dto.setCeoCodeNum(rs.getString("ceoCodeNum"));
            dto.setStoreAddr(rs.getString("storeAddr"));
            dto.setStoreTel(rs.getString("storeTel"));
            dto.setStoreType(rs.getString("storeType"));
            dto.setStorePhoto(rs.getString("storePhoto"));
            dto.setRegion(rs.getString("region"));
         }
         rs.close();
         pstmt.close();
         
      } catch (Exception e) {
         System.out.println(e.toString());
      }
      
      return dto;
   }
   public CeoMemberDTO readMembernum(String ceoCodeNum){
      CeoMemberDTO dto=null;
      
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      StringBuffer sb = new StringBuffer();
      
      try {
         sb.append("SELECT cm1.ceoId,askPwd,ansPwd,enabled,ceoName,ceoPwd,TO_CHAR(ceoBirth, 'YYYY-MM-DD') ceoBirth,ceoEmail,ceoTel,storeName,ceoCodeNum,storeAddr,storeTel,storeType,storePhoto,region "
               + "FROM ceomember1 cm1 LEFT OUTER JOIN ceomember2 cm2 ON cm1.ceoId=cm2.ceoId WHERE ceoCodeNum=?");
         
         pstmt=conn.prepareStatement(sb.toString());
            
         pstmt.setString(1, ceoCodeNum);
         rs = pstmt.executeQuery();
         
         if(rs.next()){
            dto=new CeoMemberDTO();
            
            dto.setCeoId(rs.getString("ceoId"));
            dto.setCeoName(rs.getString("ceoName"));
            dto.setCeoPwd(rs.getString("ceoPwd"));
            dto.setAskPwd(rs.getString("askPwd"));
            dto.setAnsPwd(rs.getString("ansPwd"));
            dto.setEnabled(rs.getInt("enabled"));
            dto.setCeoBirth(rs.getString("ceoBirth"));
            dto.setCeoEmail(rs.getString("ceoEmail"));
            dto.setCeoTel(rs.getString("ceoTel"));
            dto.setStoreName(rs.getString("storeName"));
            dto.setCeoCodeNum(rs.getString("ceoCodeNum"));
            dto.setStoreAddr(rs.getString("storeAddr"));
            dto.setStoreTel(rs.getString("storeTel"));
            dto.setStoreType(rs.getString("storeType"));
            dto.setStorePhoto(rs.getString("storePhoto"));
            dto.setRegion(rs.getString("region"));
         }
         rs.close();
         pstmt.close();
         
      } catch (Exception e) {
         System.out.println(e.toString());
      }
      
      return dto;
   }
   
   public int updateCeoMember(CeoMemberDTO dto) {
	   int result=0;
	   PreparedStatement pstmt=null;
	   String sql;
	   
	   try {
		   if(dto.getCeoTel1().length()!=0&&dto.getCeoTel2().length()!=0&&dto.getCeoTel3().length()!=0)
			   dto.setCeoTel(dto.getCeoTel1()+"-"+dto.getCeoTel2()+"-"+dto.getCeoTel3());

		   if(dto.getCeoBirth1().length()!=0&&dto.getCeoBirth2().length()!=0&&dto.getCeoBirth3().length()!=0)
			   dto.setCeoBirth(dto.getCeoBirth1()+"-"+dto.getCeoBirth2()+"-"+dto.getCeoBirth3());

		   if(dto.getCeoEmail1().length()!=0&&dto.getCeoEmail2().length()!=0)
			   dto.setCeoEmail(dto.getCeoEmail1()+"@"+dto.getCeoEmail2());	  
		   
		   sql="UPDATE ceomember1 SET ceoPwd=?, askPwd=?, ansPwd=?, "
		   		+ "ceoName=?, ceoTel=?, ceoBirth=?, ceoEmail=? WHERE ceoId=?";
		   
		   pstmt=conn.prepareStatement(sql);
		   
		   pstmt.setString(1, dto.getCeoPwd());
		   pstmt.setString(2, dto.getAskPwd());
		   pstmt.setString(3, dto.getAnsPwd());
		   pstmt.setString(4, dto.getCeoName());
		   pstmt.setString(5, dto.getCeoTel());
		   pstmt.setString(6, dto.getCeoBirth());
		   pstmt.setString(7, dto.getCeoEmail());
		   pstmt.setString(8, dto.getCeoId()); 
		   
		   result=pstmt.executeUpdate();
		   pstmt.close();
		   pstmt=null;
		   
	   } catch (Exception e) {
		   System.out.println(e.toString());
	   }   
	   
	   return result;
   }   
   
   public int updateStoreInfo(CeoMemberDTO dto) {
	   int result=0;
	   PreparedStatement pstmt=null;
	   String sql;
	  	   
	   try {		
		   sql="UPDATE ceomember2 SET storeName=?, ceoCodeNum=?, storeTel=?, "
		   		+ "storeType=?, storeAddr=?, storePhoto=?, region=? WHERE ceoId=?";
		   
		   pstmt=conn.prepareStatement(sql);
		   
		   pstmt.setString(1, dto.getStoreName());
		   pstmt.setString(2, dto.getCeoCodeNum());
		   pstmt.setString(3, dto.getStoreTel());
		   pstmt.setString(4, dto.getStoreType());
		   pstmt.setString(5, dto.getStoreAddr());
		   pstmt.setString(6, dto.getStorePhoto());
		   pstmt.setString(7, dto.getRegion());
		   pstmt.setString(8, dto.getCeoId());
		   
		   result=pstmt.executeUpdate();
		   pstmt.close();
		   
	   } catch (Exception e) {
		   System.out.println(e.toString());
	   }   
	   
	   return result;
   }
   
   public CeoMemberDTO findMemberid(String ceoName,String ceoTel){
       CeoMemberDTO dto=null;
       
       PreparedStatement pstmt = null;
       ResultSet rs = null;
       StringBuffer sb = new StringBuffer();
       
       try {
          sb.append("SELECT ceoId,enabled FROM ceomember1 WHERE ceoName=? AND ceoTel=?");
          
          pstmt=conn.prepareStatement(sb.toString());
             
          pstmt.setString(1, ceoName);
          pstmt.setString(2, ceoTel);
          rs = pstmt.executeQuery();
          
          if(rs.next()){
             dto=new CeoMemberDTO();
             
             dto.setCeoId(rs.getString("ceoId"));
             dto.setEnabled(rs.getInt("enabled"));
             
          }
          rs.close();
          pstmt.close();
          
       } catch (Exception e) {
          System.out.println(e.toString());
       }
       
       return dto;
    }
 
       public CeoMemberDTO findMemberpwd1(String ceoId,String ceoName){
       CeoMemberDTO dto=null;
       
       PreparedStatement pstmt = null;
       ResultSet rs = null;
       StringBuffer sb = new StringBuffer();
       
       try {
          sb.append("SELECT enabled,askPwd FROM ceomember1 WHERE ceoId=? AND ceoName=?");
          
          pstmt=conn.prepareStatement(sb.toString());
             
          pstmt.setString(1, ceoId);
          pstmt.setString(2, ceoName);
          rs = pstmt.executeQuery();
          
          if(rs.next()){
             dto=new CeoMemberDTO();               
             
             dto.setEnabled(rs.getInt("enabled"));
             dto.setAskPwd(rs.getString("askPwd"));
             
          }
          rs.close();
          pstmt.close();
          
       } catch (Exception e) {
          System.out.println(e.toString());
       }
       
       return dto;
    }
 
       public CeoMemberDTO findMemberpwd2(String ansPwd){
       CeoMemberDTO dto=null;
       
       PreparedStatement pstmt = null;
       ResultSet rs = null;
       StringBuffer sb = new StringBuffer();
       
       try {
          sb.append("SELECT ceoId,ceoPwd,ceoName,enabled,askPwd,ansPwd FROM ceomember1 WHERE ansPwd=?");
          
          pstmt=conn.prepareStatement(sb.toString());
             
          pstmt.setString(1, ansPwd);
          
          rs = pstmt.executeQuery();
          
          if(rs.next()){
             dto=new CeoMemberDTO();               
             
             dto.setCeoId(rs.getString("ceoId"));
             dto.setCeoPwd(rs.getString("ceoPwd"));
             dto.setCeoName(rs.getString("ceoName"));               
             dto.setEnabled(rs.getInt("enabled"));
             dto.setAskPwd(rs.getString("askPwd"));
             dto.setAnsPwd(rs.getString("ansPwd"));
             
          }
          rs.close();
          pstmt.close();
          
       } catch (Exception e) {
          System.out.println(e.toString());
       }
       
       return dto;
    }
       public int updatePwd(CeoMemberDTO dto){
          int result=0;
          PreparedStatement pstmt = null;
          String sql;
          try {
             sql="UPDATE ceomember1 SET ceoPwd=? WHERE ceoId=?";
             pstmt=conn.prepareStatement(sql);
       
          pstmt.setString(1, dto.getCeoPwd());
          pstmt.setString(2, dto.getCeoId());
          
          result=pstmt.executeUpdate();
          pstmt.close();
          pstmt = null;
       
          result = 1;
       
          } catch (Exception e) {
       System.out.println(e.toString());
          }
                      
          return result;
       }
       public int deleteMember(String ceoId){
  		 int result = 0;
  		 PreparedStatement pstmt=null;
  		 String sql;
  		 
  		 try {
  			 sql = "UPDATE ceomember1 SET enabled=0 WHERE ceoId=?";
  			 
  			 pstmt = conn.prepareStatement(sql);
  			 
  			 pstmt.setString(1, ceoId);
  			 result = pstmt.executeUpdate();
  			 
  			 pstmt.close();
  			 pstmt = null;
  			
  		} catch (Exception e) {
  			System.out.println(e.toString());
  		}
  		 
  		 return result;
  	 }
   
}