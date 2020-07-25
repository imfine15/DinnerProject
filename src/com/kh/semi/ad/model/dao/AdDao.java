package com.kh.semi.ad.model.dao;

import static com.kh.semi.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.kh.semi.ad.model.vo.AdVO;
import com.kh.semi.admin.model.vo.PageInfo;

public class AdDao {
	Properties prop = new Properties();
	
	public AdDao() {
		String fileName = AdDao.class.getResource("/sql/ad/ad-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public List<AdVO> foundAllAd(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		List<AdVO> adList = null;
		String query = prop.getProperty("foundAllAd");
		
		try {
			adList = new ArrayList<>();
			
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				AdVO a = new AdVO();
				
				a.setAdNo(rset.getString("AD_NO"));
				a.setAdTitle(rset.getString("AD_NAME"));
				a.setAdPhone(rset.getString("AD_PHONE"));
				a.setAdEmail(rset.getString("AD_EMAIL"));
				a.setAdEnpName(rset.getString("AD_ENP_NAME"));
				a.setAdEnpAddress(rset.getString("AD_ENP_ADDRESS"));
				a.setAdEnpType(rset.getString("AD_ENP_TYPE"));
				a.setAdCode(rset.getString("AD_CODE"));
				a.setSearchPath(rset.getString("SEARCH_PATH"));
				a.setCounselContent(rset.getString("COUNSEL_CONTENT"));
				a.setAdContent(rset.getString("AD_CONTENT"));
				
				adList.add(a);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return adList;
	}

	public int insertAd(Connection con, AdVO ad) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertAd");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, ad.getAdName());
			pstmt.setString(2, ad.getAdPhone());
			pstmt.setString(3, ad.getAdEmail());
			pstmt.setString(4, ad.getAdEnpName());
			pstmt.setString(5, ad.getAdEnpAddress());
			pstmt.setString(6, ad.getAdEnpType());
			pstmt.setString(7, ad.getAdCode());
			pstmt.setString(8, ad.getSearchPath());
			pstmt.setString(9, ad.getCounselContent());
			pstmt.setString(10, ad.getAdContent());
			
			result = pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public String selectAdCode(Connection con, AdVO ad) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String adCode = "";
		
		String query = prop.getProperty("selectAdCode");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, ad.getAdType());
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				adCode = rset.getString("AD_CODE");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return adCode;
	}

	public String selectAdContent(Connection con, AdVO ad) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String adContent = "";
		
		String query = prop.getProperty("selectAdContent");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, ad.getAdType());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				adContent = rset.getString("AD_DETAIL");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		
		return adContent;
	}

	public int getListCount(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		String query = prop.getProperty("getListCount");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		
		return listCount;
	}

	public ArrayList<AdVO> selectList(Connection con, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<AdVO> list = null;
		AdVO ad;
		
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
				ad = new AdVO();
				ad.setAdNo(rset.getString("AD_NO"));
				ad.setAdName(rset.getString("AD_NAME"));
				ad.setAdPhone(rset.getString("AD_PHONE"));
				ad.setAdEmail(rset.getString("AD_EMAIL"));
				ad.setAdEnpName(rset.getString("AD_ENP_NAME"));
				ad.setAdEnpAddress(rset.getString("AD_ENP_ADDRESS"));
				ad.setAdEnpType(rset.getString("AD_ENP_TYPE"));
				ad.setAdCode(rset.getString("AD_CODE"));
				ad.setSearchPath(rset.getString("SEARCH_PATH"));
				ad.setCounselContent(rset.getString("COUNSEL_CONTENT"));
				ad.setAdContent(rset.getString("AD_CONTENT"));
				ad.setManagerNo(rset.getString("MANAGER_NO"));
				ad.setAdTitle(rset.getString("AD_TITLE"));
				
				list.add(ad);
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

	public AdVO selecOneAd(Connection con, String adNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		AdVO ad = null;
		
		String query = prop.getProperty("selectOneAd");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, adNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				ad = new AdVO();
				ad.setAdNo(rset.getString("AD_NO"));
				ad.setAdName(rset.getString("AD_NAME"));
				ad.setAdPhone(rset.getString("AD_PHONE"));
				ad.setAdEmail(rset.getString("AD_EMAIL"));
				ad.setAdEnpName(rset.getString("AD_ENP_NAME"));
				ad.setAdEnpAddress(rset.getString("AD_ENP_ADDRESS"));
				ad.setAdEnpType(rset.getString("AD_ENP_TYPE"));
				ad.setAdCode(rset.getString("AD_CODE"));
				ad.setSearchPath(rset.getString("SEARCH_PATH"));
				ad.setCounselContent(rset.getString("COUNSEL_CONTENT"));
				ad.setAdContent(rset.getString("AD_CONTENT"));
				ad.setManagerNo(rset.getString("MANAGER_NO"));
				ad.setAdTitle(rset.getString("AD_TITLE"));
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		
		return ad;
	}
}
