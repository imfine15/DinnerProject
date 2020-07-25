package com.kh.semi.manager.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.semi.admin.model.vo.PageInfo;
import com.kh.semi.manager.model.vo.ManagerVo;
import static com.kh.semi.common.JDBCTemplate.*;

public class ManagerDao {
	Properties prop = new Properties();
	
	public ManagerDao() {
		String fileName = ManagerDao.class.getResource("/sql/manager/manager-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertManager(Connection con, ManagerVo manager) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertManager");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, manager.getJobCode());
			pstmt.setString(2, manager.getDeptCode());
			pstmt.setString(3, manager.getManagerName());
			pstmt.setString(4, manager.getManagerPhone());
			pstmt.setString(5, manager.getManagerEmail());
			pstmt.setString(6, manager.getManagerId());
			pstmt.setString(7, manager.getManagerPwd());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
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

	public ArrayList<ManagerVo> selectList(Connection con, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ManagerVo> list = null;
		ManagerVo ma;
		
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
				ma = new ManagerVo();
				ma.setManagerNo(rset.getString("MANAGER_NO"));
				ma.setManagerName(rset.getString("MANAGER_NAME"));
				ma.setManagerPhone(rset.getString("MANAGER_PHONE"));
				ma.setManagerEmail(rset.getString("MANAGER_EMAIL"));
				ma.setManagerStatus(rset.getString("MANAGER_STATUS"));
				ma.setManagerId(rset.getString("MANAGER_ID"));
				ma.setJobName(rset.getString("JOB_NAME"));
				ma.setDeptTitle(rset.getString("DEPT_TITLE"));
				
				list.add(ma);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}

	public int deleteManager(Connection con, ManagerVo manager) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteManager");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, manager.getManagerNo());
			
			result = pstmt.executeUpdate();
			
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}
	
	
	
	
}
