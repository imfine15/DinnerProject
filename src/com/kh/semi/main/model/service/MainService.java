package com.kh.semi.main.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.board.model.vo.BoardUpVo;
import com.kh.semi.main.model.dao.MainDao;

import static com.kh.semi.common.JDBCTemplate.*;

public class MainService {

	public ArrayList<BoardUpVo> selectBoardList() {
		Connection con = getConnection();
		
		ArrayList<BoardUpVo> boardList = new MainDao().selectBoardList(con);
		
		return boardList;
	}

}
