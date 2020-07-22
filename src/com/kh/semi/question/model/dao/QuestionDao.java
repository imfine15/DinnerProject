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
import java.util.Properties;

import com.kh.semi.admin.model.vo.PageInfo;
import com.kh.semi.enterprise.model.vo.EnpAttachment;
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
			
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, question.getMemberNo());
			pstmt.setString(2, question.getMemberName());
			pstmt.setString(3, question.getQuestionType());
			pstmt.setString(4,  question.getQuestionTitle());
			pstmt.setString(5,  question.getQuestionContent());
			pstmt.setString(6,  question.getQuestionEmail());
			pstmt.setString(7,  question.getEmailAdmit());
			pstmt.setString(8,  question.getQuestionPhone());
			pstmt.setString(9,  question.getPhoneAdmit());
			pstmt.setString(10, question.getMemberId());
			
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

			System.out.println(question.getQuestionNo());
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
					q.setQuestionDate(rs.getDate("QUESTION_DATE"));
					q.setQuestionNo(rs.getString("QUESTION_NO"));
					q.setQuestionTitle(rs.getString("QUESTION_TITLE"));
					q.setMemberId(rs.getString("MEMBER_ID"));
					q.setQuestionDisposalStatus(rs.getString("QUESTION_DISPOSAL_STATUS"));
					q.setQuestionType(rs.getString("QUESTION_TYPE"));
				}
				list.add(q);
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


}
