package com.kh.semi.admin.model.service;

import static com.kh.semi.common.JDBCTemplate.*;
import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.admin.model.dao.AdminDao;
import com.kh.semi.admin.model.vo.PageInfo;
import com.kh.semi.enterprise.model.dao.EnpDao;
import com.kh.semi.enterprise.model.vo.EnpAttachment;
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

	public EnpUpVo selectOneEnp(String enpNo) {
		Connection con = getConnection();
		
		EnpUpVo enpUp = null;
		
		
		
		enpUp = new AdminDao().selectOneEnp(con, enpNo);
		
		close(con);
	
		return enpUp;
	}

	public EnpAttachment selectOneEnpFile(String enpNo) {
		Connection con = getConnection();
		
		EnpAttachment ea = null;

		ea = new AdminDao().selectOneEnpFile(con, enpNo);
		
		close(con);
		return ea;
	}

	public int updateEnterprise(EnpUpVo enpUp, ArrayList<EnpAttachment> fileList) {
		Connection con = getConnection();
		
		int result = 0;
		
		int result1 = 0;
		
		int result2 = 0;
		
		int result3 = 0;
		
		
		result1 = new AdminDao().updateEnterprise(con, enpUp);
		if(result1 > 0) {
			String enpNo = enpUp.getEnpNo();
			
			for(int i = 0; i < fileList.size(); i++) {
				fileList.get(i).setEnpNo(enpNo);
				
				result2 += new AdminDao().updateAttachment(con, fileList.get(i));
				
				
			}
			result3 = new AdminDao().updateMenu(con, enpUp);
		}
		System.out.println("fileListSize : " + fileList.size());
		
		System.out.println("result1 : " + result1 + ", result2 : " + result2 + ", result3 : " + result3);
		if(result1 > 0 && result3 > 0 && result2 == fileList.size()) {
			commit(con);
			result = 1;
		} else {
			rollback(con);
		}
		
		close(con);
		return result;
		
	}

	public int deleteEnterprise(EnpUpVo enpUp) {
		Connection con = getConnection();
		
		int result = 0;
		
		int result1 = 0;
		
		int result2 = 0;
		
		int result3 = 0;
		
		result2 = new AdminDao().deleteAttachment(con, enpUp);
		result3 = new AdminDao().deleteMenu(con, enpUp);
		if(result2 > 0 && result3 > 0) {
			result1 = new AdminDao().deleteEnterprise(con, enpUp);
			
		}
		
		
		
		if(result1 > 0 && result2 >0 && result3 > 0) {
			commit(con);
			result = 1;
		} else {
			rollback(con);
		}
		close(con);
		return result;
	}

	

}
