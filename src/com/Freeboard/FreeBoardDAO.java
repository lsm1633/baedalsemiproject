package com.Freeboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.Freeboard.ReplyDTO;
import com.util.DBConn;

public class FreeBoardDAO {
	private Connection conn=DBConn.getConnection();
	
	public int maxBoardNum() {
		int result=0;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql;
		
		try {
			sql="SELECT NVL(MAX(boardNum), 0) FROM board";
			pstmt=conn.prepareStatement(sql);
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
	
	public int insertBoard(FreeBoardDTO dto, String mode) {
		int result=0;
		PreparedStatement pstmt=null;
		String sql;
		
		int maxNum=maxBoardNum()+1;
		dto.setBoardNum(maxNum);
		
		if(mode.equals("created")) { // 글쓰기
			dto.setGroupNum(maxNum);
			dto.setOrderNo(0);
			dto.setDepth(0);
			dto.setParent(0);
		} else {  // 답변 달기
			updateOrderNo(dto.getGroupNum(), dto.getOrderNo());
			
			dto.setDepth(dto.getDepth() + 1);
			dto.setOrderNo(dto.getOrderNo() + 1);
		}
		
		try {
			sql="INSERT INTO board(boardNum, userId, ";
			sql+="subject, content, groupNum, orderNo, ";
			sql+="depth, parent) VALUES(?,?,?,?,?,?,?,?)";
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getBoardNum());
			pstmt.setString(2, dto.getUserId());
			pstmt.setString(3, dto.getSubject());
			pstmt.setString(4, dto.getContent());
			pstmt.setInt(5, dto.getGroupNum());
			pstmt.setInt(6, dto.getOrderNo());
			pstmt.setInt(7, dto.getDepth());
			pstmt.setInt(8, dto.getParent());
			
			result=pstmt.executeUpdate();
			pstmt.close();
			pstmt=null;
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	public int dataCount() {
		int result=0;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql;
		
		try {
			sql="SELECT NVL(COUNT(*), 0) FROM board";
			pstmt=conn.prepareStatement(sql);
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
	
	// 검색 에서 전체의 개수
    public int dataCount(String searchKey, String searchValue) {
        int result=0;
        PreparedStatement pstmt=null;
        ResultSet rs=null;
        String sql;

        try {
        	if(searchKey.equals("created"))
        		sql="SELECT NVL(COUNT(*), 0) FROM board b JOIN member1 m ON b.userId=m.userId WHERE TO_CHAR(created, 'YYYY-MM-DD') = ?  ";
        	else if(searchKey.equals("userName"))
        		sql="SELECT NVL(COUNT(*), 0) FROM board b JOIN member1 m ON b.userId=m.userId WHERE INSTR(userName, ?) = 1 ";
        	else
        		sql="SELECT NVL(COUNT(*), 0) FROM board b JOIN member1 m ON b.userId=m.userId WHERE INSTR(" + searchKey + ", ?) >= 1 ";

            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1, searchValue);

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
	
	public List<FreeBoardDTO> listBoard(int start, int end) {
		List<FreeBoardDTO> list=new ArrayList<FreeBoardDTO>();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		StringBuffer sb=new StringBuffer();
		
		try {
			sb.append("SELECT * FROM (");
			sb.append("    SELECT ROWNUM rnum, tb.* FROM (");
			sb.append("         SELECT boardNum, b.userId, userName,");
			sb.append("               subject, groupNum, orderNo, depth, hitCount,");
			sb.append("               created");
			sb.append("               FROM board b");
			sb.append("               JOIN member1 m ON b.userId=m.userId");
			sb.append("               ORDER BY groupNum DESC, orderNo ASC ");
			sb.append("    ) tb WHERE ROWNUM <= ? ");
			sb.append(") WHERE rnum >= ? ");

			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, end);
			pstmt.setInt(2, start);

			rs=pstmt.executeQuery();
			
			while (rs.next()) {
				FreeBoardDTO dto=new FreeBoardDTO();
				dto.setBoardNum(rs.getInt("boardNum"));
				dto.setUserId(rs.getString("userId"));
				dto.setUserName(rs.getString("userName"));
				dto.setSubject(rs.getString("subject"));
				dto.setGroupNum(rs.getInt("groupNum"));
				dto.setDepth(rs.getInt("depth"));
				dto.setOrderNo(rs.getInt("orderNo"));
				dto.setHitCount(rs.getInt("hitCount"));
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
	
	// 검색에서 리스트
    public List<FreeBoardDTO> listBoard(int start, int end, String searchKey, String searchValue) {
        List<FreeBoardDTO> list=new ArrayList<FreeBoardDTO>();

        PreparedStatement pstmt=null;
        ResultSet rs=null;
        StringBuffer sb = new StringBuffer();

        try {
			sb.append("SELECT * FROM (");
			sb.append("    SELECT ROWNUM rnum, tb.* FROM (");
			sb.append("         SELECT boardNum, b.userId, userName,");
			sb.append("               subject, groupNum, orderNo, depth, hitCount,");
			sb.append("               created");
			sb.append("               FROM board b");
			sb.append("               JOIN member1 m ON b.userId=m.userId");
			if(searchKey.equals("created"))
				sb.append("           WHERE TO_CHAR(created, 'YYYY-MM-DD') = ? ");
			else if(searchKey.equals("userName"))
				sb.append("           WHERE INSTR(userName, ?) = 1 ");
			else
				sb.append("           WHERE INSTR(" + searchKey + ", ?) >= 1 ");
			
			sb.append("               ORDER BY groupNum DESC, orderNo ASC ");
			sb.append("    ) tb WHERE ROWNUM <= ?");
			sb.append(") WHERE rnum >= ?");
            
			pstmt=conn.prepareStatement(sb.toString());
            
			pstmt.setString(1, searchValue);
			pstmt.setInt(2, end);
			pstmt.setInt(3, start);
            
            rs=pstmt.executeQuery();
            
            while(rs.next()) {
                FreeBoardDTO dto=new FreeBoardDTO();
				dto.setBoardNum(rs.getInt("boardNum"));
				dto.setUserId(rs.getString("userId"));
				dto.setUserName(rs.getString("userName"));
				dto.setSubject(rs.getString("subject"));
				dto.setGroupNum(rs.getInt("groupNum"));
				dto.setDepth(rs.getInt("depth"));
				dto.setOrderNo(rs.getInt("orderNo"));
				dto.setHitCount(rs.getInt("hitCount"));
				dto.setCreated(rs.getString("created"));
            
                list.add(dto);
            }
            rs.close();
            pstmt.close();
        }catch (Exception e) {
            System.out.println(e.toString());
        }
        return list;
    }
	
	public FreeBoardDTO readBoard(int boardNum) {
		FreeBoardDTO dto=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		StringBuffer sb=new StringBuffer();
		
		try {
			sb.append("SELECT boardNum, b.userId, userName, subject, ");
			sb.append("    content, created, hitCount, groupNum, depth, orderNo, parent ");
			sb.append("    FROM board b");
			sb.append("    JOIN member1 m ON b.userId=m.userId");
			sb.append("    WHERE boardNum=?");
			
			pstmt=conn.prepareStatement(sb.toString());
			pstmt.setInt(1, boardNum);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				dto=new FreeBoardDTO();
				dto.setBoardNum(rs.getInt("boardNum"));
				dto.setUserId(rs.getString("userId"));
				dto.setUserName(rs.getString("userName"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setGroupNum(rs.getInt("groupNum"));
				dto.setDepth(rs.getInt("depth"));
				dto.setOrderNo(rs.getInt("orderNo"));
				dto.setParent(rs.getInt("parent"));
				dto.setHitCount(rs.getInt("hitCount"));
				dto.setCreated(rs.getString("created"));
			}
			rs.close();
			pstmt.close();
					
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
	}
	
    // 이전글
    public FreeBoardDTO preReadBoard(int groupNum, int orderNo, String searchKey, String searchValue) {
        FreeBoardDTO dto=null;

        PreparedStatement pstmt=null;
        ResultSet rs=null;
        StringBuffer sb = new StringBuffer();

        try {
            if(searchValue!=null && searchValue.length() != 0) {
                sb.append("SELECT ROWNUM, tb.* FROM ( ");
                sb.append("  SELECT boardNum, subject  ");
    			sb.append("               FROM board b");
    			sb.append("               JOIN member1 m ON b.userId=m.userId");
    			if(searchKey.equals("created"))
    				sb.append("           WHERE (TO_CHAR(created, 'YYYY-MM-DD') = ? ) AND ");
    			else if(searchKey.equals("userName"))
    				sb.append("           WHERE (INSTR(userName, ?) = 1 ) AND ");
    			else
    				sb.append("           WHERE (INSTR(" + searchKey + ", ?) >= 1 ) AND ");
    			
                sb.append("     (( groupNum = ? AND orderNo < ?) ");
                sb.append("         OR (groupNum > ? )) ");
                sb.append("         ORDER BY groupNum ASC, orderNo DESC) tb WHERE ROWNUM = 1 ");

                pstmt=conn.prepareStatement(sb.toString());
                
                pstmt.setString(1, searchValue);
                pstmt.setInt(2, groupNum);
                pstmt.setInt(3, orderNo);
                pstmt.setInt(4, groupNum);
			} else {
                sb.append("SELECT ROWNUM, tb.* FROM ( ");
                sb.append("     SELECT boardNum, subject FROM board b JOIN member1 m ON b.userId=m.userId ");                
                sb.append("  WHERE (groupNum = ? AND orderNo < ?) ");
                sb.append("         OR (groupNum > ? ) ");
                sb.append("         ORDER BY groupNum ASC, orderNo DESC) tb WHERE ROWNUM = 1 ");

                pstmt=conn.prepareStatement(sb.toString());
                pstmt.setInt(1, groupNum);
                pstmt.setInt(2, orderNo);
                pstmt.setInt(3, groupNum);
			}

            rs=pstmt.executeQuery();

            if(rs.next()) {
                dto=new FreeBoardDTO();
                dto.setBoardNum(rs.getInt("boardNum"));
                dto.setSubject(rs.getString("subject"));
            }
            rs.close();
            pstmt.close();
        } catch (Exception e) {
            System.out.println(e.toString());
        }
    
        return dto;
    }

    // 다음글
    public FreeBoardDTO nextReadBoard(int groupNum, int orderNo, String searchKey, String searchValue) {
        FreeBoardDTO dto=null;

        PreparedStatement pstmt=null;
        ResultSet rs=null;
        StringBuffer sb = new StringBuffer();

        try {
            if(searchValue!=null && searchValue.length() != 0) {
                sb.append("SELECT ROWNUM, tb.* FROM ( ");
                sb.append("  SELECT boardNum, subject ");
    			sb.append("               FROM board b");
    			sb.append("               JOIN member1 m ON b.userId=m.userId");
    			if(searchKey.equals("created"))
    				sb.append("           WHERE (TO_CHAR(created, 'YYYY-MM-DD') = ? ) AND ");
    			else if(searchKey.equals("userName"))
    				sb.append("           WHERE (INSTR(userName, ?) = 1) AND ");
    			else
    				sb.append("           WHERE (INSTR(" + searchKey + ", ?) >= 1) AND ");
    			
                sb.append("     (( groupNum = ? AND orderNo > ?) ");
                sb.append("         OR (groupNum < ? )) ");
                sb.append("         ORDER BY groupNum DESC, orderNo ASC) tb WHERE ROWNUM = 1 ");

                pstmt=conn.prepareStatement(sb.toString());
                pstmt.setString(1, searchValue);
                pstmt.setInt(2, groupNum);
                pstmt.setInt(3, orderNo);
                pstmt.setInt(4, groupNum);

			} else {
                sb.append("SELECT ROWNUM, tb.* FROM ( ");
                sb.append("     SELECT boardNum, subject FROM board b JOIN member1 m ON b.userId=m.userId ");
                sb.append("  WHERE (groupNum = ? AND orderNo > ?) ");
                sb.append("         OR (groupNum < ? ) ");
                sb.append("         ORDER BY groupNum DESC, orderNo ASC) tb WHERE ROWNUM = 1 ");

                pstmt=conn.prepareStatement(sb.toString());
                pstmt.setInt(1, groupNum);
                pstmt.setInt(2, orderNo);
                pstmt.setInt(3, groupNum);
            }

            rs=pstmt.executeQuery();

            if(rs.next()) {
                dto=new FreeBoardDTO();
                dto.setBoardNum(rs.getInt("boardNum"));
                dto.setSubject(rs.getString("subject"));
            }
            rs.close();
            pstmt.close();
        } catch (Exception e) {
            System.out.println(e.toString());
        }

        return dto;
    }
    
	public int updateHitCount(int boardNum) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		
		sql = "UPDATE board SET hitCount=hitCount+1 WHERE boardNum=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNum);
			result = pstmt.executeUpdate();
			
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}
    
	// 답변일 경우 orderNo 변경
	public int updateOrderNo(int groupNum, int orderNo) {
		int result = 0;
		PreparedStatement pstmt=null;
		String sql;
		
		sql = "UPDATE board SET orderNo=orderNo+1 ";
		sql+="  WHERE groupNum = ? AND orderNo > ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, groupNum);
			pstmt.setInt(2, orderNo);
			result = pstmt.executeUpdate();
			
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	public int updateBoard(FreeBoardDTO dto) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		
		sql="UPDATE board SET subject=?, content=? ";
		sql+= " WHERE boardNum=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getSubject());
			pstmt.setString(2, dto.getContent());
			pstmt.setInt(3, dto.getBoardNum());
			result = pstmt.executeUpdate();
			
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	public int deleteBoard(int boardNum) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		
		sql="DELETE FROM board WHERE boardNum IN (SELECT boardNum FROM board START WITH  boardNum = ? CONNECT BY PRIOR boardNum = parent)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNum);
			result = pstmt.executeUpdate();
			
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	// 리플 ==========================
		// 데이터 추가
		public int insertReply(ReplyDTO dto) {
			int result=0;
			PreparedStatement pstmt=null;
			StringBuffer sb=new StringBuffer();
			
			try {
				sb.append("INSERT INTO bbsReply(replyNum, boardNum, userId, userName, content) ");
				sb.append(" VALUES (bbsReply_seq.NEXTVAL, ?, ?, ?, ?)");
				
				pstmt=conn.prepareStatement(sb.toString());
				pstmt.setInt(1, dto.getBoardNum());
				pstmt.setString(2, dto.getUserId());
				pstmt.setString(3, dto.getUserName());
				pstmt.setString(4, dto.getContent());
				
				result=pstmt.executeUpdate();
				
			} catch (Exception e) {
				System.out.println(e.toString());
			} finally {
				if(pstmt!=null)
					try {
						pstmt.close();
					} catch (SQLException e) {
					}
			}
			
			return result;
		}
		
		public int dataCountReply(int boardNum) {
			int result=0;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			String sql;
			
			try {
				sql="SELECT NVL(COUNT(*), 0) FROM bbsReply WHERE boardNum=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, boardNum);
				
				rs=pstmt.executeQuery();
				if(rs.next())
					result=rs.getInt(1);
				
			} catch (Exception e) {
				System.out.println(e.toString());
			} finally {
				if(rs!=null) {
					try {
						rs.close();
					} catch (SQLException e) {
					}
				}
					
				if(pstmt!=null) {
					try {
						pstmt.close();
					} catch (SQLException e) {
					}
				}
			}
			
			return result;
		}

		public List<ReplyDTO> listReply(int boardNum, int start, int end) {
			List<ReplyDTO> list=new ArrayList<>();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			StringBuffer sb=new StringBuffer();
			
			try {
				sb.append("SELECT * FROM (");
				sb.append("    SELECT ROWNUM rnum, tb.* FROM (");
				sb.append("        SELECT replyNum, boardNum, b.userId, b.userName, content");
				sb.append("            ,TO_CHAR(created, 'YYYY-MM-DD') created");
				sb.append("            FROM bbsReply b JOIN member1 m ON b.userId=m.userId  ");
				sb.append("            WHERE boardNum=?");
				sb.append("	       ORDER BY replyNum DESC");
				sb.append("    ) tb WHERE ROWNUM <= ? ");
				sb.append(") WHERE rnum >= ? ");

				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setInt(1, boardNum);
				pstmt.setInt(2, end);
				pstmt.setInt(3, start);

				rs=pstmt.executeQuery();
				
				while(rs.next()) {
					ReplyDTO dto=new ReplyDTO();
					
					dto.setReplyNum(rs.getInt("replyNum"));
					dto.setBoardNum(rs.getInt("boardNum"));
					dto.setUserId(rs.getString("userId"));
					dto.setUserName(rs.getString("userName"));
					dto.setContent(rs.getString("content"));
					dto.setCreated(rs.getString("created"));
					
					list.add(dto);
				}
				
			} catch (Exception e) {
				System.out.println(e.toString());
			} finally {
				if(rs!=null) {
					try {
						rs.close();
					} catch (SQLException e) {
					}
				}
					
				if(pstmt!=null) {
					try {
						pstmt.close();
					} catch (SQLException e) {
					}
				}
			}
			return list;
		}

		public int deleteReply(int replyNum) {
			int result = 0;
			PreparedStatement pstmt = null;
			String sql;
			
			sql="DELETE FROM bbsReply WHERE replyNum=?";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, replyNum);
				result = pstmt.executeUpdate();
			} catch (Exception e) {
				System.out.println(e.toString());
			} finally {
				if(pstmt!=null) {
					try {
						pstmt.close();
					} catch (SQLException e) {
					}
				}
			}		
			return result;
		}
		
	}