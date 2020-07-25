package com.kh.semi.manager.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.admin.model.vo.PageInfo;
import com.kh.semi.manager.model.dao.ManagerDao;
import com.kh.semi.manager.model.vo.ManagerVo;

import static com.kh.semi.common.JDBCTemplate.*;

public class ManagerService {
	
	public int insertManager(ManagerVo manager) {
		
		Connection con = getConnection();
		int result = new ManagerDao().insertManager(con, manager);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		return result;
	}

	public int getListCount() {
		Connection con = getConnection();
		int result = new ManagerDao().getListCount(con);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		return result;
	}

	public ArrayList<ManagerVo> selectList(PageInfo pi) {
		Connection con = getConnection();
		ArrayList<ManagerVo> list = new ManagerDao().selectList(con, pi);
		
		
		
		return list;
	}

	public int deleteManager(ManagerVo manager) {
		Connection con = getConnection();
		int result = 0;
		result = new ManagerDao().deleteManager(con, manager);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		return result;
	}
	
	
	
	
}
