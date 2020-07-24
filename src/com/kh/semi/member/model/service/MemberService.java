package com.kh.semi.member.model.service;

import static com.kh.semi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.admin.model.vo.PageInfo;
import com.kh.semi.member.model.dao.MemberDao;
import com.kh.semi.member.model.vo.MemberVO;
import com.kh.semi.payment.model.vo.PointVO;
import com.kh.semi.question.model.vo.QuestionVO;

public class MemberService {

	public int insertMember(MemberVO requestMember) {
		Connection con = getConnection();
		int result = new MemberDao().insertMember(con, requestMember);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public MemberVO loginMember(MemberVO requestMember) {
		Connection con = getConnection();
		MemberVO responseMember = new MemberDao().loginMember(con, requestMember);
		
		close(con);
		
		return responseMember;
	}

	public MemberVO selectMember(String mNo) {
		Connection con = getConnection();
		MemberVO selectMember = new MemberDao().selectMember(con, mNo);
		
		close(con);
		
		return selectMember;
	}

	public String checkId(String id) {
		Connection con = getConnection();
		String checkMember = new MemberDao().checkId(con, id);
		
		close(con);
		
		return checkMember;
	}

	public int checkPassword(MemberVO requestMember) {
		Connection con = getConnection();
		int count = new MemberDao().checkPassword(con, requestMember);
		
		close(con);
		
		return count;
	}

	public int withdrawalMember(MemberVO requestMember) {
		Connection con = getConnection();
		int result = new MemberDao().withdrawalMember(con, requestMember);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		return result;
	}

	public int withdrawalHistory(MemberVO requestMember) {
		Connection con = getConnection();
		int result = new MemberDao().withdrawalHistory(con, requestMember);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		return result;
	}

	public ArrayList<PointVO> selectPointHisList(String mNo, PageInfo pi) {
		Connection con = getConnection();
		ArrayList<PointVO> pointList = new MemberDao().selectPointHisList(con, mNo, pi);
		
		close(con);
		return pointList;
	}

	public int getPointListCount(String mNo) {
		Connection con = getConnection();
		int count = new MemberDao().getPointListCount(con, mNo);
		
		close(con);
		return count;
	}

	public ArrayList<QuestionVO> selectInqHistoryList(PageInfo pi, String mNo) {
		Connection con = getConnection();
		ArrayList<QuestionVO> qlist = new MemberDao().selectInqHistoryList(con, pi, mNo);
		
		close(con);
		return qlist;
	}

	public int getInquiryListCount(String mNo) {
		Connection con = getConnection();
		int count = new MemberDao().getInquiryListCount(con, mNo);
		
		close(con);
		return count;
	}

}
