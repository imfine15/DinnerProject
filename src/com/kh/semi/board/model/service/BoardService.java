package com.kh.semi.board.model.service;

import static com.kh.semi.common.JDBCTemplate.close;
import static com.kh.semi.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.kh.semi.board.model.dao.BoardDao;
import com.kh.semi.board.model.vo.BoardVO;

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
	
	// 별점순 코스게시물 조회
	public List<BoardVO> rateSortBoard() {
		Connection con = getConnection();
		
		List<BoardVO> rateSortBoardList = new BoardDao().rateSortBoard(con);
		for(int i = 0; i < rateSortBoardList.size(); i++) {
			String boardNo = rateSortBoardList.get(i).getBoardNo();
			
			int fileCount = new BoardDao().getFileCount(con, boardNo);
			String[] filePaths = new String[fileCount];
				
			filePaths = new BoardDao().getFilePaths(con, filePaths, boardNo);
			
			rateSortBoardList.get(i).setFilePaths(filePaths);
		}
		
		close(con);
		
		return rateSortBoardList;
	}
}
