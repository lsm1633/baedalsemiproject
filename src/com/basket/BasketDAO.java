package com.basket;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.util.DBConn;

public class BasketDAO {
	private Connection conn = DBConn.getConnection();
	
	public List<BasketDTO> listBasket(String userId, String ceoId) {
		List<BasketDTO> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sb = new StringBuffer();
		
		try {
			sb.append("Select code, userId, ceoId, menuName, price, num ");
			sb.append(" FROM basket WHERE userId = ? AND ceoId = ?");
			
			pstmt= conn.prepareStatement(sb.toString());
			pstmt.setString(1, userId);
			pstmt.setString(2, ceoId);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BasketDTO dto = new BasketDTO();
				
				dto.setCode(rs.getString("code"));
				dto.setUserId(rs.getString("userId"));
				dto.setCeoId(rs.getString("ceoId"));
				dto.setMenuName(rs.getString("menuName"));
				dto.setPrice(rs.getInt("price"));
				dto.setNum(rs.getInt("num"));
				
				list.add(dto);
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}
	
	public int insertBasket(BasketDTO dto) {
		int result = 0;
		PreparedStatement pstmt = null;
		StringBuffer sb = new StringBuffer();
		
		try {
			sb.append("INSERT INTO basket(");
			sb.append("code, userId, ceoId, menuName, price)");
			sb.append(" VALUES(basket_seq.NEXTVAL, ?, ?, ?, ?)");
			
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, dto.getUserId());
			pstmt.setString(2, dto.getCeoId());
			pstmt.setString(3, dto.getMenuName());
			pstmt.setInt(4, dto.getPrice());
			
			result = pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	public int updateBasket(BasketDTO dto) {
		int result = 0;
		PreparedStatement pstmt = null;
		StringBuffer sb = new StringBuffer();
		
		try {
			sb.append("UPDATE basket SET num = num+1 ");
			sb.append("WHERE userId = ? AND ceoId = ? AND menuName = ?");
			
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, dto.getUserId());
			pstmt.setString(2, dto.getCeoId());
			pstmt.setString(3, dto.getMenuName());
			
			result = pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	public int deleteBasket(String userId, String ceoId) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			sql = "DELETE FROM basket WHERE userId = ? AND ceoId = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, ceoId);
			result = pstmt.executeUpdate();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
}
