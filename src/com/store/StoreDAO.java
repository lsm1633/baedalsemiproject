package com.store;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.util.DBConn;

public class StoreDAO {
	private Connection conn = DBConn.getConnection();
	
	public StoreDTO readStore() {
		StoreDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try { 
			sql = "SELECT storeId, storeName, storeAddr, storeTel, ";
			sql += "imageFilename, region, cate FROM store";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new StoreDTO();
				
				dto.setStoreId(rs.getString("storeId"));
				dto.setStoreName(rs.getString("storeName"));
				dto.setStoreAddr(rs.getString("storeAddr"));
				dto.setStoreTel(rs.getString("storeTel"));
				dto.setImageFilename(rs.getString("imageFilename"));
				dto.setRegion(rs.getString("region"));
				dto.setCate(rs.getString("cate"));
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}
	
	public int dataCount() {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			sql = "SELECT NVL(COUNT(*), 0) FROM store ";
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
	
	public int dataCount(String searchKey, String searchValue) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		//SELECT NVL(COUNT(*), 0) FROM store WHERE region = 'seoul' AND INSTR(storeName, '½ÅÃÌ') >= 1;
		try {
			if(searchKey.equals("all")){
				sql="SELECT NVL(COUNT(*), 0) FROM store WHERE INSTR(storeName, ?) >= 1";
				
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, searchValue);
			} else {
        	sql="SELECT NVL(COUNT(*), 0) FROM store WHERE region = ? AND INSTR(storeName, ?) >= 1";
        	

            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1, searchKey);
            pstmt.setString(2, searchValue);
			}
            rs=pstmt.executeQuery();

            if(rs.next())
                result=rs.getInt(1);
            rs.close();
            pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	public List<StoreDTO> listStore(int start, int end, String cate) {
		List<StoreDTO> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sb = new StringBuffer();
		
		try {
			sb.append("SELECT * FROM (");
			sb.append("    SELECT ROWNUM rnum, tb.* FROM (");
			sb.append("		SELECT storeId, storeName, storeTel, storeAddr, imageFilename ");
			sb.append("		FROM store ORDER BY storeId DESC");
			sb.append("    ) tb WHERE ROWNUM <= ? ");
			sb.append(") WHERE rnum >= ? ");
			
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, end);
			pstmt.setInt(2, start);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				StoreDTO dto = new StoreDTO();
				dto.setStoreId(rs.getString("storeId"));
				dto.setStoreName(rs.getString("storeName"));
				dto.setStoreTel(rs.getString("storeTel"));
				dto.setStoreAddr(rs.getString("storeAddr"));
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
	
	public List<StoreDTO> listStore(int start, int end, String searchKey, String searchValue, String cate) {
		List<StoreDTO> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sb = new StringBuffer();
		
		try {
			if(searchKey.equals("all") && searchValue==null) {
				sb.append("SELECT * FROM (");
				sb.append("    SELECT ROWNUM rnum, tb.* FROM (");
				sb.append("		SELECT storeId, storeName, storeTel, storeAddr, imageFilename ");
				sb.append("		FROM store ORDER BY storeId DESC");
				sb.append("    ) tb WHERE ROWNUM <= ? ");
				sb.append(") WHERE rnum >= ? ");
				
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setInt(1, end);
				pstmt.setInt(2, start);
			} else if(searchKey.equals("all") && searchValue!=null) {
				sb.append("SELECT * FROM (");
				sb.append("    SELECT ROWNUM rnum, tb.* FROM (");
				sb.append("		SELECT storeId, storeName, storeTel, storeAddr, imageFilename ");
				sb.append("		FROM store WHERE INSTR(storeName, ?) >= 1 ORDER BY storeId DESC" );
				sb.append("    ) tb WHERE ROWNUM <= ?");
				sb.append(") WHERE rnum >= ?");
				
				pstmt = conn.prepareStatement(sb.toString());
				
				pstmt.setString(1, searchValue);
				pstmt.setInt(2, end);
				pstmt.setInt(3, start);
			} else if(! searchKey.equals("all") && searchValue.equals("")) {
			sb.append("SELECT * FROM (");
			sb.append("    SELECT ROWNUM rnum, tb.* FROM (");
			sb.append("		SELECT storeId, storeName, storeTel, storeAddr, imageFilename ");
			sb.append("		FROM store WHERE region = ? " );
			sb.append(" ORDER BY storeId DESC");
			sb.append("    ) tb WHERE ROWNUM <= ?");
			sb.append(") WHERE rnum >= ?");
			
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setString(1, searchKey);
			pstmt.setInt(2, end);
			pstmt.setInt(3, start);
			} else {
				sb.append("SELECT * FROM (");
				sb.append("    SELECT ROWNUM rnum, tb.* FROM (");
				sb.append("		SELECT storeId, storeName, storeTel, storeAddr, imageFilename ");
				sb.append("		FROM store WHERE region = ? AND INSTR(storeName, ?) >= 1 " );
				sb.append(" ORDER BY storeId DESC");
				sb.append("    ) tb WHERE ROWNUM <= ?");
				sb.append(") WHERE rnum >= ?");
				
				pstmt = conn.prepareStatement(sb.toString());
				
				pstmt.setString(1, searchKey);
				pstmt.setString(2, searchValue);
				pstmt.setInt(3, end);
				pstmt.setInt(4, start);
			}
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				StoreDTO dto = new StoreDTO();
				dto.setStoreId(rs.getString("storeId"));
				dto.setStoreName(rs.getString("storeName"));
				dto.setStoreTel(rs.getString("storeTel"));
				dto.setStoreAddr(rs.getString("storeAddr"));
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
