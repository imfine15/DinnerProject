package com.kh.semi.ad.model.service;

import com.kh.semi.ad.model.dao.PartnerDao;
import com.kh.semi.ad.model.vo.PartnerVO;
import com.kh.semi.admin.model.vo.PageInfo;
import com.kh.semi.notice.model.dao.NoticeDao;
import com.kh.semi.notice.model.vo.NoticeVO;

import static com.kh.semi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

public class PartnerService {

	public int insertPartnerQuestion(PartnerVO partner) {
		
		Connection con = getConnection();
		
		int result = new PartnerDao().insertPartnerQuestion(con, partner);
		
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
		
		int listCount = new PartnerDao().getListCount(con);
		
		close(con);
		
		return listCount;
		
	}

	public ArrayList<PartnerVO> selectList(PageInfo pi) {
		
		Connection con = getConnection();
		
		ArrayList<PartnerVO> list = new PartnerDao().selectList(con, pi);
		
		close(con);
		
		return list;
	}

	public PartnerVO selectOne(int pNo) {
		
		Connection con = getConnection();

		PartnerVO partner = new PartnerDao().selectOne(con, pNo);

		close(con);

		return partner;
	}

}
