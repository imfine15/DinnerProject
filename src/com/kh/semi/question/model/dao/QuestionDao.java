package com.kh.semi.question.model.dao;
import static com.kh.semi.common.JDBCTemplate.*;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.kh.semi.admin.model.vo.PageInfo;
import com.kh.semi.enterprise.model.vo.EnpAttachment;
import com.kh.semi.notice.model.vo.AdminNoticeAttachment;
import com.kh.semi.notice.model.vo.AdminNoticeVO;
import com.kh.semi.notice.model.vo.NoticeVO;
import com.kh.semi.question.model.vo.QuestionFileVO;
import com.kh.semi.question.model.vo.QuestionVO;

public class QuestionDao {
	
	private Properties prop = new Properties();
	
	public QuestionDao() {

		String fileName = QuestionDao.class.getResource("/sql/question/question-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//문의하기 글 등록용 메소드
	public int insertQuestion(Connection con, QuestionVO question) {

		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertQusetion");
		System.out.println(question.getMemberId());
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, question.getMemberNo());
			pstmt.setString(2, question.getMemberId());
			pstmt.setString(3, question.getMemberName());
			pstmt.setString(4, question.getQuestionType());
			pstmt.setString(5,  question.getQuestionTitle());
			pstmt.setString(6,  question.getQuestionContent());
			pstmt.setString(7,  question.getQuestionEmail());
			pstmt.setString(8,  question.getEmailAdmit());
			pstmt.setString(9,  question.getQuestionPhone());
			pstmt.setString(10,  question.getPhoneAdmit());
			System.out.println(question.getMemberNo());
			result = pstmt.executeUpdate();

			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	//최근 발생한 시퀀스 조회용 메소드
	public String selectCurrval(Connection con) {

		Statement stmt = null;
		ResultSet rset = null;
		String qno = "";

		String query = prop.getProperty("selectCurrval");

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			if(rset.next()) {
				
				int qId= rset.getInt("currval");
				qno = "Q"+qId;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}

		return qno;
	}

	//첨부파일 한 행을 insert할 메소드
	public int insertAttachment(Connection con, QuestionFileVO questionFile) {

		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertAttachment");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, questionFile.getOriginName());
			pstmt.setString(2, questionFile.getChangeName());
			pstmt.setString(3, questionFile.getFilePath());
			pstmt.setString(4, questionFile.getQuestionNo());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}
	
	//문의사항 등록할때 같이 등록되는 문의사항 내역 메소드 
	public int insertQuestionHistory(QuestionVO question, Connection con) {
		
		PreparedStatement pstmt = null;
		int result = 0;

		
		String query = prop.getProperty("insertQuestionHistory");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, question.getQuestionNo());
			pstmt.setString(2, question.getMemberNo());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
		
	}

	//문의사항 목록 관리자페이지에서 보는 메소드 
	public ArrayList<QuestionVO> selectList(Connection con, PageInfo pi) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<QuestionVO> list = null;
		
		String query = prop.getProperty("selectList");
		ArrayList<String> qNo = new ArrayList<String>();
		try {
			pstmt = con.prepareStatement(query);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
			int endRow = startRow + pi.getLimit() - 1;
			
			pstmt.setInt(1,  startRow);
			pstmt.setInt(2,  endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<>();

			while(rset.next()) {
//				QuestionVO q = new QuestionVO();
//				
//				q.setQuestionType(rset.getString("컬럼명"));
//
//				list.add(q);
				qNo.add(rset.getString("QUESTION_NO"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		String que = prop.getProperty("selectQusList");
		
		for(int i = 0; i < qNo.size(); i++) {
			PreparedStatement ps = null;
			ResultSet rs = null;
			try {
				ps = con.prepareStatement(que);
				ps.setString(1, qNo.get(i));

				rs = ps.executeQuery();
				
				QuestionVO q = new QuestionVO();
				if(rs.next()) {
					q.setQuestionNo(rs.getString("SUBSTR(QUESTION_NO,2)"));
					q.setQuestionType(rs.getString("QUESTION_TYPE"));
					q.setQuestionTitle(rs.getString("QUESTION_TITLE"));
					q.setMemberId(rs.getString("MEMBER_ID"));
					q.setQuestionDate(rs.getDate("QUESTION_DATE"));
					q.setQuestionDisposalStatus(rs.getString("QUESTION_DISPOSAL_CODE"));
					
					list.add(q);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				close(ps);
				close(rs);
			}
		}
		return list;
		
	}

	public HashMap<String, Object> selectOne(Connection con, int num) {
	
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		QuestionVO question = null;
		QuestionFileVO attachment = null;
		ArrayList<QuestionFileVO> list = null;
		String qNo = "Q"+num;
		System.out.println("num : " +num);
		
		String query = prop.getProperty("selectOne");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, qNo);
			System.out.println(qNo);
			rset = pstmt.executeQuery();
			System.out.println(query);
			list = new ArrayList<QuestionFileVO>();
	
			if(rset.next()) {
				question = new QuestionVO();
				question.setQuestionNo(rset.getString("QUESTION_NO"));
				question.setQuestionType(rset.getString("QUESTION_TYPE_CODE"));
				question.setQuestionTitle(rset.getString("QUESTION_TITLE"));
				question.setQuestionContent(rset.getString("QUESTION_CONTENT"));
				question.setMemberId(rset.getString("MEMBER_ID"));
				question.setQuestionDate(rset.getDate("QUESTION_DATE"));
				System.out.println(rset.getString("QUESTION_DISPOSAL_CODE"));
				question.setQuestionDisposalStatus(rset.getString("QUESTION_DISPOSAL_CODE"));
				question.setQuestionEmail(rset.getString("QUESTION_EMAIL"));
				question.setQuestionPhone(rset.getString("QUESTION_PHONE"));
				question.setMemberNo(rset.getString("MNO"));
				
				attachment = new QuestionFileVO();
				attachment.setChangeName(rset.getString("CHANGE_NAME"));
				attachment.setFileNo(rset.getString("FILE_NO"));
				attachment.setFilePath(rset.getString("FILE_PATH"));
				attachment.setOriginName(rset.getString("ORIGIN_NAME"));
				
				list.add(attachment);
			}
			
			hmap = new HashMap<>();
			
			hmap.put("question", question);
			hmap.put("list", list);
					
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return hmap;
	}

	public int updateQuestionHistory(Connection con, QuestionVO question) {
		
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("updateQuestionHistory");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1,  question.getQuestionNo());
			pstmt.setString(2, question.getMemberNo());
	System.out.println(question.getMemberNo());
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally {
			close(pstmt);
		}		
		return result;
	}

	public int insertAnswerQuestion(Connection con, QuestionVO question) {
	
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertQuestionAnswer");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, question.getQuestionNo());
			pstmt.setString(2, question.getQuestionTitle());
			pstmt.setString(3,  question.getQuestionContent());
	
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally {
			close(pstmt);
		}		
		return result;
	}


}






