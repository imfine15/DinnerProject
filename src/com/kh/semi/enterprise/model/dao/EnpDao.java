package com.kh.semi.enterprise.model.dao;

import static com.kh.semi.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.semi.enterprise.model.vo.EnpUpVo;
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
   

   public int insertPartnerEnp1(Connection con, EnpVO requestEnp) {
      PreparedStatement pstmt = null;
      int result = 0;
      String query = prop.getProperty("insertPartnerEnp1");
      
      try {
         pstmt = con.prepareStatement(query);
//         아래 입력 내용은 쿼리에 따라 달라질 수 있음
         /*--ENP_NO
         --ENP_NAME
         --ENP_PHONE
         --ENP_ADDRESS
         --ENP_HOUR
         --ENP_TYPE
         --ENP_STATUS*/
         
         pstmt.setString(1, requestEnp.getEnpName());
         pstmt.setString(2, requestEnp.getEnpPhone());
         pstmt.setString(3, requestEnp.getEnpAddress());
         pstmt.setString(4, requestEnp.getEnpType());
         pstmt.setString(5, "주차가능");
         
         
         result = pstmt.executeUpdate();
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(pstmt);
      }
      
      return result;
   }

//가게정보업로드
public int insertEnterprise(Connection con, EnpUpVo enpUp) {
	PreparedStatement pstmt = null;
	int result = 0;
	String query = prop.getProperty("insertEnterprise");
	
	try {
		pstmt = con.prepareStatement(query);
		pstmt.setString(1, enpUp.getEnpName());
		pstmt.setString(2, enpUp.getEnpPhone());
		ps
		
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	return result;
}

}