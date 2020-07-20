package com.kh.semi.enterprise.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.enterprise.model.dao.EnpDao;
import com.kh.semi.enterprise.model.vo.EnpAttachment;
import com.kh.semi.enterprise.model.vo.EnpUpVo;
import com.kh.semi.enterprise.model.vo.EnpVO;
import com.kh.semi.enterprise.model.vo.ForCmVO;
import com.kh.semi.enterprise.model.vo.ForEntCrVO;
import com.kh.semi.enterprise.model.vo.PageInfo;
import com.kh.semi.payment.model.vo.ReservationVO;

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
	
	public EnpVO loginCheck(EnpVO requestEnp) {
		Connection con = getConnection();
		
		EnpVO loginEnp = new EnpDao().loginCheck(con, requestEnp);
		
		close(con);
		
		return loginEnp;
	}
	
	public ArrayList<ReservationVO> selectCRList(PageInfo pi, String enp) {
		Connection con = getConnection();
		
		ArrayList<ReservationVO> requestReserve = new EnpDao().selectCRList(con,pi,enp); 
		
		close(con);
		
		System.out.println("service : "+requestReserve);
		return requestReserve;
	}
	
	public int getListCount() {
		Connection con = getConnection();
		
		int listCount = new EnpDao().getListCount(con);
		
		close(con);
		
		return listCount;
	}
	
	public ArrayList<ForEntCrVO> selectCRModalList(String memId) {
		Connection con = getConnection();
		
		ArrayList<ForEntCrVO> modalList = new EnpDao().selectCRModalList(con,memId);
		
		close(con);
		
		return modalList;
	}
	
	public String selectCRMemId(String enp) {
		Connection con = getConnection();
		
		String modalId = new EnpDao().selectCRMemId(con,enp);
		
		close(con);
		
		return modalId;
	}
	
	public ArrayList<Integer> selectCRCount(String countId, String enp) {
		Connection con = getConnection();
		
		ArrayList<Integer> count = new EnpDao().selectCRCount(con,countId,enp);
		
		close(con);
		
		return count;
	}
	
	public EnpVO selectEnp(String enpNo) {
		Connection con = getConnection();
		EnpVO selectedEnp = new EnpDao().selectEnp(con, enpNo);
		
		close(con);
		
		return selectedEnp;
	}

	public ArrayList<ForCmVO> selectCmList(String enp) {
		Connection con = getConnection();
		
		ArrayList<ForCmVO> list = null;
		
		list = new EnpDao().selectCmMemberVal(con, enp);
		
		close(con);
		
		return list;
	}

}