package com.kh.semi.board.model.service;

import static com.kh.semi.common.JDBCTemplate.close;
import static com.kh.semi.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.kh.semi.board.model.dao.BoardDao;
import com.kh.semi.board.model.vo.BoardVO;

public class BoardService {
	public List<BoardVO> foundAllBoard() {
		Connection con = getConnection();
		List<BoardVO> boardList = new BoardDao().foundAllBoard(con);
		
		close(con);
		
		return boardList;
	}

}
