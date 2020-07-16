package com.kh.semi.admin.model.service;

import static com.kh.semi.common.JDBCTemplate.*;
import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.admin.model.dao.AdminDao;
import com.kh.semi.admin.model.vo.PageInfo;
import com.kh.semi.enterprise.model.vo.EnpAttachment;
import com.kh.semi.enterprise.model.vo.EnpUpVo;

public class AdminService {

	public int getListCount() {
		Connection con = getConnection();
		
		int listCount = new AdminDao().getListCount(con);
		
		System.out.println("listCount2 : " + listCount);
		
		close(con);
		
		return listCount;
	}

	public ArrayList<EnpUpVo> selectList(PageInfo pi) {
		Connection con = getConnection();
		
		ArrayList<EnpUpVo> list = new AdminDao().selectEntList(con,pi);
		
		System.out.println("list2 : " + list);
		
		close(con);
		
		return list;
	}

	public EnpUpVo selectOneEnp(String enpNo) {
		Connection con = null;
		
		EnpUpVo enpUp = null;
		
		System.out.println("enpNo2 : " + enpNo);
		
		enpUp = new AdminDao().selectOneEnp(con, enpNo);
		
		System.out.println("enpUp2 : " + enpUp);
	
		return enpUp;
	}

	public EnpAttachment selectOneEnpFile(String enpNo) {
		Connection con = null;
		
		EnpAttachment ea = null;

		ea = new AdminDao().selectOneEnpFile(con, enpNo);
		
		System.out.println("ea2 : " + ea);
	
		return ea;
	}

}
