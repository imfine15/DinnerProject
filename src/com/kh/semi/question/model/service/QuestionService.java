package com.kh.semi.question.model.service;
import static com.kh.semi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.semi.admin.model.vo.PageInfo;
import com.kh.semi.enterprise.model.vo.EnpAttachment;
import com.kh.semi.notice.model.dao.NoticeDao;
import com.kh.semi.notice.model.vo.NoticeVO;
import com.kh.semi.question.model.dao.QuestionDao;
import com.kh.semi.question.model.vo.QuestionFileVO;
import com.kh.semi.question.model.vo.QuestionVO;


public class QuestionService {

	public int insertQuestion(QuestionVO question, ArrayList<QuestionFileVO> fileList) {
		
		Connection con = getConnection();
		int result = 0;		
		int result1 = 0;
		int result2 = 0;
		int result3 = 0;
		

		result1 = new QuestionDao().insertQuestion(con, question);

		if(result1 > 0) {

			String questionNo = new QuestionDao().selectCurrval(con);

			for(int i = 0; i < fileList.size(); i++) {

				fileList.get(i).setQuestionNo(questionNo);
				question.setQuestionNo(questionNo);
				result2 += new QuestionDao().insertAttachment(con, fileList.get(i));
			}
		}
		if(result1 > 0 && result2 == fileList.size()) {
			result3 = new QuestionDao().insertQuestionHistory(question, con);

			commit(con);
			result = 1;
		} else {
			rollback(con);
		}

		close(con);

		return result;
	}

	public ArrayList<QuestionVO> selectClientQuestion(PageInfo pi) {
	
		Connection con = getConnection();
		
		ArrayList<QuestionVO> list = new QuestionDao().selectList(con, pi);
		
		close(con);
		
		return list;
	}

	public HashMap<String, Object> selectOne(int num) {
		
		Connection con = getConnection();
		
		HashMap<String, Object> hmap = null;
		
		hmap = new QuestionDao().selectOne(con, num);
		System.out.println(hmap);
		if(hmap != null) {
			commit(con);
		} else {
			rollback(con);
			hmap = null;
		}
		
		close(con);
		
		return hmap;
	}

	public int inserAnswerQuestion(QuestionVO question) {
		
		
		Connection con = getConnection();
		
		int result = new QuestionDao().updateQuestionHistory(con, question);
		int result2 = new QuestionDao().insertAnswerQuestion(con, question);
		
		if(result > 0 && result2 > 0) {
			commit(con);
		} else {
			rollback(con);
		}

		close(con);
		
		return result;
		
		
	}

	
	
	
}
