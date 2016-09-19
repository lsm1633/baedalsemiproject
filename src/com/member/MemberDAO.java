package com.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.util.DBConn;

public class MemberDAO {
	
	private Connection conn = DBConn.getConnection();
	
	//회원가입폼
	public int insertMember(MemberDTO dto){
		int result = 0;
		PreparedStatement pstmt = null;
	    StringBuffer sb = new StringBuffer();
	    
	    try {
	    	//member1 테이블 입력
			sb.append("INSERT INTO member1(userId, userName, userPwd)");
			sb.append(" VALUES(?,?,?)");
			
			pstmt=conn.prepareStatement(sb.toString());
	        pstmt.setString(1, dto.getUserId());
	        pstmt.setString(2, dto.getUserName());
	        pstmt.setString(3, dto.getUserPwd());
	        
	        pstmt.executeUpdate();
	        pstmt.close();
	        pstmt=null;
	        
	        
	        //member2 테이블 입력
	        sb = new StringBuffer();      //스트링 버퍼 초기화
			sb.append("INSERT INTO member2(userId, email, tel, addr1, addr2)");
			sb.append(" VALUES(?,?,?,?,?)");
			
			pstmt=conn.prepareStatement(sb.toString());
	        pstmt.setString(1, dto.getUserId());
	        pstmt.setString(2, dto.getEmail());
	        pstmt.setString(3, dto.getTel());
	        pstmt.setString(4, dto.getAddr1());
	        pstmt.setString(5, dto.getAddr2());
	        
	        pstmt.executeUpdate();
	        pstmt.close();
	        pstmt=null;
	         
	        result = 1;		//정상적으로 작성하게 되면 result가 1이됨.
	         
	         
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;		//1을 return하면 회원가입폼 정상작성.
	}
	
	//아이디 중복체크
	public int idChk(String userId){
		PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    
	    int check = 0;
	    
	    String sql=null;
	    
	    try {
			sql = "SELECT COUNT(userId) as cnt FROM member1 WHERE userId=?";
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userId);
		    rs = pstmt.executeQuery();
		    
		    if(rs.next()==true){
		    	check = rs.getInt("cnt");
		    }
		    
		    rs.close();
			pstmt.close();
		    
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	    
	    return check;
	}
	
	//정보를 가져옴.
	 public MemberDTO readMember(String userId){
		 MemberDTO dto = null;
		 
		 PreparedStatement pstmt = null;
		 ResultSet rs = null;
		 
		 StringBuffer sb = new StringBuffer();
		 
		 try {
			sb.append("SELECT m1.userId, userName, userPwd, enabled, created_date, modify_date,");
			sb.append(" email, tel, addr1, addr2");
			sb.append(" FROM member1 m1");
			sb.append(" LEFT OUTER JOIN member2 m2 ON m1.userId=m2.userId");
			sb.append(" WHERE m1.userId = ?");
			
			pstmt=conn.prepareStatement(sb.toString());
			   
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				dto = new MemberDTO();
				dto.setUserId(rs.getString("userId"));
				dto.setUserName(rs.getString("userName"));
				dto.setUserPwd(rs.getString("userPwd"));
				dto.setEnabled(rs.getInt("enabled"));
				   
				dto.setCreated_date(rs.getString("created_date"));
				dto.setModify_date(rs.getString("modify_date"));
				
				dto.setEmail(rs.getString("email"));
				dto.setTel(rs.getString("tel"));
				dto.setAddr1(rs.getString("addr1"));
				dto.setAddr2(rs.getString("addr2"));
			}
			rs.close();
			pstmt.close();
			   
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		 
		 return dto;
	 }
	
	

}
