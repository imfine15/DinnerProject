package com.kh.semi.notice.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.semi.admin.model.vo.PageInfo;
import com.kh.semi.notice.model.dao.NoticeDao;
import com.kh.semi.notice.model.vo.AdminNoticeAttachment;
import com.kh.semi.notice.model.vo.AdminNoticeVO;
import com.kh.semi.notice.model.vo.EntNoticeVO;
import com.kh.semi.notice.model.vo.NoticeAttachment;
import com.kh.semi.notice.model.vo.NoticeVO;
import com.kh.semi.question.model.dao.QuestionDao;

import static com.kh.semi.common.JDBCTemplate.*;

public class NoticeService {

	//admin 개인회원 공지사항 등록용 
	public int insertClientNotice(NoticeVO newNotice) {
		
		Connection con = getConnection();
		
		int result = new NoticeDao().insertClientNotice(con, newNotice);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}
	
	public int getListCount() {
		
		Connection con = getConnection();
		
		int listCount = new NoticeDao().getListCount(con);
		
		close(con);
		
		return listCount;
	}

	//관리자페이지 개인회원 공지사항 리스트 보는 용
	public ArrayList<NoticeVO> selectList(PageInfo pi) {
	Connection con = getConnection();
		
		ArrayList<NoticeVO> list = new NoticeDao().selectList(con, pi);
		
		close(con);
		
		return list;
	}
	
	//개인회원 공지 관리자 상세보기용 
	public NoticeVO selectOne(int cnno) {

		Connection con = getConnection();

		NoticeVO notice = new NoticeDao().selectOne(con, cnno);

		close(con);

		return notice;

	}

	//사이트페이지 member 공지사항 보는 용도 
	public ArrayList<NoticeVO> selectClientNotice(PageInfo pi) {
		
		Connection con = getConnection();
		
		ArrayList<NoticeVO> list = new NoticeDao().selectClientNotice(con, pi);
		
		close(con);
		
		return list;

	}

	//관리자페이지 업체 공지사항 등록용
	public int insertEntNotice(EntNoticeVO eNotice, ArrayList<NoticeAttachment> fileList) {
		
		Connection con = getConnection();
		
		int result = 0;
		int result1 = 0;
		int result2 = 0;
		
		result1 = new NoticeDao().insertEntNotice(con, eNotice);

		if(result1 > 0) {
			
			String noticeNo = new NoticeDao().selectCurrval(con);
			System.out.println(noticeNo);
			System.out.println(fileList);
			for(int i = 0; i < fileList.size(); i++) {
				
				fileList.get(i).setNoticeNo(noticeNo);
				
				result2 += new NoticeDao().insertAttachment(con, fileList.get(i));
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
	
	public int getEntListCount() {
		
		Connection con = getConnection();
		
		int listCount = new NoticeDao().getEntListCount(con);
		
		close(con);
		
		return listCount;
	}

	//어드민 업체 공지사항 목록 조회용 
	public ArrayList<EntNoticeVO> selectEntList(PageInfo pi) {
		
		Connection con = getConnection();
		
		ArrayList<EntNoticeVO> list = new NoticeDao().selectEntList(con, pi);
		
		close(con);
		
		return list;
	}

	//어드민 업체 공지사항 글 조회용 
	public HashMap<String, Object> selectOneEnt(int num) {
		
		Connection con = getConnection();
		
		HashMap<String, Object> hmap = null;
		
		hmap = new NoticeDao().selectEnpNotice(con, num);
		
		if(hmap != null) {
			commit(con);
		} else {
			rollback(con);
			hmap = null;
		}
		
		close(con);
		
		return hmap;
	}

	//관리자페이지 업체공지사항 파일 가져오는 메소드
	public NoticeAttachment selectOneAttachment(int num) {
		
		return null;
	}

	//관리자 공지사항 등록용 메소드
	public int insertAdminNotice(AdminNoticeVO aNotice, ArrayList<AdminNoticeAttachment> fileList) {
	
		Connection con = getConnection();
		
		int result = 0;
		int result1 = 0;
		int result2 = 0;
		
		result1 = new NoticeDao().insertAdminNotice(con, aNotice);

		if(result1 > 0) {
			
			String noticeNo = new NoticeDao().selectAdminCurrval(con);

			System.out.println(fileList);
			for(int i = 0; i < fileList.size(); i++) {
				
				fileList.get(i).setNoticeNo(noticeNo);
				
				result2 += new NoticeDao().insertAdminAttachment(con, fileList.get(i));
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

	//관리자 공지사항 목록 조회하는 메소드
	public ArrayList<AdminNoticeVO> selectAdminList(PageInfo pi) {
		
		Connection con = getConnection();
		
		ArrayList<AdminNoticeVO> list = new NoticeDao().selectAdminList(con, pi);
		
		close(con);
		
		return list;
		
	}

	public HashMap<String, Object> selectOneAdmin(int num) {
	
		Connection con = getConnection();
		
		HashMap<String, Object> hmap = null;
		
		hmap = new NoticeDao().selectAdminNotice(con, num);
		
		if(hmap != null) {
			commit(con);
		} else {
			rollback(con);
			hmap = null;
		}
		
		close(con);
		
		return hmap;
	}

	//업체페이지 공지사항 조회용 메소드
	public ArrayList<EntNoticeVO> selectEntNotice(PageInfo pi) {
		
		Connection con = getConnection();
		
		ArrayList<EntNoticeVO> list = new NoticeDao().selectEntNotice(con, pi);
		
		close(con);
		
		return list;
		
	}
}








