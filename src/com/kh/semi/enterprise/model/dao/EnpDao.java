package com.kh.semi.enterprise.model.dao;

import static com.kh.semi.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.semi.enterprise.model.vo.EnpVO;

public class EnpDao {
Properties prop = new Properties();
	
	public EnpDao() {
		String fileName = EnpDao.class.getResource("/sql/enp/enp-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	

	public int insertPartnerEnp(Connection con, EnpVO requestEnp) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertEnp");
		
		try {
			pstmt = con.prepareStatement(query);
//			아래 입력 내용은 쿼리에 따라 달라질 수 있음
			
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
