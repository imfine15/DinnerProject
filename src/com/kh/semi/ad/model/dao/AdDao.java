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
				a.setAdTitle(rset.getString("AD_TITLE"));
				a.setAdPhone(rset.getString("AD_PHONE"));
				a.setAdEmail(rset.getString("AD_EMAIL"));
				a.setAdEnpName(rset.getString("AD_ENP_NAME"));
				a.setAdEnpAddress(rset.getString("AD_ENP_ADDRESS"));
				a.setAdEnpType(rset.getString("AD_ENP_TYPE"));
				a.setAdCode(rset.getString("AD_CODE"));
				a.setSearchPath(rset.getString("SEARCH_PATH"));
				a.setCounselContent(rset.getString("COUNSEL_CONTENT"));
				a.setAdContent(rset.getString("AD_CONTENT"));
				a.setAdWebsite(rset.getString("AD_WEBSITE"));
				a.setFilePath(rset.getString("FILE_PATH"));
				
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
}
