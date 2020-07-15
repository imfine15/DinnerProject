package com.kh.semi.member.model.dao;

import static com.kh.semi.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

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

}
