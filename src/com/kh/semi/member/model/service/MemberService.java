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

}
