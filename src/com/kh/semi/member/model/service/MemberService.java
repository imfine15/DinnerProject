package com.kh.semi.member.model.service;

import static com.kh.semi.common.JDBCTemplate.*;

import java.sql.Connection;

import com.kh.semi.member.model.dao.MemberDao;
import com.kh.semi.member.model.vo.MemberVO;

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

	public int withdrawlMember(MemberVO requestMember) {
		Connection con = getConnection();
		int result = new MemberDao().withdrawlMember(con, requestMember);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		return result;
	}

}
