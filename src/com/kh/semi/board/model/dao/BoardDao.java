package com.kh.semi.board.model.dao;

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
import java.util.List;
import java.util.Properties;

import com.kh.semi.board.model.vo.BoardVO;

public class BoardDao {
	Properties prop = new Properties();
	
	public BoardDao() {
		String fileName = BoardDao.class.getResource("/sql/board/board-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public List<BoardVO> viewSortBoard(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("viewSortBoard");
		List<BoardVO> viewSortBoardList = null;
		
		try {
			viewSortBoardList = new ArrayList<>();
			
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				BoardVO b = new BoardVO();
				
				b.setBoardNo(rset.getString("BOARD_NO"));
				b.setBoardTitle(rset.getString("BOARD_TITLE"));
				b.setMemberNo(rset.getString("MEMBER_NO"));
				b.setManagerNo(rset.getString("MANAGER_NO"));
				b.setBoardKeyword(rset.getString("BOARD_KEYWORD"));
				b.setBoardContent(rset.getString("BOARD_CONTENT"));
				b.setBoardCategory(rset.getString("BOARD_CATEGORY"));
				b.setEnpNo(rset.getString("ENP_NO"));
				b.setViewCount(rset.getInt("VIEW_COUNT"));
				b.setHashTags(rset.getString("HASH_TAGS"));
				b.setCourseNo(rset.getString("COURSE_NO"));
				b.setUploadNo(rset.getString("UPLOAD_NO"));
				b.setStatusName(rset.getString("STATUS_NAME"));
				b.setUploadDate(rset.getDate("UPLOAD_DATE"));
				b.setLikeCount(rset.getInt("LIKE_COUNT"));
				
				viewSortBoardList.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return viewSortBoardList;
	}

	public List<BoardVO> dateSortBoard(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("dateSortBoard");
		List<BoardVO> dateSortBoardList = null;
		
		try {
			dateSortBoardList = new ArrayList<>();
			
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				BoardVO b = new BoardVO();
				
				b.setBoardNo(rset.getString("BOARD_NO"));
				b.setBoardTitle(rset.getString("BOARD_TITLE"));
				b.setMemberNo(rset.getString("MEMBER_NO"));
				b.setManagerNo(rset.getString("MANAGER_NO"));
				b.setBoardKeyword(rset.getString("BOARD_KEYWORD"));
				b.setBoardContent(rset.getString("BOARD_CONTENT"));
				b.setBoardCategory(rset.getString("BOARD_CATEGORY"));
				b.setEnpNo(rset.getString("ENP_NO"));
				b.setViewCount(rset.getInt("VIEW_COUNT"));
				b.setHashTags(rset.getString("HASH_TAGS"));
				b.setCourseNo(rset.getString("COURSE_NO"));
				b.setUploadNo(rset.getString("UPLOAD_NO"));
				b.setStatusName(rset.getString("STATUS_NAME"));
				b.setUploadDate(rset.getDate("UPLOAD_DATE"));
				b.setLikeCount(rset.getInt("LIKE_COUNT"));
				
				dateSortBoardList.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return dateSortBoardList;
	}
	
	public List<BoardVO> rateSortBoard(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("rateSortBoard");
		List<BoardVO> rateSortBoardList = null;
		
		try {
			rateSortBoardList = new ArrayList<>();
			
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				BoardVO b = new BoardVO();
				
				b.setBoardNo(rset.getString("BOARD_NO"));
				b.setBoardTitle(rset.getString("BOARD_TITLE"));
				b.setMemberNo(rset.getString("MEMBER_NO"));
				b.setManagerNo(rset.getString("MANAGER_NO"));
				b.setBoardKeyword(rset.getString("BOARD_KEYWORD"));
				b.setBoardContent(rset.getString("BOARD_CONTENT"));
				b.setBoardCategory(rset.getString("BOARD_CATEGORY"));
				b.setEnpNo(rset.getString("ENP_NO"));
				b.setViewCount(rset.getInt("VIEW_COUNT"));
				b.setHashTags(rset.getString("HASH_TAGS"));
				b.setCourseNo(rset.getString("COURSE_NO"));
				b.setUploadNo(rset.getString("UPLOAD_NO"));
				b.setStatusName(rset.getString("STATUS_NAME"));
				b.setUploadDate(rset.getDate("UPLOAD_DATE"));
				b.setLikeCount(rset.getInt("LIKE_COUNT"));
				
				rateSortBoardList.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return rateSortBoardList;
	}
	
	public int getFileCount(Connection con, String boardNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("getFileCount");
		int fileCount = 1;
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, boardNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				fileCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return fileCount;
	}

	public String[] getFilePaths(Connection con, String[] filePaths, String boardNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("getFilePaths");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, boardNo);
			
			rset = pstmt.executeQuery();
			
			String filePath = "";
			int i = 0;
			
			while(rset.next()) {
				filePath = rset.getString("FILE_PATH"); 
				
				filePaths[i] = filePath;
				
				filePath = "";
				i++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return filePaths;
	}

}
