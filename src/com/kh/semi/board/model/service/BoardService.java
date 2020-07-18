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
}
