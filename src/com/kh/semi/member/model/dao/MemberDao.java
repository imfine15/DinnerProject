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
			pstmt.setString(1, requestMember.getId());
			pstmt.setString(2, requestMember.getPassword());
			pstmt.setString(3, requestMember.getName());
			pstmt.setString(4, requestMember.getEmail());
			pstmt.setString(5, requestMember.getPhone());
			pstmt.setString(6, requestMember.getGender());
			pstmt.setString(7, requestMember.getNickName());
			pstmt.setString(8, requestMember.getTermsAdmit());
			
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
			responseMember = new MemberVO();
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, requestMember.getId());
			pstmt.setString(2, requestMember.getPassword());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				responseMember.setMemberNo(rset.getInt("MEMBERNO"));
				responseMember.setId(rset.getString("ID"));
				responseMember.setPassword(rset.getString("PASSWORD"));
				responseMember.setName(rset.getString("NAME"));
				responseMember.setEmail(rset.getString("EMAIL"));
				responseMember.setPhone(rset.getString("PHONE"));
				responseMember.setGender(rset.getString("GENDER"));
				responseMember.setNickName(rset.getString("NICKNAME"));
				responseMember.setGrade(rset.getString("GRADE"));
				responseMember.setTermsAdmit(rset.getString("TERMSADMIT"));
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
