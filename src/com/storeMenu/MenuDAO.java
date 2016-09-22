package com.storeMenu;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.util.DBConn;

public class MenuDAO {

	private Connection conn=DBConn.getConnection();
	
	
	public int insertMenu(MenuDTO dto){
		int result=0;
		
		PreparedStatement pstmt=null;
		String sql;
		
		String fields = "num, ceoId, cate,name,content,price,imageFilename";
		sql = "INSERT INTO menu ("+fields+")";
		sql += " VALUES (menu_seq.NEXTVAL,?,?,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getCeoId());
			pstmt.setString(2, dto.getCate());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getContent());
			pstmt.setInt(5, dto.getPrice());
			pstmt.setString(6, dto.getImageFilename());
			
			result = pstmt.executeUpdate();
			pstmt.close();

			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
		
	}
	
	public int dataCount(String ceoId){
		int result=0;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql;
		
		try {
			sql = "SELECT NVL(COUNT(*),0) FROM menu WHERE ceoId=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ceoId);
			
			rs=pstmt.executeQuery();
			if(rs.next())
				result=rs.getInt(1);
			rs.close();
			pstmt.close();
			
			rs=null;
			pstmt=null;
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
		
	}
	
	public List<MenuDTO> listMenu(int start, int end, String ceoId){
		
		List<MenuDTO> list = new ArrayList<MenuDTO>();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		StringBuffer sb=new StringBuffer();
		
		try {
			
			sb.append("SELECT * FROM (");
			sb.append("		SELECT ROWNUM rnum, tb.* FROM (");
			sb.append("			SELECT num, c.ceoId,cate,name,content,price,imageFilename");
			sb.append("			FROM menu m");
			sb.append("			JOIN ceomember1 c ON m.ceoId = c.ceoId");
			sb.append("			WHERE c.ceoId = ?");
			sb.append("			ORDER BY num DESC");
			sb.append("		) tb WHERE ROWNUM <=? ");
			sb.append(") WHERE rnum>=?");
			
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, ceoId);
			pstmt.setInt(2, end);
			pstmt.setInt(3, start);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				MenuDTO dto = new MenuDTO();
				dto.setNum(rs.getInt("num"));
				dto.setCeoId(ceoId);
				dto.setCate(rs.getString("cate"));
				dto.setName(rs.getString("name"));
				dto.setContent(rs.getString("content"));
				dto.setPrice(rs.getInt("price"));
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
	
	public MenuDTO readMenu(int num){
		MenuDTO dto = null;
		
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		StringBuffer sb=new StringBuffer();
		
		try {
			sb.append("SELECT num, m.ceoId,cate,name,content,price,imageFilename,");
			sb.append(" TO_CHAR(created, 'YYYY-MM-DD') created");
			sb.append(" FROM menu m");
			sb.append(" JOIN ceomember1 c ON m.ceoId = c.ceoId");
			sb.append(" WHERE num=?");
			
			pstmt=conn.prepareStatement(sb.toString());
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				dto = new MenuDTO();
				
				dto.setNum(rs.getInt("num"));
				dto.setCeoId(rs.getString("ceoId"));
				dto.setCate(rs.getString("cate"));
				dto.setName(rs.getString("name"));
				dto.setContent(rs.getString("content"));
				dto.setPrice(rs.getInt("price"));
				dto.setImageFilename(rs.getString("imageFilename"));
				dto.setCreated(rs.getString("created"));
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
	}
	
	public int updateMenu(MenuDTO dto){
		int result=0;
		PreparedStatement pstmt=null;
		StringBuffer sb=new StringBuffer();
		
		try {
			sb.append("UPDATE menu SET cate=?, name=?, price=?, content=?, imageFilename=?");
			sb.append(" WHERE num=?");
			
			pstmt=conn.prepareStatement(sb.toString());
			
			pstmt.setString(1, dto.getCate());
			pstmt.setString(2, dto.getName());
			pstmt.setInt(3, dto.getPrice());
			pstmt.setString(4, dto.getContent());
			pstmt.setString(5, dto.getImageFilename());
			pstmt.setInt(6, dto.getNum());
			
			result=pstmt.executeUpdate();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	public int deleteMenu(int num){
		int result=0;
		PreparedStatement pstmt=null;
		String sql;
		
		try {
			sql = "DELETE FROM menu WHERE num=?";
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			result=pstmt.executeUpdate();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	
	
}
