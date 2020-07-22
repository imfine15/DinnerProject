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
	
	public ArrayList<Integer> selectCRCount(String countId, String enp, ArrayList<ReservationVO> checkCountList) {
		Connection con = getConnection();
		ArrayList<Integer> count = new ArrayList<Integer>();
		for(ReservationVO v : checkCountList) {
			
			String mNo = v.getmNo();
			
			int a = new EnpDao().selectCRCount(con,countId,enp, mNo);
			
			count.add(a);
		}
		
		
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
		ArrayList<ForCmVO> cmList = null;
		
		list = new EnpDao().selectCmMemberVal(con, enp);
		cmList = new EnpDao().selectCmFilePath(con,list);
		
		close(con);
		
		return cmList;
	}

	public int insertComment(String reviewNum,String comment, String enpNo) {
		Connection con = getConnection();
		
		int result = new EnpDao().insertComment(con,reviewNum,comment,enpNo);
		
		int result2 = new EnpDao().updateReplyStatus(con,reviewNum);
		
		if(result > 0 && result2 > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public String getEnpFile(String enpNo) {
		Connection con = getConnection();
		String filePath = new EnpDao().getEnpFile(con, enpNo);
		
		close(con);
		
		return filePath;
	}

	public int selectCRRownum(String enp) {
		Connection con = getConnection();
		
		//int rownum = new EnpDao().selectCRRownum(con,enp);
		
		return 0;
	}

	public String checkId(String id) {
		Connection con = getConnection();
		String checkEnp = new EnpDao().checkId(con, id);
		
		close(con);
		
		return checkEnp;
	}
	
	public ArrayList<ReservationVO> selectRDList(PageInfo pi, String enp, String requestDay) {
		Connection con = getConnection();
		
		ArrayList<ReservationVO> requestReserve = new EnpDao().selectRDList(con,pi,enp,requestDay); 
		
		close(con);
		
		System.out.println("service : "+requestReserve);
		return requestReserve;
	}
	
}