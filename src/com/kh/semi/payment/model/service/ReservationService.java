package com.kh.semi.payment.model.service;

import java.net.ConnectException;
import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.payment.model.dao.ReservationDao;
import com.kh.semi.payment.model.vo.ReservationVO;
import static com.kh.semi.common.JDBCTemplate.*;
public class ReservationService {

	public int insertReservation(ReservationVO insertReservationVO) {
		Connection con = getConnection();
		
		int result = new ReservationDao().insertReservation(con, insertReservationVO);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);		
		return result;
	}

	public int insertReservationHistory(ReservationVO insertReservationVO) {
		Connection con = getConnection();
		int sequence = new ReservationDao().selectReservationSequence(con);
		int result = new ReservationDao().insertReservationHistory(con, insertReservationVO, sequence);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		return result;
	}
	
	public ArrayList<ReservationVO> selectReservationList(String mNo) {
		Connection con = getConnection();
		ArrayList<ReservationVO> list = new ReservationDao().selectReservation(con, mNo);
		
		close(con);
		return list;
	}

	public ArrayList<String> selectEnpList(ArrayList<ReservationVO> list) {
		Connection con = getConnection();
		ArrayList<String> enpList = new ReservationDao().selectEnpList(con, list);
		
		close(con);
		return enpList;
	}

	public ArrayList<String> selectStatusList(ArrayList<ReservationVO> list) {
		Connection con = getConnection();
		ArrayList<String> statusList = new ReservationDao().selectStatusList(con, list);
		
		close(con);
		return statusList;
	}

	public String selectEnpName(String eNo) {
		Connection con = getConnection();
		String eName = new ReservationDao().selectEnpName(con, eNo);
		
		close(con);
		
		return eName;
	}

	public int deleteReserInfo(String rNo, String mNo) {
		Connection con = getConnection();
		int result = new ReservationDao().deleteReserInfo(con, rNo, mNo);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		return result;
	}

	public int insertPaymentHistory(String muid, String payprice) {
		Connection con = getConnection();
		int result = new ReservationDao().insertPaymentHistory(con, muid, payprice);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		return result;
	}





}
