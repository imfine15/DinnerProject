package com.kh.semi.member.model.dao;

import static com.kh.semi.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.semi.admin.model.vo.PageInfo;
import com.kh.semi.board.model.vo.BoardUpVo;
import com.kh.semi.board.model.vo.BoardVO;
import com.kh.semi.member.model.vo.MemberVO;
import com.kh.semi.payment.model.vo.PointVO;
import com.kh.semi.question.model.vo.QuestionVO;

public class MemberDao {
	Properties prop = new Properties();
	
	public MemberDao() {
		String fileName = MemberDao.class.getResource("/sql/member/member-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertMember(Connection con, MemberVO requestMember) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertMember");
		
		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, requestMember.getmId());
			pstmt.setString(2, requestMember.getmPwd());
			pstmt.setString(3, requestMember.getmName());
			pstmt.setString(4, requestMember.getmEmail());
			pstmt.setString(5, requestMember.getmPhone());
			pstmt.setString(6, requestMember.getmGender());
			pstmt.setString(7, requestMember.getmNickname());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public MemberVO loginMember(Connection con, MemberVO requestMember) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		MemberVO responseMember = null;
		String query = prop.getProperty("loginMember");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, requestMember.getmId());
			pstmt.setString(2, requestMember.getmPwd());
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				responseMember = new MemberVO();
				responseMember.setmNo(rset.getString("MEMBER_NO"));
				responseMember.setmId(rset.getString("MEMBER_ID"));
				responseMember.setmPwd(rset.getString("MEMBER_PWD"));
				responseMember.setmName(rset.getString("MEMBER_NAME"));
				responseMember.setmEmail(rset.getString("MEMBER_EMAIL"));
				responseMember.setmPhone(rset.getString("MEMBER_PHONE"));
				responseMember.setmGender(rset.getString("MEMBER_GENDER"));
				responseMember.setmNickname(rset.getString("MEMBER_NICKNAME"));
				responseMember.setmGrade(rset.getString("MEMBER_GRADE"));
				responseMember.setStatus(rset.getString("MEMBER_STATUS"));
				responseMember.setNoshowCount(rset.getInt("NOSHOW_COUNT"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return responseMember;
	}

	public MemberVO selectMember(Connection con, String mNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectMember");
		MemberVO selectMember = null;
		
		try {
			selectMember = new MemberVO();
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, mNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				selectMember.setmNo(rset.getString("MEMBER_NO"));
				selectMember.setmId(rset.getString("MEMBER_ID"));
				selectMember.setmPwd(rset.getString("MEMBER_PWD"));
				selectMember.setmName(rset.getString("MEMBER_NAME"));
				selectMember.setmEmail(rset.getString("MEMBER_EMAIL"));
				selectMember.setmPhone(rset.getString("MEMBER_PHONE"));
				selectMember.setmGender(rset.getString("MEMBER_GENDER"));
				selectMember.setmNickname(rset.getString("MEMBER_NICKNAME"));
				selectMember.setmGrade(rset.getString("MEMBER_GRADE"));
				selectMember.setStatus(rset.getString("MEMBER_STATUS"));
				selectMember.setNoshowCount(rset.getInt("NOSHOW_COUNT"));
				selectMember.setFilePath(rset.getString("FILE_PATH"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return selectMember;
	}

	public String checkId(Connection con, String id) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String checkMember = "";
		String query = prop.getProperty("checkId");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, id);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				checkMember = rset.getString("MEMBER_ID");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return checkMember;
	}

	public int checkPassword(Connection con, MemberVO requestMember) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("checkPassword");
		int count = 0;
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, requestMember.getmId());
			pstmt.setString(2, requestMember.getmPwd());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return count;
	}

	public int withdrawalMember(Connection con, MemberVO requestMember) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("withdrawalMember");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, requestMember.getmId());
			pstmt.setString(2, requestMember.getmPwd());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int withdrawalHistory(Connection con, MemberVO requestMember) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("withdrawalHistory");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, requestMember.getmId());
			pstmt.setString(2, requestMember.getmPwd());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<PointVO> selectPointHisList(Connection con, String mNo, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<PointVO> pointList = new ArrayList<>();
		String query = prop.getProperty("selectPointHisList");
		
		try {
			int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
	        int endRow = startRow + pi.getLimit() - 1;
	        
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, mNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				PointVO p = new PointVO();
				p.setmNo(rset.getString("MEMBER_NO"));
				p.setpAmount(rset.getInt("POINT_AMMONT"));
 				p.setPointDate(rset.getTimestamp("POINT_DATE"));
				if(rset.getString("SAVE_CODE") != null) {
					p.setSaveCode(rset.getString("SAVE_CODE"));
				}
				p.setSaveStatue(rset.getString("SAVE_STATUS"));
				pointList.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return pointList;
	}

	public int getPointListCount(Connection con, String mNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("getPointListCount");
		int count = 0;
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, mNo);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				count = rset.getInt("COUNT");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return count;
	}

	public ArrayList<QuestionVO> selectInqHistoryList(Connection con, PageInfo pi, String mNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<QuestionVO> qlist = new ArrayList<>();
		String query = prop.getProperty("selectInqHistoryList");
		
		try {
			int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
	        int endRow = startRow + pi.getLimit() - 1;
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, mNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();

			while(rset.next()) {
				QuestionVO q = new QuestionVO();
				q.setQuestionNo(rset.getString("QUESTION_NO"));
				q.setMemberId(rset.getString("MEMBER_ID"));
				q.setMemberName(rset.getString("MEMBER_NAME"));
				q.setQuestionDate(rset.getDate("QUESTION_DATE"));
				q.setQuestionType(rset.getString("QUESTION_TYPE_CODE"));
				q.setQuestionTitle(rset.getString("QUESTION_TITLE"));
				q.setQuestionContent(rset.getString("QUESTION_CONTENT"));
				q.setQuestionEmail(rset.getString("QUESTION_EMAIL"));
				q.setQuestionPhone(rset.getString("QUESTION_PHONE"));
				q.setQuestionDisposalStatus(rset.getString("QUESTION_DISPOSAL_CODE"));
				q.setDisposalDate(rset.getDate("DISPOSAL_DATE"));
				
				
				qlist.add(q);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return qlist;
	}

	public int getInquiryListCount(Connection con, String mNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("getInquiryListCount");
		int count = 0;
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, mNo);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				count = rset.getInt("COUNT");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return count;
	}

	public int getBoardPostListCount(Connection con, String mNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectPostHistoryList");
		int count = 0;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, mNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("COUNT");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return count;
	}

	public ArrayList<BoardVO> selectPostList(Connection con, String mNo, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectPostHisList");
		ArrayList<BoardVO> blist = new ArrayList<>();
		
		try {
			int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
	        int endRow = startRow + pi.getLimit() - 1;
	        
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, mNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				BoardVO b = new BoardVO();
				b.setBoardNo(rset.getString("BOARD_NO"));
				b.setBoardContent(rset.getString("BOARD_TITLE"));
				b.setViewCount(rset.getInt("VIEW_COUNT"));
				b.setUploadDate(rset.getDate("UPLOAD_DATE"));
				b.setLikeCount(rset.getInt("LIKE_COUNT"));
				b.setStatusName(rset.getString("STATUS_CODE"));
				
				blist.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return blist;
	}

	public int updateMemInfo(Connection con, MemberVO changeMember) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateMemInfo");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, changeMember.getmName());
			pstmt.setString(2, changeMember.getmEmail());
			pstmt.setString(3, changeMember.getmPhone());
			pstmt.setString(4, changeMember.getmNickname());
			pstmt.setString(5, changeMember.getmNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<BoardVO> selectPostReviewsCount(Connection con, ArrayList<BoardVO> blist) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectPostReviewsCount");
		ArrayList<BoardVO> rblist = new ArrayList<>();
		int count = 0;
		try {
			while(true) {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, blist.get(count).getBoardNo());
				
				rset = pstmt.executeQuery();
				if(rset.next()) {
					blist.get(count).setLikeCount(rset.getInt("COUNT"));
					rblist.add(blist.get(count));
				}
				count ++;
				if(blist.size() == count)break;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return rblist;
	}

	
}
