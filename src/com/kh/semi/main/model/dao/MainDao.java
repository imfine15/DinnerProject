package com.kh.semi.main.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.semi.board.model.dao.BoardDao;
import com.kh.semi.board.model.vo.BoardUpVo;
import static com.kh.semi.common.JDBCTemplate.*;

public class MainDao {
	Properties prop = new Properties();
	
	public MainDao() {
		String fileName = BoardDao.class.getResource("/sql/main/main-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<BoardUpVo> selectBoardList(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset =  null;
		ArrayList<BoardUpVo> boardList = new ArrayList<>();
		String query = prop.getProperty("selectBoardList");
		
		try {
			pstmt = con.prepareStatement(query);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				BoardUpVo b = new BoardUpVo();
				b.setEnpNo(rset.getString("ENP_NO"));
				b.setBoardTitle(rset.getString("ENP_NAME"));
				b.setAddress(rset.getString("ENP_ADDRESS"));
				b.setFilePath(rset.getString("FILE_PATH"));
				b.setChangeName(rset.getString("CHANGE_NAME"));
				
				boardList.add(b);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return boardList;
	}

}
