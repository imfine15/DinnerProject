package com.kh.semi.notice.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.admin.model.vo.PageInfo;
import com.kh.semi.notice.model.dao.ClientNoticeDao;
import com.kh.semi.notice.model.vo.NoticeVO;

import static com.kh.semi.common.JDBCTemplate.*;

public class ClientNoticeService {

	//admin 개인회원 공지사항 등록용 
	public int insertClientNotice(NoticeVO newNotice) {
		
		Connection con = getConnection();
		
		int result = new ClientNoticeDao().insertClientNotice(con, newNotice);
		
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
		
		int listCount = new ClientNoticeDao().getListCount(con);
		
		close(con);
		
		return listCount;
	}

	//관리자페이지 개인회원 공지사항 리스트 보는 용
	public ArrayList<NoticeVO> selectList(PageInfo pi) {
	Connection con = getConnection();
		
		ArrayList<NoticeVO> list = new ClientNoticeDao().selectList(con, pi);
		
		close(con);
		
		return list;
	}
	
	//개인회원 공지 관리자 상세보기용 
	public NoticeVO selectOne(int cnno) {

		Connection con = getConnection();

		NoticeVO notice = new ClientNoticeDao().selectOne(con, cnno);

		close(con);

		return notice;

	}

	//사이트페이지 member 공지사항 보는 용도 
	public ArrayList<NoticeVO> selectClientNotice(PageInfo pi) {
		
		Connection con = getConnection();
		
		ArrayList<NoticeVO> list = new ClientNoticeDao().selectClientNotice(con, pi);
		
		close(con);
		
		return list;

	}
}
