package com.kh.semi.question.model.dao;
import static com.kh.semi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import com.kh.semi.enterprise.model.vo.EnpAttachment;
import com.kh.semi.question.model.vo.QuestionVO;

public class QuestionDao {
	
	private Properties prop = new Properties();
	
	public int 
	
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
	public int selectCurrval(Connection con) {

		Statement stmt = null;
		ResultSet rset = null;
		int bid = 0;

		String query = prop.getProperty("selectCurrval");

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			if(rset.next()) {
				bid= rset.getInt("currval");
			}

			bid = rset.getInt("currval");

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}


		return bid;
	}

	//첨부파일 한 행을 insert할 메소드
	public int insertAttachment(Connection con, EnpAttachment enpAttachment) {

		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertAttachment");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, attachment.getBid());
			pstmt.setString(2, attachment.getOriginName());
			pstmt.setString(3, attachment.getChangeName());
			pstmt.setString(4, attachment.getFilePath());
			pstmt.setInt(5, attachment.getFileLevel());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}
}
