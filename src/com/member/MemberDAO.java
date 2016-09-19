package com.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.util.DBConn;

public class MemberDAO {
	
	private Connection conn = DBConn.getConnection();
	
	//ȸ��������
	public int insertMember(MemberDTO dto){
		int result = 0;
		PreparedStatement pstmt = null;
	    StringBuffer sb = new StringBuffer();
	    
	    try {
	    	//member1 ���̺� �Է�
			sb.append("INSERT INTO member1(userId, userName, userPwd)");
			sb.append(" VALUES(?,?,?)");
			
			pstmt=conn.prepareStatement(sb.toString());
	        pstmt.setString(1, dto.getUserId());
	        pstmt.setString(2, dto.getUserName());
	        pstmt.setString(3, dto.getUserPwd());
	        
	        pstmt.executeUpdate();
	        pstmt.close();
	        pstmt=null;
	        
	        
	        //member2 ���̺� �Է�
	        sb = new StringBuffer();      //��Ʈ�� ���� �ʱ�ȭ
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
	         
	        result = 1;		//���������� �ۼ��ϰ� �Ǹ� result�� 1�̵�.
	         
	         
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;		//1�� return�ϸ� ȸ�������� �����ۼ�.
	}
	
	//���̵� �ߺ�üũ
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
	
	//������ ������.
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
