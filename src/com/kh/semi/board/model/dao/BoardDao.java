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
import com.kh.semi.board.model.vo.History;

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

	public List<BoardVO> getAllBoard(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("getAllBoard");
		List<BoardVO> viewSortBoardList = null;
		
		try {
			viewSortBoardList = new ArrayList<>();
			
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, "코스");
			
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
			close(pstmt);
		}
		
		return viewSortBoardList;
	}

//	public List<BoardVO> viewSortEnpBoard(Connection con) {
//		PreparedStatement pstmt = null;
//		ResultSet rset = null;
//		String query = prop.getProperty("viewSortEnpBoard");
//		List<BoardVO> viewSortEnpBoardList = null;
//		
//		try {
//			viewSortEnpBoardList = new ArrayList<>();
//			
//			pstmt = con.prepareStatement(query);
//			
//			pstmt.setString(1, "맛집");
//			
//			rset = pstmt.executeQuery();
//			
//			while(rset.next()) {
//				BoardVO b = new BoardVO();
//				
//				b.setBoardNo(rset.getString("BOARD_NO"));
//				b.setBoardTitle(rset.getString("BOARD_TITLE"));
//				b.setMemberNo(rset.getString("MEMBER_NO"));
//				b.setManagerNo(rset.getString("MANAGER_NO"));
//				b.setBoardKeyword(rset.getString("BOARD_KEYWORD"));
//				b.setBoardContent(rset.getString("BOARD_CONTENT"));
//				b.setBoardCategory(rset.getString("BOARD_CATEGORY"));
//				b.setEnpNo(rset.getString("ENP_NO"));
//				b.setViewCount(rset.getInt("VIEW_COUNT"));
//				b.setHashTags(rset.getString("HASH_TAGS"));
//				b.setUploadNo(rset.getString("UPLOAD_NO"));
//				b.setStatusName(rset.getString("STATUS_NAME"));
//				b.setUploadDate(rset.getDate("UPLOAD_DATE"));
//				b.setLikeCount(rset.getInt("LIKE_COUNT"));
//				
//				viewSortEnpBoardList.add(b);
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close(rset);
//			close(pstmt);
//		}
//		
//		return viewSortEnpBoardList;
//	}
	
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
				
				boardNo = "B" + id;
			}
		} catch (SQLException e) {
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
			
			rset = pstmt.executeQuery();
			
			selectThree = new ArrayList<>();
			
			for(int i = 0; i < 3; i++) {
				rset.next();
				
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
				b.setLikeCount(rset.getInt("LIKE_COUNT"));
				
				selectThree.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return selectThree;
	}

	public int insertReply(Connection con, BoardUpVo reply) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertReply");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, reply.getBoardNo());
			pstmt.setString(2, reply.getMemberNo());
			pstmt.setString(3, reply.getReplyContent());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<BoardUpVo> selectReplyList(Connection con, String boardNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<BoardUpVo> list = null;
		
		String query = prop.getProperty("selectReplyList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, boardNo);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<BoardUpVo>();
			
			while(rset.next()) {
				BoardUpVo bu = new BoardUpVo();
				bu.setReplyNo(rset.getString("REPLY_NO"));
				bu.setBoardNo(rset.getString("BOARD_NO"));
				bu.setMemberNo(rset.getString("MEMBER_NO"));
				bu.setReplyDate(rset.getDate("REPLY_DATE"));
				bu.setReplyContent(rset.getString("REPLY_CONTENT"));
				bu.setMemberId(rset.getString("MEMBER_ID"));
				
				list.add(bu);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}

	public int deleteReply(Connection con, BoardUpVo reply) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int getReplyListCount(Connection con, String bNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("getReplyCount");
		int count = 0;
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, bNo);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				count = rset.getInt("COUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return count;
	}

	public ArrayList<BoardUpVo> selectReplyList(Connection con, String bNo, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<BoardUpVo> list = null;
		
		String query = prop.getProperty("selectReplyList1");
		
		try {
			pstmt = con.prepareStatement(query);
			int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
	        int endRow = startRow + pi.getLimit() - 1;
			pstmt.setString(1, bNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<BoardUpVo>();
			
			while(rset.next()) {
				BoardUpVo bu = new BoardUpVo();
				bu.setReplyNo(rset.getString("REPLY_NO"));
				bu.setBoardNo(rset.getString("BOARD_NO"));
				bu.setMemberNo(rset.getString("MEMBER_NO"));
				bu.setReplyDate(rset.getDate("REPLY_DATE"));
				bu.setReplyContent(rset.getString("REPLY_CONTENT"));
				bu.setMemberId(rset.getString("MEMBER_ID"));
				
				list.add(bu);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return list;
	}

	public int updateBoard(Connection con, BoardUpVo board) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateBoard");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, board.getBoardTitle());
			pstmt.setString(2, board.getHashTags());
			pstmt.setString(3, board.getBoardContent());
			pstmt.setString(4, board.getBoardNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateAttachment(Connection con, BoardUpVo boardUpVo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateAttachment");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, boardUpVo.getOriginName());
			pstmt.setString(2, boardUpVo.getChangeName());
			pstmt.setString(3, boardUpVo.getFilePath());
			pstmt.setString(4, boardUpVo.getFileNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public String[] selectFileCurrval(Connection con, String[] fileNos, BoardUpVo board) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String fileNo = "";
		
		String query = prop.getProperty("selectFileCurrval");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, board.getBoardNo());
			
			rset = pstmt.executeQuery();
			
			int i = 0;
			
			while(rset.next()) {
				fileNo = rset.getString("FILE_NO");
				
				fileNos[i]=fileNo;
				
				fileNo="";
				
				i++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return fileNos;
	}

	public int uploadBoard(Connection con, BoardUpVo board) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("uploadBoard");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, board.getBoardNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	public History selectHistory(Connection con, String boardNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		History history = null;
		
		String query = prop.getProperty("selectHistory");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, boardNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				history = new History();
				history.setUploadNo(rset.getString("UPLOAD_NO"));
				history.setStatusCode(rset.getString("STATUS_CODE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return history;
	}

	public ArrayList<BoardVO> selectCourse(Connection con, String sort, com.kh.semi.board.model.vo.PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<BoardVO> courseList = null;
		String query = "";
		switch(sort) {
			case "조회순" : query = prop.getProperty("viewSortBoard"); break;
			case "추천순" : query = prop.getProperty("likeSortBoard"); break;
			case "최신순" : query = prop.getProperty("dateSortBoard"); break;
		}
		
		try {
			pstmt = con.prepareStatement(query);
			
			courseList = new ArrayList<>();
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
			int endRow = startRow + pi.getLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				BoardVO b = new BoardVO();
				
				b.setBoardNo(rset.getString("BOARD_NO"));
				b.setBoardTitle(rset.getString("BOARD_TITLE"));
				b.setMemberNo(rset.getString("MEMBER_NO"));
				b.setManagerNo(rset.getString("MANAGER_NO"));
				b.setBoardKeyword(rset.getString("BOARD_KEYWORD"));
				b.setBoardContent(rset.getString("BOARD_CONTENT"));;
				b.setBoardCategory(rset.getString("BOARD_CATEGORY"));
				b.setEnpNo(rset.getString("ENP_NO"));
				b.setViewCount(rset.getInt("VIEW_COUNT"));
				b.setHashTags(rset.getString("HASH_TAGS"));
				b.setLikeCount(rset.getInt("LIKE_COUNT"));
				
				b.setCourseNo(rset.getString("COURSE_NO"));
				
				b.setUploadNo(rset.getString("UPLOAD_NO"));
				b.setStatusName(rset.getString("STATUS_NAME"));
				b.setUploadDate(rset.getDate("UPLOAD_DATE"));
				
				courseList.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return courseList;
	}

	public int getCourseCount(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("getCourseCount");
		int count = 0;
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				count = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return count;
	}

	public ArrayList<BoardVO> getFilePaths(Connection con, ArrayList<BoardVO> courseList) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("pagingFile");
		
		try {
			pstmt = con.prepareStatement(query);
			
			for(int i = 0; i < courseList.size(); i++) {
				pstmt.setString(1, courseList.get(i).getBoardNo());
				
				rset = pstmt.executeQuery();
				
				String[] filePaths = new String[2];
				
				int j = 0;
				while(rset.next()) {
					filePaths[j] = rset.getString("FILE_PATH");
					j++;
				}
				
				courseList.get(i).setFilePaths(filePaths);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return courseList;
	}

	public int getEnpBoardCount(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("getEnpBoardCount");
		int count = 0;
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, "맛집");
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return count;
	}

	public ArrayList<BoardVO> selectEnpBoard(Connection con, String sort, com.kh.semi.board.model.vo.PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<BoardVO> enpBoardList = null;
		String query = "";
		switch(sort) {
			case "조회순" : query = prop.getProperty("viewSortEnpBoard"); break;
			case "추천순" : query = prop.getProperty("likeSortEnpBoard"); break;
			case "최신순" : query = prop.getProperty("dateSortEnpBoard"); break;
		}
		
		try {
			pstmt = con.prepareStatement(query);
			
			enpBoardList = new ArrayList<>();
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
			int endRow = startRow + pi.getLimit() - 1;
			
			pstmt.setString(1, "맛집");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				BoardVO b = new BoardVO();
				
				b.setBoardNo(rset.getString("BOARD_NO"));
				b.setBoardTitle(rset.getString("BOARD_TITLE"));
				b.setMemberNo(rset.getString("MEMBER_NO"));
				b.setManagerNo(rset.getString("MANAGER_NO"));
				b.setBoardKeyword(rset.getString("BOARD_KEYWORD"));
				b.setBoardContent(rset.getString("BOARD_CONTENT"));;
				b.setBoardCategory(rset.getString("BOARD_CATEGORY"));
				b.setEnpNo(rset.getString("ENP_NO"));
				b.setViewCount(rset.getInt("VIEW_COUNT"));
				b.setHashTags(rset.getString("HASH_TAGS"));
				b.setLikeCount(rset.getInt("LIKE_COUNT"));
				
				b.setUploadNo(rset.getString("UPLOAD_NO"));
				b.setStatusName(rset.getString("STATUS_NAME"));
				b.setUploadDate(rset.getDate("UPLOAD_DATE"));
				
				enpBoardList.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return enpBoardList;
	}
	
}
