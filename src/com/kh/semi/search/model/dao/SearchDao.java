package com.kh.semi.search.model.dao;

import static com.kh.semi.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import com.kh.semi.board.model.vo.BoardVO;
import com.kh.semi.enterprise.model.vo.EnpVO;
import com.kh.semi.search.model.vo.PageInfo;

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
	
	public ArrayList<EnpVO> searchEnp(Connection con, PageInfo pi, String search) {
		ArrayList<EnpVO> enpList = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("getEnpList");
		
		try {
			pstmt = con.prepareStatement(query);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
			int endRow = startRow + pi.getLimit() - 1;
			
			pstmt.setString(1, search);
			pstmt.setString(2, search);
			pstmt.setString(3, search);
			pstmt.setInt(4, startRow);
			pstmt.setInt(5, endRow);
			
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
				e.setChangeName(rset.getString("CHANGE_NAME"));
				e.setFilePath(rset.getString("FILE_PATH"));
				e.setMenuName(rset.getString("MENU_NAME"));
				e.setMenuPrice(rset.getInt("MENU_PRICE"));
				
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

	public List<EnpVO> searchKeyword(Connection con, PageInfo pi, String[] words) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("searchKeyword");
		ArrayList<EnpVO> enpList = null;
		
		try {
			enpList = new ArrayList<>();
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
			int endRow = startRow + pi.getLimit() - 1;
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, words[0]); // 검색어
			pstmt.setString(2, words[0]); // 검색어
			pstmt.setString(3, words[0]); // 검색어
			pstmt.setString(4, words[1]); // 키워드
			pstmt.setInt(5, startRow); // 검색어
			pstmt.setInt(6, endRow); // 검색어
			
			rset = pstmt.executeQuery();
			
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
				e.setChangeName(rset.getString("CHANGE_NAME"));
				e.setFilePath(rset.getString("FILE_PATH"));
				e.setMenuName(rset.getString("MENU_NAME"));
				e.setMenuPrice(rset.getInt("MENU_PRICE"));
				
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

	public Map<String, Integer> getSelectedEnpMenus(Connection con, String enpNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectedEnpMenus");
		Map<String, Integer> menus = null;
		
		try {
			menus = new LinkedHashMap<>();
			
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, enpNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				menus.put(rset.getString("MENU_NAME"), rset.getInt("MENU_PRICE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return menus;
	}

	public int getEnpCount(Connection con, String search) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		String query = prop.getProperty("getEnpCount");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, search);
			pstmt.setString(2, search);
			pstmt.setString(3, search);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
 			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}

	public int getEnpCount(Connection con, String[] words) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int listCount = 0;
		String query = prop.getProperty("getEnpKeywordCount");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, words[0]);
			pstmt.setString(2, words[1]);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
 			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}

	public ArrayList<BoardVO> getBestCourse(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("getBestCourse");
		ArrayList<BoardVO> bestCourse = null;
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, "코스");
			
			rset = pstmt.executeQuery();
			
			bestCourse = new ArrayList<>();
			for(int i = 0; i < 2; i++) {
				rset.next();
				
				BoardVO b = new BoardVO();
				
				b.setBoardNo(rset.getString("BOARD_NO"));
				b.setBoardTitle(rset.getString("BOARD_TITLE"));
				b.setMemberNo(rset.getString("MEMBER_NO"));
				b.setManagerNo(rset.getString("MANAGER_NO"));
				b.setBoardKeyword(rset.getString("BOARD_KEYWORD"));
				b.setBoardContent(rset.getString("BOARD_CONTENT"));;
				b.setBoardCategory(rset.getString("BOARD_CATEGORY"));
				b.setEnpNo(rset.getString("ENP_NO"));
				b.setViewCount(rset.getInt("VIEW_COUNT"));
				b.setHashTags(rset.getString("HASH_TAGS"));
				b.setLikeCount(rset.getInt("LIKE_COUNT"));
				
				b.setUploadNo(rset.getString("UPLOAD_NO"));
				b.setStatusName(rset.getString("STATUS_NAME"));
				b.setUploadDate(rset.getDate("UPLOAD_DATE"));
				
				bestCourse.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return bestCourse;
	}

	public ArrayList<BoardVO> getBestFile(Connection con, ArrayList<BoardVO> bestCourse) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("getBestFile");
		
		try {
			pstmt = con.prepareStatement(query);
			for(int i = 0; i < 2; i++) {
				pstmt.setString(1, bestCourse.get(i).getBoardNo());
				
				rset = pstmt.executeQuery();
				
				int j = 0;
				String[] temp = new String[2];
				while(rset.next()) {
					temp[j] = "/semiproject/thumbnail_uploadFile/" + rset.getString("CHANGE_NAME");
					j++;
				}
				
				bestCourse.get(i).setFilePaths(temp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return bestCourse;
	}

	public int likeConfirm(Connection con, String enpNo, String mNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("likeConfirm");
		int count = 0;
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, enpNo);
			pstmt.setString(2, mNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return count;
	}

	// LIKE_HISTORY 테이블에 내역 저장
	public int doLike(Connection con, String enpNo, String mNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("doLike");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, enpNo);
			pstmt.setString(2, mNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} close(pstmt);
		
		return result;
	}

	public int getPreLike(Connection con, String enpNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int previousLikeCount = 0;
		String query = prop.getProperty("getPreLike");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, enpNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				previousLikeCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return previousLikeCount;
	}

	public int likeUpdate(Connection con, int previousLikeCount, String enpNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("likeUpdate");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, previousLikeCount + 1);
			pstmt.setString(2, enpNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int getLikeCount(Connection con, String enpNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("getLikeCount");
		int likeCount = 0;
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, enpNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				likeCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return likeCount;
	}

	public String findId(Connection con, String requestName, String requestEmail) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("findId");
		String responseId = "";
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, requestName);
			pstmt.setString(2, requestEmail);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				responseId = rset.getString("MEMBER_ID");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return responseId;
	}

	public int checkMemberPwd(Connection con, String[] datas) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("checkMemberPwd");
		int check = 0;
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, datas[0]); // id
			pstmt.setString(2, datas[1]); // name
			pstmt.setString(3, datas[2]); // email
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				check = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return check;
	}

	public int changePassword(Connection con, String[] datas) {
		PreparedStatement pstmt = null;
		String query = prop.getProperty("changePassword");
		int result = 0;
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, datas[0]); // password
			pstmt.setString(2, datas[1]); // id
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public EnpVO getRating(Connection con, EnpVO selectedEnp) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("getRating");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, selectedEnp.getEnpNo());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				selectedEnp.setRating(rset.getDouble(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return selectedEnp;
	}

}
