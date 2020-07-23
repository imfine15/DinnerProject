package com.kh.semi.search.model.service;

import static com.kh.semi.common.JDBCTemplate.close;
import static com.kh.semi.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kh.semi.enterprise.model.vo.EnpVO;
import com.kh.semi.search.model.dao.SearchDao;
import com.kh.semi.search.model.vo.PageInfo;

public class SearchService {
//	public ArrayList<EnpVO> searchEnp(String search) {
//		Connection con = getConnection();
//		ArrayList<EnpVO> enpList = new SearchDao().searchEnp(con, search);
//		
//		ArrayList<EnpVO> enpListWithRating = new SearchDao().getRating(con, enpList);
//		
//		close(con);
//		
//		return enpListWithRating;
//	}

	public List<HashMap<String, Integer>> getMenus(List<EnpVO> enpList) {
		Connection con = getConnection();
		List<HashMap<String, Integer>> enpMenus = new SearchDao().getMenus(con, enpList);
		
		close(con);
		
		return enpMenus;
	}

	public List<EnpVO> searchKeyword(String[] words) {
		Connection con = getConnection();
		List<EnpVO> enpList = new SearchDao().searchKeyword(con, words);
		
		close(con);
		
		return enpList;
	}

	public Map<String, Integer> getSelectedEnpMenus(String enpNo) {
		Connection con = getConnection();
		Map<String, Integer> menus = new SearchDao().getSelectedEnpMenus(con, enpNo);
		
		close(con);
		
		return menus;
	}

	public ArrayList<EnpVO> searchEnp(PageInfo pi, String search) {
		Connection con = getConnection();
		
		ArrayList<EnpVO> enpList = new SearchDao().searchEnp(con, pi, search);
		ArrayList<EnpVO> enpListWithRating = new SearchDao().getRating(con, enpList);
		
		close(con);
		
		return enpListWithRating;
	}

	public int getEnpCount(String search) {
		Connection con = getConnection();
		int listCount = new SearchDao().getEnpCount(con, search);
		
		close(con);
		
		return listCount;
	}

	public int getEnpCount(String[] words) {
		Connection con = getConnection();
		int listCount = new SearchDao().getEnpCount(con, words);
		
		close(con);
		
		return listCount;
	}

}
