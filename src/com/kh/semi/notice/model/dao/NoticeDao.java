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
import java.util.HashMap;
import java.util.Properties;

import static com.kh.semi.common.JDBCTemplate.*;

import com.kh.semi.admin.model.vo.PageInfo;
import com.kh.semi.notice.model.vo.AdminNoticeAttachment;
import com.kh.semi.notice.model.vo.AdminNoticeVO;
import com.kh.semi.notice.model.vo.EntNoticeVO;
import com.kh.semi.notice.model.vo.NoticeAttachment;
import com.kh.semi.notice.model.vo.NoticeVO;

public class NoticeDao {

	private Properties prop = new Properties();

	public NoticeDao() {

		String fileName = NoticeDao.class.getResource("/sql/notice/notice-query.properties").getPath();

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

	//관리자가 개인공지사항 리스트 확인하는 메소드 
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

	//사이트에서 멤버 공지사항 읽는 메소드 
	public ArrayList<NoticeVO> selectClientNotice(Connection con, PageInfo pi) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<NoticeVO> list = null;
		
		String query = prop.getProperty("selectClientNotice");
		
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

	//업체 공지사항 등록용 메소드
	public int insertEntNotice(Connection con, EntNoticeVO eNotice) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertEntNotice");
			
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, eNotice.getNoticeTitle());
			pstmt.setString(2, eNotice.getNoticeContent());
			
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	//업체 공지사항 최근 발생한 시퀀스 조회용 메소드
	public String selectCurrval(Connection con) {

		Statement stmt = null;
		ResultSet rset = null;
		String eNno = "";

		String query = prop.getProperty("selectCurrval");

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			if(rset.next()) {
				
				int nId= rset.getInt("currval");
				eNno = "N"+nId;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}

		return eNno;
	}

	//첨부파일 인서트할 메소드
	public int insertAttachment(Connection con, NoticeAttachment noticeAttachment) {
	
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertAttachment");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, noticeAttachment.getOriginName());
			pstmt.setString(2, noticeAttachment.getChangeName());
			pstmt.setString(3, noticeAttachment.getFilePath());
			pstmt.setString(4, noticeAttachment.getNoticeNo());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}
	
	public int getEntListCount(Connection con) {
		
		Statement stmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		String query = prop.getProperty("EntlistCount");
		
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

	//업체공지사항 조회하기 관리자가 
	public ArrayList<EntNoticeVO> selectEntList(Connection con, PageInfo pi) {
	
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<EntNoticeVO> list = null;
		
		String query = prop.getProperty("selectEntList");
		
		try {
			pstmt = con.prepareStatement(query);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
			int endRow = startRow + pi.getLimit() - 1;
			
			pstmt.setInt(1,  startRow);
			pstmt.setInt(2,  endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<>();

			while(rset.next()) {
				EntNoticeVO n = new EntNoticeVO();
				
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

	//업체 공지사항 상세보기 
	public HashMap<String, Object> selectEnpNotice(Connection con, int num) {
	
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> hmap = null;
		EntNoticeVO eNotice = null;
		NoticeAttachment attachment = null;
		ArrayList<NoticeAttachment> list = null;
		
		String query = prop.getProperty("selectEnpNotice");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1,  num);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<NoticeAttachment>();
				
			while(rset.next()) {
								
				eNotice = new EntNoticeVO();
				eNotice.setNoticeNo(rset.getString("NOTICE_NO"));
				eNotice.setNoticeContent(rset.getString("NOTICE_CONTENT"));
				eNotice.setNoticeDate(rset.getDate("NOTICE_DATE"));
				eNotice.setNoticeTitle(rset.getString("NOTICE_TITLE"));
		
				
				attachment = new NoticeAttachment();
				attachment.setChangeName(rset.getString("CHANGE_NAME"));
				attachment.setFileNo(rset.getString("FILE_NO"));
				attachment.setFilePath(rset.getString("FILE_PATH"));
				attachment.setOriginName(rset.getString("ORIGIN_NAME"));
				
				list.add(attachment);
			}
			
			hmap = new HashMap<>();
			
			hmap.put("eNotice", eNotice);
			hmap.put("attachment", list);
					
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return hmap;
	}

	//관리자페이지 관리자공지 등록메소드 
	public int insertAdminNotice(Connection con, AdminNoticeVO aNotice) {
		
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertAdminNotice");
			
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, aNotice.getNoticeTitle());
			pstmt.setString(2, aNotice.getNoticeContent());
			
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	//파일 넣을때 조회하는 메소드 
	public String selectAdminCurrval(Connection con) {
		
		Statement stmt = null;
		ResultSet rset = null;
		String aNno = "";

		String query = prop.getProperty("selectAdminCurrval");

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			if(rset.next()) {
				
				int aId= rset.getInt("currval");
				aNno = "N"+aId;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}

		return aNno;
		
	}

	//파일 넣는 메소드
	public int insertAdminAttachment(Connection con, AdminNoticeAttachment adminNoticeAttachment) {
		
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertAdminAttachment");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, adminNoticeAttachment.getOriginName());
			pstmt.setString(2, adminNoticeAttachment.getChangeName());
			pstmt.setString(3, adminNoticeAttachment.getFilePath());
			pstmt.setString(4, adminNoticeAttachment.getNoticeNo());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
		
	}

	public ArrayList<AdminNoticeVO> selectAdminList(Connection con, PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

}
