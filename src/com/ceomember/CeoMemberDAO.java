package com.ceomember;

import java.sql.Connection;
import java.sql.PreparedStatement;

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
			
			sb.append("INSERT INTO ceomember1(ceoId,ceoPwd,ceoName,ceoBirth,ceoEmail,ceoTel) VALUES(?,?,?,?,?,?)");
			pstmt=conn.prepareStatement(sb.toString());
			
			pstmt.setString(1, dto.getCeoId());
			pstmt.setString(2, dto.getCeoPwd());
			pstmt.setString(3, dto.getCeoName());
			pstmt.setString(4, dto.getCeoBirth());
			pstmt.setString(5, dto.getCeoEmail());
			pstmt.setString(6, dto.getCeoTel());
			
			
			pstmt.executeUpdate();
			pstmt.close();
			pstmt=null;
			
			sb=new StringBuffer();
			
			sb.append("INSERT INTO ceomember2(ceoId,storeName,ceoCodeNum,storeTel,storeType) VALUES(?,?,?,?,?)");
			pstmt=conn.prepareStatement(sb.toString());
			
			pstmt.setString(1, dto.getCeoId());
			pstmt.setString(2, dto.getStoreName());
			pstmt.setString(3, dto.getCeoCodeNum());
			pstmt.setString(4, dto.getStoreTel());
			pstmt.setString(5, dto.getStoreType());
			
			pstmt.executeUpdate();
			pstmt.close();
			pstmt=null;
			result=1;
		} catch (Exception e) {
			System.out.println(e.toString());
		}
				
		return result;
	}

}
