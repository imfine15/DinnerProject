package com.kh.semi.search.model.dao;

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
import java.util.HashMap;
import java.util.List;
import java.util.Properties;

import com.kh.semi.enterprise.model.vo.EnpVO;

public class SearchDao {
	Properties prop = new Properties();
	
	public SearchDao() {
		String fileName = SearchDao.class.getResource("/sql/search/search-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<EnpVO> searchEnp(Connection con, String search) {
		ArrayList<EnpVO> enpList = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("searchEnp");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, search);
			rset = pstmt.executeQuery();
			enpList = new ArrayList<>();
			
			while(rset.next()) {
				EnpVO e = new EnpVO();
				
				e.setEnpNo(rset.getString("ENP_NO"));
				e.setEnpName(rset.getString("ENP_NAME"));
				e.setEnpPhone(rset.getString("ENP_PHONE"));
				e.setEnpAddress(rset.getString("ENP_ADDRESS"));
				e.setEnpHour(rset.getString("ENP_HOUR"));
				e.setEnpType(rset.getString("ENP_TYPE"));
				e.setEnpStatus(rset.getString("ENP_STATUS"));
				e.setEnpPartnerType(rset.getString("ENP_PARTNER_TYPE"));
				e.setHashTags(rset.getString("HASH_TAGS"));
				e.setPriceRange(rset.getString("PRICE_RANGE"));
				e.setClosedDay(rset.getString("CLOSED_DAY"));
				e.setWebsite(rset.getString("WEBSITE"));
				e.setIntroduce(rset.getString("INTRODUCE"));
				e.setParkingPossible(rset.getString("PARKING_POSSIBLE"));
				
				if(rset.getString("ENP_PARTNER_TYPE").equals("PARTNER")) {
					e.setEnpRegisterNo(rset.getString("ENP_REGISTER_NO"));
					e.setPartnerCode(rset.getString("PARTNER_CODE"));
					e.setPartnerCode(rset.getString("PARTNER_CODE"));
					e.setPenaltyCount(rset.getInt("PENALTY_COUNT"));
					e.setPartnerId(rset.getString("PARTNER_ID"));
					e.setPartnerPwd(rset.getString("PARTNER_PWD"));
					e.setPartnerEmail(rset.getString("PARTNER_EMAIL"));
					e.setPartnerName(rset.getString("PARTNER_NAME"));
					e.setAccountHolder(rset.getString("ACCOUNT_HOLDER"));
					e.setBank(rset.getString("BANK"));
					e.setBankAccount(rset.getString("BANK_ACCOUNT"));
					e.setDepositLowerLimit(rset.getInt("DEPOSIT_LOWER_LIMIT"));
					e.setDepositHigherLimit(rset.getInt("DEPOSIT_HIGHER_LIMIT"));
					e.setSignupApproval(rset.getString("SIGNUP_APPROVAL"));
					e.setJuminNo(rset.getString("JUMIN_NO"));
					e.setEnpLicense(rset.getString("ENP_LICENCE"));
				}
				
				enpList.add(e);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return enpList;
	}

	public List<HashMap<String, Integer>> getMenus(Connection con, List<EnpVO> enpList) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Integer> enpMenuMap = null;
		List<HashMap<String, Integer>> enpMenus = null;
		String query = prop.getProperty("getMenus");
		
		try {
			enpMenus = new ArrayList<>();
			pstmt = con.prepareStatement(query);
			
			for(int i = 0; i < enpList.size(); i++) {
				enpMenuMap = new HashMap<>();
				
				pstmt.setString(1, enpList.get(i).getEnpNo());
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					enpMenuMap.put(rset.getString("MENU_NAME"), rset.getInt("MENU_PRICE"));
				}
				
				enpMenus.add(enpMenuMap);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return enpMenus;
	}

	public ArrayList<EnpVO> getRating(Connection con, ArrayList<EnpVO> enpList) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("getRating");
		ArrayList<EnpVO> enpListWithRating = null;
		
		try {
			enpListWithRating = new ArrayList<>();
			
			for(EnpVO e : enpList) {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, e.getEnpNo());
				
				rset = pstmt.executeQuery();
				if(e.getEnpPartnerType().equals("PARTNER")) {
					if(rset.next()) {
						e.setRating(rset.getDouble(1));
					}
				}
				
				enpListWithRating.add(e);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return enpListWithRating;
	}

}