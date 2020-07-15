package com.kh.semi.question.model.service;
import static com.kh.semi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.enterprise.model.vo.EnpAttachment;
import com.kh.semi.question.model.dao.QuestionDao;
import com.kh.semi.question.model.vo.QuestionVO;


public class QuestionService {

	public int insertQuestion(QuestionVO question, ArrayList<EnpAttachment> fileList) {
		
		Connection con = getConnection();
		int result = 0;
		
		int result1 = 0;
		int result2 = 0;
		
		//
		result1 = new QuestionDao().insertQuestion(con, question);

		if(result1 > 0) {
			String qNo = new QuestionDao().selectCurrval(con);
			
			for(int i = 0; i < fileList.size(); i++) {
				fileList.get(i).setQuestionNo(qNo);
				
				result2 += new QuestionDao().insertAttachment(con, fileList.get(i));
			}
		}
		
		if(result1 > 0 && result2 == fileList.size()) {
			commit(con);
			result = 1;
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}
	
	
	
}
