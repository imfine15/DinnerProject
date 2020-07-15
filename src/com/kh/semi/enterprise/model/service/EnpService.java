package com.kh.semi.enterprise.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.enterprise.model.dao.EnpDao;
import com.kh.semi.enterprise.model.vo.EnpAttachment;
import com.kh.semi.enterprise.model.vo.EnpUpVo;
import com.kh.semi.enterprise.model.vo.EnpVO;

import static com.kh.semi.common.JDBCTemplate.*;

public class EnpService {

   public int insertPartnerEnp(EnpVO requestEnp) {
      Connection con = getConnection();
      
      int result = new EnpDao().insertPartnerEnp1(con,requestEnp);
      
      int result2 = new EnpDao().insertPartnerEnp2(con, requestEnp);
      
      result += result2;
      
      if(result > 1) {
         commit(con);
      }else {
         rollback(con);
      }
      
      close(con);
      
      
      return result;
   }

public int insertEnterprise(EnpUpVo enpUp, ArrayList<EnpAttachment> fileList) {
	Connection con = getConnection();
	int result = 0;
	
	int result1 = 0;
	
	int result2 = 0;
	
	int result3 = 0;
	
	result1 = new EnpDao().insertEnterprise(con, enpUp);
	if(result1 > 0) {
		String enpNo = new EnpDao().selectCurrval(con);
		
		for(int i = 0; i < fileList.size(); i++) {
			fileList.get(i).setEnpNo(enpNo);
			enpUp.setEnpNo(enpNo);
			
			
			result2 += new EnpDao().insertAttachment(con, fileList.get(i));
			
			
		}
		result3 = new EnpDao().insertMenu(con, enpUp);
	}
	
	
	if(result1 > 0 && result3 > 0 && result2 == fileList.size()) {
		commit(con);
		result = 1;
	} else {
		rollback(con);
	}
	
	
	return result;
}

}