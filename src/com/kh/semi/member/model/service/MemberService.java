package com.kh.semi.member.model.service;

import static com.kh.semi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;

import com.kh.semi.admin.model.vo.PageInfo;
import com.kh.semi.board.model.vo.BoardUpVo;
import com.kh.semi.board.model.vo.BoardVO;
import com.kh.semi.member.model.dao.MemberDao;
import com.kh.semi.member.model.vo.MemberAdminVo;
import com.kh.semi.member.model.vo.MemberVO;
import com.kh.semi.payment.model.vo.PointVO;
import com.kh.semi.question.model.vo.QuestionVO;
import com.kh.semi.review.model.vo.ReviewAttachment;

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

	public int getBoardPostListCount(String mNo) {
		Connection con = getConnection();
		int count = new MemberDao().getBoardPostListCount(con, mNo);
		
		close(con);
		return count;
	}

	public ArrayList<BoardVO> selectPostList(String mNo, PageInfo pi) {
		Connection con = getConnection();
		ArrayList<BoardVO> blist = new MemberDao().selectPostList(con, mNo, pi);
		
		close(con);
		return blist;
	}

	public int updateMemInfo(MemberVO changeMember) {
		Connection con = getConnection();
		int result = new MemberDao().updateMemInfo(con, changeMember);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		return result;
	}

	public ArrayList<BoardVO> selectPostReviewsCount(ArrayList<BoardVO> blist) {
		Connection con = getConnection();
		ArrayList<BoardVO> result = new MemberDao().selectPostReviewsCount(con, blist);
		
		return result;
	}

	public int changePwd(String changePwd, String mNo) {
		Connection con = getConnection();
		int result = new MemberDao().changePwd(con, changePwd, mNo);
		
		if(result > 0 ) {
			commit(con);
		} else {
			rollback(con);
		}
		return result;
	}

	public int changeMemberImg(ReviewAttachment ra) {
		Connection con = getConnection();
		int result = new MemberDao().changeMemberImg(con, ra);
		
		if(result > 0 ) {
			commit(con);
		} else {
			rollback(con);
		}
		return result;
	}

	public int getListCount() {
		Connection con = getConnection();
		int result = new MemberDao().getListCount(con);
		
		close(con);
		return result;
	}

	public ArrayList<MemberAdminVo> selectMember(PageInfo pi) {
		Connection con = getConnection();
		ArrayList<MemberAdminVo> list = new MemberDao().selectMemberAdmin(con, pi);
		int result1 = 0;
		Date result2 = null;
		Date result3 = null;
		
		for(int i = 0; i <list.size(); i++) {
			result1 = new MemberDao().selectReservationCount(con, list.get(i).getMemberNo());
			result2 = new MemberDao().selectVisitDate(con, list.get(i).getMemberNo());
			result3 = new MemberDao().selectReservationDate(con, list.get(i).getMemberNo());
			
			list.get(i).setReservationCount(result1);
			list.get(i).setVisitDate(result2);
			list.get(i).setReservationDate(result3);
			
		}
		
		
		
		
		
		close(con);
		
		return list;
	}

	public int countMember() {
		Connection con = getConnection();
		
		int result = new MemberDao().selectMemberCount(con);
		close(con);
		
		return result;
	}

//	public MemberAdminVo selectOneMem(String memberNo) {
//		Connection con = getConnection();
//		
//		MemberAdminVo member = new MemberDao().selectOneMem(con, memberNo);
//		
//		close(con);
//		return member;
//	}

}
