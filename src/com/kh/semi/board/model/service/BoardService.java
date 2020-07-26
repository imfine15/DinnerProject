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
import com.kh.semi.board.model.vo.History;

public class BoardService {
	// 조회수순 코스게시물 조회
	public List<BoardVO> getAllBoard() {
		Connection con = getConnection();
		
		List<BoardVO> viewSortBoardList = new BoardDao().getAllBoard(con);
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

		public ArrayList<BoardUpVo> selectReplyList(String boardNo) {
			Connection con = getConnection();
			//ArrayList<BoardUpVo> replyList = new BoardDao().sele
			ArrayList<BoardUpVo> replyList = new BoardDao().selectReplyList(con, boardNo);
			
			System.out.println("replyList : " + replyList);
			
			close(con);
			return replyList;
		}

		public int deleteReply(BoardUpVo reply) {
			Connection con = getConnection();
			int result = 0;
			
			result = new BoardDao().deleteReply(con, reply);
			
			if(result > 0) {
				commit(con);
			} else {
				rollback(con);
			}
			
			return result;
		}

		public int getReplyListCount(String bNo) {
			Connection con = getConnection();
			
			int count = new BoardDao().getReplyListCount(con, bNo);
			
			close(con);
			return count;
		}

		public ArrayList<BoardUpVo> selectReplyList(String bNo, PageInfo pi) {
			Connection con = getConnection();
			//ArrayList<BoardUpVo> replyList = new BoardDao().sele
			ArrayList<BoardUpVo> replyList = new BoardDao().selectReplyList(con, bNo, pi);
			
			close(con);
			return replyList;
		}

		public int updateBoard(BoardUpVo board, ArrayList<BoardUpVo> fileList) {
			Connection con = getConnection();
			int result = 0;
			int result1 = 0;
			int result2 = 0;
			result1 = new BoardDao().updateBoard(con, board);
			
			if(result1 > 0) {
				String[] fileNo= new String[fileList.size()];
				fileNo = new BoardDao().selectFileCurrval(con, fileNo, board);
				
				for(int i = 0; i < fileList.size(); i++) {
					fileList.get(i).setFileNo(fileNo[i]);
					
					result2 += new BoardDao().updateAttachment(con, fileList.get(i));
				}
			}
			
			if(result1 > 0 && result2 > 0) {
				commit(con);
				result = 1;
			} else {
				rollback(con);
			}
			close(con);
			return result;
		}

		public int uploadBoard(BoardUpVo board) {
			Connection con = getConnection();
			int result = 0;
			
			result = new BoardDao().uploadBoard(con, board);
			
			if(result > 0 ) {
				commit(con);
			} else {
				rollback(con);
			}
			close(con);
			return result;
		}

		public History selectHistory(String boardNo) {
			Connection con = getConnection();
			History history = new BoardDao().selectHistory(con, boardNo);
			close(con);
			return history;
		}

		public ArrayList<BoardVO> selectCourse(String sort, com.kh.semi.board.model.vo.PageInfo pi) {
			Connection con = getConnection();
			ArrayList<BoardVO> courseList = new BoardDao().selectCourse(con, sort, pi);
			ArrayList<BoardVO> courseListWithFile = new BoardDao().getFilePaths(con, courseList);

			close(con);
			
			return courseListWithFile;
		}

		public int getCourseCount() {
			Connection con = getConnection();
			int count = new BoardDao().getCourseCount(con);
			
			close(con);
			
			return count;
		}

		public int getEnpBoardCount() {
			Connection con = getConnection();
			int count = new BoardDao().getEnpBoardCount(con);
			
			close(con);
			
			return count;
		}

		public ArrayList<BoardVO> selectEnpBoard(String sort, com.kh.semi.board.model.vo.PageInfo pi) {
			Connection con = getConnection();
			ArrayList<BoardVO> enpBoardList = new BoardDao().selectEnpBoard(con, sort, pi);
			ArrayList<BoardVO> enpBoardListWithFile = new BoardDao().getFilePaths(con, enpBoardList);
			
			close(con);
			
			return enpBoardListWithFile;
		}
}
