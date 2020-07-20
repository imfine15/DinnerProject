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
import java.util.HashMap;
import java.util.List;
import java.util.Properties;

import com.kh.semi.admin.model.vo.PageInfo;
import com.kh.semi.board.model.vo.BoardUpVo;
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
	
	public List<BoardVO> likeSortBoard(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("likeSortBoard");
		List<BoardVO> likeSortBoardList = null;
		
		try {
			likeSortBoardList = new ArrayList<>();
			
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
				
				likeSortBoardList.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return likeSortBoardList;
	}
	
	public List<BoardVO> viewSortEnpBoard(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("viewSortEnpBoard");
		List<BoardVO> viewSortEnpBoardList = null;
		
		try {
			viewSortEnpBoardList = new ArrayList<>();
			
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, "맛집");
			
			rset = pstmt.executeQuery();
			
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
				b.setUploadNo(rset.getString("UPLOAD_NO"));
				b.setStatusName(rset.getString("STATUS_NAME"));
				b.setUploadDate(rset.getDate("UPLOAD_DATE"));
				b.setLikeCount(rset.getInt("LIKE_COUNT"));
				
				viewSortEnpBoardList.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return viewSortEnpBoardList;
	}
	
	public List<BoardVO> dateSortEnpBoard(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("dateSortEnpBoard");
		List<BoardVO> dateSortEnpBoardList = null;
		
		try {
			dateSortEnpBoardList = new ArrayList<>();
			
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, "맛집");
			
			rset = pstmt.executeQuery();
			
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
				b.setUploadNo(rset.getString("UPLOAD_NO"));
				b.setStatusName(rset.getString("STATUS_NAME"));
				b.setUploadDate(rset.getDate("UPLOAD_DATE"));
				b.setLikeCount(rset.getInt("LIKE_COUNT"));
				
				dateSortEnpBoardList.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return dateSortEnpBoardList;
	}
	
	public List<BoardVO> likeSortEnpBoard(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("likeSortEnpBoard");
		List<BoardVO> likeSortEnpBoardList = null;
		
		try {
			likeSortEnpBoardList = new ArrayList<>();
			
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, "맛집");
			
			rset = pstmt.executeQuery();
			
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
				b.setUploadNo(rset.getString("UPLOAD_NO"));
				b.setStatusName(rset.getString("STATUS_NAME"));
				b.setUploadDate(rset.getDate("UPLOAD_DATE"));
				b.setLikeCount(rset.getInt("LIKE_COUNT"));
				
				likeSortEnpBoardList.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return likeSortEnpBoardList;
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

	public int insertBoard(Connection con, BoardUpVo board) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertBoard");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, board.getBoardTitle());
			pstmt.setString(2, board.getMemberNo());
			pstmt.setString(3, board.getBoardContent());
			pstmt.setString(4, board.getBoardCategory());
			pstmt.setString(5, board.getHashTags());
			
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertAttachment(Connection con, BoardUpVo file) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertAttachment");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, file.getOriginName());
			pstmt.setString(2, file.getChangeName());
			pstmt.setString(3, file.getFilePath());
			pstmt.setString(4, file.getBoardNo());
			
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
		String boardNo = "";
		
		String query = prop.getProperty("selectCurrval");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				int id = rset.getInt("currval");
				
				boardNo = "B"+id;
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		
		return boardNo;
	}

	public int insertHistory(Connection con, String boardNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertHistory");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, boardNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		
		return result;
	}

	public int getListCount(Connection con) {
		Statement stmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("listCount");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		
		return listCount;
	}

	public ArrayList<BoardUpVo> selectList(Connection con, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<BoardUpVo> list = null;
		BoardUpVo bu;
		
		String query = prop.getProperty("selectList");
		
		try {
			pstmt = con.prepareStatement(query);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
			int endRow = startRow + pi.getLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<>();
			
			while(rset.next()) {
				bu = new BoardUpVo();
				bu.setBoardNo(rset.getString("BOARD_NO"));
				bu.setBoardTitle(rset.getString("BOARD_TITLE"));
				bu.setMemberId(rset.getString("MEMBER_ID"));
				bu.setUploadDate(rset.getDate("UPLOAD_DATE"));
				
				list.add(bu);
				
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}

	public BoardUpVo selectOneBoard(Connection con, String boardNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		BoardUpVo bu = null;
		
		String query = prop.getProperty("selectOneBoard");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, boardNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				bu = new BoardUpVo();
				
				bu.setBoardTitle(rset.getString("BOARD_TITLE"));
				bu.setMemberNo(rset.getString("MEMBER_NO"));
				bu.setManagerNo(rset.getString("MANAGER_NO"));
				bu.setBoardKeyword(rset.getString("BOARD_KEYWORD"));
				bu.setBoardContent(rset.getString("BOARD_CONTENT"));
				bu.setBoardCategory(rset.getString("BOARD_CATEGORY"));
				bu.setEnpNo(rset.getString("ENP_NO"));
				bu.setViewCount(rset.getInt("VIEW_COUNT"));
				bu.setHashTags(rset.getString("HASH_TAGS"));
				bu.setMemberId(rset.getString("MEMBER_ID"));
				bu.setUploadDate(rset.getDate("UPLOAD_DATE"));
				
				
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return bu;
	}

	public int updateCount(Connection con, String boardNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateCount");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, boardNo);
			pstmt.setString(2, boardNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public ArrayList<HashMap<String, Object>> selectThumbnailList(Connection con, String boardNo) {
		PreparedStatement pstmt = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectThumbnailList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, boardNo);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<>();
			
			while(rset.next()) {
				hmap = new HashMap<>();
				
				hmap.put("fileNo", rset.getString("FILE_NO"));
				hmap.put("originName", rset.getString("ORIGIN_NAME"));
				hmap.put("changeName", rset.getString("CHANGE_NAME"));
				hmap.put("filePath", rset.getString("FILE_PATH"));
				hmap.put("uploadDate", rset.getDate("UPLOAD_DATE"));
				hmap.put("boardNo", rset.getString("BOARD_NO"));
				
				
				list.add(hmap);
				

			}
			

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		
		
		return list;
	}

	public List<BoardVO> selectTopThree(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectTopThree");
		List<BoardVO> selectThree = null;
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, "맛집");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return selectThree;
	}

	

}
