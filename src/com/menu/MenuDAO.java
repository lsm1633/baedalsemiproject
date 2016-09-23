package com.menu;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.util.DBConn;

public class MenuDAO {
	private Connection conn = DBConn.getConnection();
	
	public MenuDTO readMenu(String ceoId) {
		MenuDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			sql = "SELECT ceoId, cate, price, content, imageFilename ";
			sql += "FROM menu WHERE ceoId = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ceoId);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				dto = new MenuDTO();
				dto.setCeoId(rs.getString("ceoId"));
				dto.setCate(rs.getString("cate"));
				dto.setPrice(rs.getInt("price"));
				dto.setContent(rs.getString("content"));
				dto.setImageFilename(rs.getString("imageFilename"));
			}
			
			pstmt.close();
			rs.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}
	
	public int dataCount(String ceoId) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			sql = "SELECT NVL(COUNT(*), 0) FROM menu WHERE ceoId = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ceoId);
			
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
	
	public List<MenuDTO> listMenu(int start, int end, String ceoId) {
		List<MenuDTO> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sb = new StringBuffer();
		
		try {
			sb.append("SELECT * FROM (");
			sb.append("    SELECT ROWNUM rnum, tb.* FROM (");
			sb.append("		SELECT ceoId, cate, name, price, content, imageFilename ");
			sb.append("		FROM menu WHERE ceoId = ?");
			sb.append("		) tb WHERE ROWNUM <= ? ");
			sb.append(") WHERE rnum >= ? ");
			
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setString(1, ceoId);
			pstmt.setInt(2, end);
			pstmt.setInt(3, start);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MenuDTO dto = new MenuDTO();
				dto.setCeoId(rs.getString("ceoId"));
				dto.setCate(rs.getString("cate"));
				dto.setName(rs.getString("name"));
				dto.setPrice(rs.getInt("price"));
				dto.setContent(rs.getString("content"));
				dto.setImageFilename(rs.getString("imageFilename"));
				
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
