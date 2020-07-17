package com.kh.semi.notice.model.dao;

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

import static com.kh.semi.common.JDBCTemplate.*;

import com.kh.semi.admin.model.vo.PageInfo;
import com.kh.semi.notice.model.vo.NoticeVO;

public class ClientNoticeDao {

	private Properties prop = new Properties();

	public ClientNoticeDao() {

		String fileName = ClientNoticeDao.class.getResource("/sql/notice/notice-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	
	//공지사항 등록용 메소드
	public int insertClientNotice(Connection con, NoticeVO newNotice) {

		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertClientNotice");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1,  newNotice.getNoticeTitle());
			pstmt.setString(2,  newNotice.getNoticeContent());
	
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

	public ArrayList<NoticeVO> selectList(Connection con, PageInfo pi) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<NoticeVO> list = null;
		
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
				NoticeVO n = new NoticeVO();
				
				n.setNoticeTitle(rset.getString("NOTICE_TITLE"));
				n.setNoticeDate(rset.getDate("NOTICE_DATE"));
				n.setNoticeNo(rset.getString("SUBSTR(NOTICE_NO,2,1)"));
				n.setNoticeContent(rset.getString("NOTICE_CONTENT"));

				list.add(n);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return list;
	}

	public NoticeVO selectOne(Connection con, int cnno) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		NoticeVO notice = null;

		String query = prop.getProperty("selectOneClient");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1,  cnno);

			rset = pstmt.executeQuery();

			if(rset.next()) {
				notice = new NoticeVO();
				
				notice.setNoticeNo(rset.getString("SUBSTR(NOTICE_NO,2,1)"));
				notice.setNoticeTitle(rset.getString("NOTICE_TITLE"));
				notice.setNoticeContent(rset.getString("NOTICE_CONTENT"));
				notice.setNoticeDate(rset.getDate("NOTICE_DATE"));
				notice.setMagagerNo(rset.getString("MANAGER_NO"));
			
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return notice;
	}

}





