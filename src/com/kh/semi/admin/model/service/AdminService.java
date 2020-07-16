package com.kh.semi.admin.model.service;

import static com.kh.semi.common.JDBCTemplate.*;
import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.admin.model.dao.AdminDao;
import com.kh.semi.admin.model.vo.PageInfo;
import com.kh.semi.enterprise.model.vo.EnpUpVo;

public class AdminService {

	public int getListCount() {
		Connection con = getConnection();
		
		int listCount = new AdminDao().getListCount(con);
		close(con);
		
		return listCount;
	}

	public ArrayList<EnpUpVo> selectList(PageInfo pi) {
		Connection con = getConnection();
		
		ArrayList<EnpUpVo> list = new AdminDao().selectEntList(con,pi);
		
		close(con);
		
		return list;
	}

}
