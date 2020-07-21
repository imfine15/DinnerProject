package com.kh.semi.board.model.service;

import static com.kh.semi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.kh.semi.admin.model.vo.PageInfo;
import com.kh.semi.board.model.dao.BoardDao;
import com.kh.semi.board.model.vo.BoardUpVo;
import com.kh.semi.board.model.vo.BoardVO;

import oracle.jdbc.OracleConnection.CommitOption;

public class BoardService {
	// 조회수순 코스게시물 조회
	public List<BoardVO> viewSortBoard() {
		Connection con = getConnection();
		
		List<BoardVO> viewSortBoardList = new BoardDao().viewSortBoard(con);
		for(int i = 0; i < viewSortBoardList.size(); i++) {
			String boardNo = viewSortBoardList.get(i).getBoardNo();
			
			int fileCount = new BoardDao().getFileCount(con, boardNo);
			String[] filePaths = new String[fileCount];
				
			filePaths = new BoardDao().getFilePaths(con, filePaths, boardNo);
			
			viewSortBoardList.get(i).setFilePaths(filePaths);
		}
		
		close(con);
		
		return viewSortBoardList;
	}

	// 최신순 코스게시물 조회
	public List<BoardVO> dateSortBoard() {
		Connection con = getConnection();
		
		List<BoardVO> dateSortBoardList = new BoardDao().dateSortBoard(con);
		for(int i = 0; i < dateSortBoardList.size(); i++) {
			String boardNo = dateSortBoardList.get(i).getBoardNo();
			
			int fileCount = new BoardDao().getFileCount(con, boardNo);
			String[] filePaths = new String[fileCount];
				
			filePaths = new BoardDao().getFilePaths(con, filePaths, boardNo);
			
			dateSortBoardList.get(i).setFilePaths(filePaths);
		}
		
		close(con);
		
		return dateSortBoardList;
	}
	
	// 추천순 코스게시물 조회
	public List<BoardVO> likeSortBoard() {
		Connection con = getConnection();
		
		List<BoardVO> likeSortBoardList = new BoardDao().likeSortBoard(con);
		for(int i = 0; i < likeSortBoardList.size(); i++) {
			String boardNo = likeSortBoardList.get(i).getBoardNo();
			
			int fileCount = new BoardDao().getFileCount(con, boardNo);
			String[] filePaths = new String[fileCount];
				
			filePaths = new BoardDao().getFilePaths(con, filePaths, boardNo);
			
			likeSortBoardList.get(i).setFilePaths(filePaths);
		}
		
		close(con);
		
		return likeSortBoardList;
	}
	
	// 조회수순 맛집게시물 조회
		public List<BoardVO> viewSortEnpBoard() {
			Connection con = getConnection();
			
			List<BoardVO> viewSortEnpBoardList = new BoardDao().viewSortEnpBoard(con);
			for(int i = 0; i < viewSortEnpBoardList.size(); i++) {
				String boardNo = viewSortEnpBoardList.get(i).getBoardNo();
				
				int fileCount = new BoardDao().getFileCount(con, boardNo);
				String[] filePaths = new String[fileCount];
					
				filePaths = new BoardDao().getFilePaths(con, filePaths, boardNo);
				
				viewSortEnpBoardList.get(i).setFilePaths(filePaths);
			}
			
			close(con);
			
			return viewSortEnpBoardList;
		}

		// 최신순 맛집게시물 조회
		public List<BoardVO> dateSortEnpBoard() {
			Connection con = getConnection();
			
			List<BoardVO> dateSortEnpBoardList = new BoardDao().dateSortEnpBoard(con);
			for(int i = 0; i < dateSortEnpBoardList.size(); i++) {
				String boardNo = dateSortEnpBoardList.get(i).getBoardNo();
				
				int fileCount = new BoardDao().getFileCount(con, boardNo);
				String[] filePaths = new String[fileCount];
					
				filePaths = new BoardDao().getFilePaths(con, filePaths, boardNo);
				
				dateSortEnpBoardList.get(i).setFilePaths(filePaths);
			}
			
			close(con);
			
			return dateSortEnpBoardList;
		}
		
