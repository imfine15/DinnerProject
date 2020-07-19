package com.kh.semi.board.model.service;

import static com.kh.semi.common.JDBCTemplate.*;
import static com.kh.semi.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

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

		public int insertBoard(BoardUpVo board, ArrayList<BoardUpVo> fileList) {
			Connection con = getConnection();
			int result = 0;
			
			result = new BoardDao().insertBoard(con, board, fileList);
			
			System.out.println("result : " + result);
			
			if(result > 0) {
				commit(con);
			} else {
				rollback(con);
			}
			
			
			return result;
		}
}
