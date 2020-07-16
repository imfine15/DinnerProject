package com.kh.semi.payment.model.service;

import java.net.ConnectException;
import java.sql.Connection;

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

}