		// 추천순 맛집게시물 조회
		public List<BoardVO> likeSortEnpBoard() {
			Connection con = getConnection();
			
			List<BoardVO> likeSortEnpBoardList = new BoardDao().likeSortEnpBoard(con);
			for(int i = 0; i < likeSortEnpBoardList.size(); i++) {
				String boardNo = likeSortEnpBoardList.get(i).getBoardNo();
				
				int fileCount = new BoardDao().getFileCount(con, boardNo);
				String[] filePaths = new String[fileCount];
					
				filePaths = new BoardDao().getFilePaths(con, filePaths, boardNo);
				
				likeSortEnpBoardList.get(i).setFilePaths(filePaths);
			}
			
			close(con);
			
			return likeSortEnpBoardList;
		}

		public int insertBoard(ArrayList<BoardUpVo> fileList) {
			Connection con = getConnection();
			int result = 0;
			
			int result1 = 0;
			int result2 = 0;
			int result3 = 0;
				
				result1 += new BoardDao().insertBoard(con, fileList.get(0));
				if(result1 > 0) {
					String boardNo = new BoardDao().selectCurrval(con);
					
				for(int i = 0; i < fileList.size(); i++) {
					fileList.get(i).setBoardNo(boardNo);

					result2 += new BoardDao().insertAttachment(con, fileList.get(i));
					
				}
				
				if(result2==fileList.size()) {
					
					result3 = new BoardDao().insertHistory(con, boardNo);
				}
			}
			
			if(result1 > 0 && result2 == fileList.size() && result3>0) {
				commit(con);
				result = 1;
			} else {
				rollback(con);
			}
			
			
			return result;
		}

		public int getListCount() {
			Connection con = getConnection();
			
			int listCount = new BoardDao().getListCount(con);
			
			close(con);
			
			
			
			return listCount;
		}

		public ArrayList<BoardUpVo> selectList(PageInfo pi) {
			Connection con = getConnection();
			
			ArrayList<BoardUpVo> list = new BoardDao().selectList(con, pi);
			
			close(con);
			
			
			
			
			return list;
		}

		public BoardUpVo selectOneBoard(String boardNo) {
			Connection con = getConnection();
			
			BoardUpVo board = null;
			int result = 0;
			
			result = new BoardDao().updateCount(con, boardNo);
			board = new BoardDao().selectOneBoard(con, boardNo);
			
			board.setBoardNo(boardNo);
			
			if(result > 0 && board != null) {
				commit(con);
			} else {
				rollback(con);
			}
			
			close(con);
			
			return board;
		}

		public ArrayList<HashMap<String, Object>> selectThumbnailList(String boardNo) {
			Connection con = getConnection();
			ArrayList<HashMap<String, Object>> list = new BoardDao().selectThumbnailList(con, boardNo);
			
			System.out.println("list2 : " + list);
			
			if(list != null) {
				commit(con);
			} else {
				rollback(con);
			}
			
			close(con);
			
			return list;
		}

		public List<BoardVO> selectTopThree() {
			Connection con = getConnection();
			List<BoardVO> selectThree = new BoardDao().selectTopThree(con);
			for(int i = 0; i < selectThree.size(); i++) {
				String boardNo = selectThree.get(i).getBoardNo();
				
				String[] filePaths = new String[2];
					
				filePaths = new BoardDao().getFilePaths(con, filePaths, boardNo);
				
				selectThree.get(i).setFilePaths(filePaths);
			}
			close(con);
			
			return selectThree;
		}

		public ArrayList<BoardUpVo> insertReply(BoardUpVo reply) {
			Connection con = getConnection();
			
			int result = new BoardDao().insertReply(con, reply);
			ArrayList<BoardUpVo> replyList = new BoardDao().selectReplyList(con, reply.getBoardNo());
			
			if(result > 0 && replyList != null) {
				commit(con);
			} else {
				rollback(con);
				replyList = null;
			}
			
			return replyList;
		}
}
