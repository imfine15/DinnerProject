package com.kh.semi.board.model.dao;

import static com.kh.semi.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
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

	public List<BoardVO> foundAllBoard(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("foundAllBoard");
		List<BoardVO> boardList = null;
		
		try {
			boardList = new ArrayList<>();
			
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
				
				boardList.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return boardList;
	}

}
