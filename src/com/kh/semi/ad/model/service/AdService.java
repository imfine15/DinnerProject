package com.kh.semi.ad.model.service;

import static com.kh.semi.common.JDBCTemplate.close;
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

}
