package com.kh.semi.enterprise.model.dao;

import static com.kh.semi.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.semi.enterprise.model.vo.EnpAttachment;
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
   
   //제휴업체 회원가입 일반enterprise에 정보 기입
   public int insertPartnerEnp1(Connection con, EnpVO requestEnp) {
      PreparedStatement pstmt = null;
      int result = 0;
      String query = prop.getProperty("insertPartnerEnp1");
      
      try {
         pstmt = con.prepareStatement(query);
//         아래 입력 내용은 쿼리에 따라 달라질 수 있음
         /*
         ENP_NO, ENP_NAME, ENP_PHONE, ENP_ADDRESS, ENP_HOUR, ENP_TYPE, 
         ENP_STATUS, ENP_PARTNER_TYPE,PRICE_RANGE,CLOSED_DAY,WEBSITE,INTRODUCE,PARKING_POSSIBLE
         */
         pstmt.setString(1, requestEnp.getEnpName());
         pstmt.setString(2, requestEnp.getEnpPhone());
         pstmt.setString(3, requestEnp.getEnpAddress());
         pstmt.setString(4, requestEnp.getEnpHour());
         pstmt.setString(5, requestEnp.getEnpType());
         pstmt.setString(6, requestEnp.getPriceRange());
         pstmt.setString(7, requestEnp.getClosedDay());
         pstmt.setString(8, requestEnp.getWebsite());
         pstmt.setString(9, requestEnp.getIntroduce());
         pstmt.setString(10, requestEnp.getParkingPossible());
         
         
         result = pstmt.executeUpdate();
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(pstmt);
      }
      
      return result;
   }

   //제휴업체 회원가입 partnerEnp에 값넣기
   public int insertPartnerEnp2(Connection con, EnpVO requestEnp) {
	   PreparedStatement pstmt = null;
	      int result = 0;
	      String query = prop.getProperty("insertPartnerEnp2");
	      
	      try {
	         pstmt = con.prepareStatement(query);
//	         아래 입력 내용은 쿼리에 따라 달라질 수 있음
	         /*--ENP_NO	VARCHAR2(20 BYTE)
	         --ENP_REGISTER_NO	VARCHAR2(10 BYTE)
	         --PARTNER_CODE	VARCHAR2(20 BYTE)
	         --PENALTY_COUNT	NUMBER(3,0)
	         --PARTNER_ID	VARCHAR2(20 BYTE)
	         --PARTNER_PWD	VARCHAR2(128 BYTE)
	         --PARTNER_EMAIL	VARCHAR2(30 BYTE)
	         --PARTNER_NAME	VARCHAR2(15 BYTE)
	         --ACCOUNT_HOLDER	VARCHAR2(15 BYTE)
	         --BANK	VARCHAR2(30 BYTE)
	         --BANK_ACCOUNT	NUMBER(14,0)
	         --DEPOSIT_LOWER_LIMIT	NUMBER(7,0)
	         --DEPOSIT_HIGHER_LIMIT	NUMBER(7,0)
	         --SIGNUP_APPROVAL	VARCHAR2(1 BYTE)
	         --JUMIN_NO	VARCHAR2(14 BYTE)
	         --ENP_LICENCE	VARCHAR2(6 BYTE)*/
	         pstmt.setString(1, requestEnp.getEnpRegisterNo());
	         pstmt.setString(2, requestEnp.getPartnerId());
	         pstmt.setString(3, requestEnp.getPartnerPwd());
	         pstmt.setString(4, requestEnp.getPartnerEmail());
	         pstmt.setString(5, requestEnp.getPartnerName());
	         pstmt.setString(6, requestEnp.getPartnerName());
	         pstmt.setString(7, requestEnp.getBank());
	         pstmt.setString(8,requestEnp.getBankAccount());
	         pstmt.setInt(9, 0);
	         pstmt.setInt(10, 1000000);
	         pstmt.setString(11, requestEnp.getJuminNo());
	         pstmt.setString(12, requestEnp.getEnpLicense());
	         
	         
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
		pstmt.setString(3, enpUp.getEnpAddress());
		pstmt.setString(4, enpUp.getEnpHour());
		pstmt.setString(5, enpUp.getEnpType());
		pstmt.setString(6, enpUp.getHashTags());
		pstmt.setString(7, enpUp.getPriceRange());
		pstmt.setString(8, enpUp.getClosedDay());
		pstmt.setString(9, enpUp.getWebsite());
		pstmt.setString(10, enpUp.getIntroduce());
		pstmt.setString(11, enpUp.getParkingPossible());
		
		result = pstmt.executeUpdate();
		
		
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} finally {
		close(pstmt);
	}
	
	return result;
}

public String selectCurrval(Connection con) {
	Statement stmt = null;
	ResultSet rset = null;
	String enpNo = "";
	
	String query = prop.getProperty("selectCurrval");
	
	System.out.println("query : "+query);
	
	try {
		stmt = con.createStatement();
		rset = stmt.executeQuery(query);
		
		if(rset.next()) {
			enpNo = rset.getString("currval");
			
			System.out.println("enpNocurrval : " + enpNo);
			
		}
		
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} finally {
		close(stmt);
		close(rset);
	}
	
	
	return enpNo;
}

public int insertAttachment(Connection con, EnpAttachment enpAttachment) {
	PreparedStatement pstmt = null;
	int result = 0;
	
	String query = prop.getProperty("insertAttachment");
	
	System.out.println("query : "+query);
	
	try {
		pstmt = con.prepareStatement(query);
		pstmt.setString(1, enpAttachment.getOriginName());
		pstmt.setString(2, enpAttachment.getChangeName());
		pstmt.setString(3, enpAttachment.getFilePath());
		pstmt.setString(4, enpAttachment.getEnpNo());
		
		result = pstmt.executeUpdate();
		
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally {
		close(pstmt);
	}
	
	
	
	return result;
}

public int insertMenu(Connection con, EnpUpVo enpUp) {
	PreparedStatement pstmt = null;
	int result = 0;
	
	String query = prop.getProperty("insertMenu");
	
	System.out.println("query : "+query);
	
	try {
		pstmt = con.prepareStatement(query);
		pstmt.setString(1, enpUp.getMenuName());
		pstmt.setInt(2, enpUp.getMenuPrice());
		pstmt.setString(3, enpUp.getEnpNo());
		
		System.out.println(enpUp.getEnpNo());
		
		result = pstmt.executeUpdate();
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} finally {
		close(pstmt);
	}
	
	return result;
}



}