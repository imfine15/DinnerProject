package com.kh.semi.ad.model.dao;

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

import com.kh.semi.ad.model.vo.PartnerVO;
import com.kh.semi.admin.model.vo.PageInfo;
import com.kh.semi.notice.model.dao.NoticeDao;
import com.kh.semi.notice.model.vo.NoticeVO;

public class PartnerDao {
	
	private Properties prop = new Properties();

	public PartnerDao() {

		String fileName = NoticeDao.class.getResource("/sql/partner/partner-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	
	//제휴문의 등록 메소드 
	public int insertPartnerQuestion(Connection con, PartnerVO partner) {
		
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertPartnerQuestion");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1,  partner.getPartQName());
			pstmt.setString(2,  partner.getPartQPhone());
			pstmt.setString(3,  partner.getPartQEmail());
			pstmt.setString(4,  partner.getPartQTitle());
			pstmt.setString(5, partner.getPartQAddress());
			pstmt.setString(6, partner.getPartQEnpType());
			pstmt.setString(7, partner.getPartQType());
			pstmt.setString(8, partner.getPartQContent());
	
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally {
			close(pstmt);
		}		
		return result;
	}

	public int getListCount(Connection con) {
		
		Statement stmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		String query = prop.getProperty("listCount");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}	
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}		
		return listCount;
	}
	
	public ArrayList<PartnerVO> selectList(Connection con, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<PartnerVO> list = null;
		
		String query = prop.getProperty("selectList");
		
		try {
			pstmt = con.prepareStatement(query);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
			int endRow = startRow + pi.getLimit() - 1;
			
			pstmt.setInt(1,  startRow);
			pstmt.setInt(2,  endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<>();

			while(rset.next()) {
				PartnerVO p = new PartnerVO();
				
				p.setPartnerQuestionNo(rset.getString("TSN"));
				p.setPartQName(rset.getString("PART_Q_NAME"));
				p.setPartQPhone(rset.getString("PART_Q_PHONE"));
				p.setPartQEmail(rset.getString("PART_Q_EMAIL"));
				p.setPartQTitle(rset.getString("PART_Q_TITLE"));
				p.setPartQEnpType(rset.getString("PART_Q_ENP_TYPE"));
				p.setPartQType(rset.getString("PART_Q_TYPE"));
				p.setPartQDate(rset.getDate("PART_Q_DATE"));
				

				list.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return list;
	}

	public PartnerVO selectOne(Connection con, int pNo) {
	
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		PartnerVO partner = null;

		String query = prop.getProperty("selectOne");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1,  pNo);

			rset = pstmt.executeQuery();

			if(rset.next()) {
				partner = new PartnerVO();
				
				partner.setPartnerQuestionNo(rset.getString("TO_NUMBER(SUBSTR(PARTNER_QUESTION_NO,3))"));
				partner.setPartQName(rset.getString("PART_Q_NAME"));
				partner.setPartQPhone(rset.getString("PART_Q_PHONE"));
				partner.setPartQEmail(rset.getString("PART_Q_EMAIL"));
				partner.setPartQAddress(rset.getString("PART_Q_ADDRESS"));
				partner.setPartQEnpType(rset.getString("PART_Q_ENP_TYPE"));
				partner.setPartQType(rset.getString("PART_Q_TYPE"));
				partner.setPartQContent(rset.getString("PART_Q_CONTENT"));
				partner.setPartQDate(rset.getDate("PART_Q_DATE"));
				partner.setPartQTitle(rset.getString("PART_Q_TITLE"));
			
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return partner;
	}

}
