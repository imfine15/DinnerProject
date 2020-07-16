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
		
		close(con);		
		return result;
	}

	public int insertReservationHistory(ReservationVO insertReservationVO) {
		Connection con = getConnection();
		
		int result = new ReservationDao().insertReservationHistory(con, insertReservationVO);
		
		close(con);
		return result;
	}
	
	public ArrayList<ReservationVO> selectReservationList(String mNo) {
		Connection con = getConnection();
		ArrayList<ReservationVO> list = new ReservationDao().selectReservation(con, mNo);
		
		close(con);
		return list;
	}





}
