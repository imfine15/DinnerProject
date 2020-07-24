package com.kh.semi.ad.model.service;

import static com.kh.semi.common.JDBCTemplate.*;
import static com.kh.semi.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.kh.semi.ad.model.dao.AdDao;
import com.kh.semi.ad.model.vo.AdVO;

public class AdService {

	public AdVO foundAllAd() {
		Connection con = getConnection();
		
		List<AdVO> adList = new AdDao().foundAllAd(con);
		int random = (int)(Math.random() * adList.size());
		AdVO randomAd = adList.get(random);
		
		close(con);
		
		return randomAd;
	}

	public int insertAd(AdVO ad) {
		Connection con = getConnection();
		int result = 0;
		int result1 = 0;
		
		
		
		
		String adCode = new AdDao().selectAdCode(con, ad);
		String adContent = new AdDao().selectAdContent(con, ad);
		
		ad.setAdCode(adCode);
		ad.setAdContent(adContent);
		
		result1 = new AdDao().insertAd(con, ad);
		
		
		if(result1 > 0 ) {
			commit(con);
		} else {
			rollback(con);
		}
		
		return result;
	}

}
