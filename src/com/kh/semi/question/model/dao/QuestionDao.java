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
import java.util.Properties;

import com.kh.semi.enterprise.model.vo.EnpAttachment;
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
}
