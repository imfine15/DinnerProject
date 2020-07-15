package com.kh.semi.search.model.service;

import static com.kh.semi.common.JDBCTemplate.close;
import static com.kh.semi.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.kh.semi.enterprise.model.vo.EnpVO;
import com.kh.semi.search.model.dao.SearchDao;

public class SearchService {
	public ArrayList<EnpVO> searchEnp(String search) {
		Connection con = getConnection();
		ArrayList<EnpVO> normalEnpList = new SearchDao().searchEnp(con, search);
		ArrayList<EnpVO> partnerEnpList = new SearchDao().searchPartner(con, normalEnpList);
		
		close(con);
		
		return partnerEnpList;
	}

	public List<HashMap<String, Integer>> getMenus(List<EnpVO> enpList) {
		Connection con = getConnection();
		List<HashMap<String, Integer>> enpMenus = new SearchDao().getMenus(con, enpList);
		
		close(con);
		
		return enpMenus;
	}
}
