package com.kh.semi.enterprise.model.service;

import java.sql.Connection;

import com.kh.semi.enterprise.model.dao.EnpDao;
import com.kh.semi.enterprise.model.vo.EnpVO;

import static com.kh.semi.common.JDBCTemplate.*;

public class EnpService {

	public int insertPartnerEnp(EnpVO requestEnp) {
		Connection con = getConnection();
		
		int result = new EnpDao().insertPartnerEnp(con,requestEnp);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		
		return result;
	}

}
