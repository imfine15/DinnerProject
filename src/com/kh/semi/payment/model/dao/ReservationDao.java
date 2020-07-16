package com.kh.semi.payment.model.dao;

import java.sql.Statement;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.semi.payment.model.vo.ReservationVO;
import static com.kh.semi.common.JDBCTemplate.*;
public class ReservationDao {
	private Properties prop = new Properties();
	
	public ReservationDao() {
		String fileName = ReservationDao.class.getResource("/sql/reservation/reservation-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public int insertReservation(Connection con, ReservationVO insertReservationVO) {
		//System.out.println(insertReservationVO);
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertReservation");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setTimestamp(1, insertReservationVO.getrDate());
			pstmt.setString(2, insertReservationVO.getmNo());
			pstmt.setString(3, insertReservationVO.geteNo());
			pstmt.setString(4, insertReservationVO.getcNo());
			pstmt.setString(5, insertReservationVO.getRqMemo());
			pstmt.setInt(6, insertReservationVO.getpAmount());
			pstmt.setInt(7, insertReservationVO.getPeople());
			pstmt.setInt(8, insertReservationVO.getDeposit());
			
			result = pstmt.executeUpdate();
			
			if(result > 0) {
				commit(con);
			} else {
				rollback(con);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int insertReservationHistory(Connection con, ReservationVO insertReservationVO) {
		PreparedStatement pstmt= null;
		Statement stmt = null;
		int result = 0;
		String query = prop.getProperty("insertReservationHistory");
		String query2 = prop.getProperty("selectSequence");
		ResultSet rset = null;
		System.out.println(query2);
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			if(rset.next()) {
				System.out.println(rset.getString("LAST_NUMBER - 1"));
			}
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, insertReservationVO.getPeople());
			pstmt.setTimestamp(2, insertReservationVO.getrDate());
			pstmt.setInt(3, insertReservationVO.getDeposit());
			pstmt.setString(4, insertReservationVO.getmNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<ReservationVO> selectReservation(Connection con, String mNo) {
		ArrayList<ReservationVO> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectReservationList");
		
		return null;
	}



}
