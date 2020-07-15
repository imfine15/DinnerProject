package com.kh.semi.member.model.dao;

import static com.kh.semi.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.semi.enterprise.model.vo.EnpVO;
import com.kh.semi.member.model.vo.MemberVO;

public class MemberDao {
	Properties prop = new Properties();
	
	public MemberDao() {
		String fileName = MemberDao.class.getResource("/sql/member/member-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertMember(Connection con, MemberVO requestMember) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertMember");
		
		try {
			pstmt = con.prepareStatement(query);
//			아래 입력 내용은 쿼리에 따라 달라질 수 있음
//			ID, PASSWORD, NAME, EMAIL, PHONE, GENDER, NICKNAME, TERMSADMIT(0, 1)
//			INSERT INTO MEMBER VALUES(SEQ_MEMBERNO.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, DEFAULT, ?)

			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public MemberVO loginMember(Connection con, MemberVO requestMember) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		MemberVO responseMember = null;
		String query = prop.getProperty("loginMember");
		
		try {
//			SELECT * FROM MEMBER WHERE ID = ? AND PASSWORD = ?
			
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, requestMember.getmId());
			pstmt.setString(2, requestMember.getmPwd());
			System.out.println("1 : "+requestMember.getmId());
			System.out.println("1 : "+requestMember.getmPwd());
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				responseMember = new MemberVO();
				responseMember.setmNo(rset.getString("MEMBER_NO"));
				responseMember.setmId(rset.getString("MEMBER_ID"));
				responseMember.setmPwd(rset.getString("MEMBER_PWD"));
				responseMember.setmName(rset.getString("MEMBER_NAME"));
				responseMember.setmEmail(rset.getString("MEMBER_EMAIL"));
				responseMember.setmPhone(rset.getString("MEMBER_PHONE"));
				responseMember.setmGender(rset.getString("MEMBER_GENDER"));
				responseMember.setmNickname(rset.getString("MEMBER_NICKNAME"));
				responseMember.setmGrade(rset.getString("MEMBER_GRADE"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return responseMember;
	}

	public ArrayList<EnpVO> searchEnp(Connection con, String search) {
		ArrayList<EnpVO> enpList = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("searchEnp");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, search);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				enpList = new ArrayList<>();
				EnpVO e = new EnpVO();
				
				e.setEnpNo(rset.getString("ENP_NO"));
				e.setEnpName(rset.getString("ENP_NAME"));
				e.setEnpPhone(rset.getString("ENP_PHONE"));
				e.setEnpAddress(rset.getString("ENP_ADDRESS"));
				e.setEnpHour(rset.getString("ENP_HOUR"));
				e.setEnpType(rset.getString("ENP_TYPE"));
				e.setEnpStatus(rset.getString("ENP_STATUS"));
				e.setEnpPartnerType(rset.getString("ENP_PARTNER_TYPE"));
				e.setHashTags(rset.getString("HASH_TAGS"));
				e.setPriceRange(rset.getString("PRICE_RANGE"));
				e.setClosedDay(rset.getString("CLOSED_DAY"));
				e.setWebsite(rset.getString("WEBSITE"));
				e.setIntroduce(rset.getString("INTRODUCE"));
				e.setParkingPossible(rset.getString("PARKING_POSSIBLE"));
				
				enpList.add(e);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return enpList;
	}

}
