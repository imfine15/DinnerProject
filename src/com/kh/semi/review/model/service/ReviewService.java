package com.kh.semi.review.model.service;

import static com.kh.semi.common.JDBCTemplate.close;
import static com.kh.semi.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.kh.semi.review.model.dao.ReviewDao;
import com.kh.semi.review.model.vo.ReviewVO;

public class ReviewService {
	public int countReview(String enpNo) {
		Connection con = getConnection();
		int count = new ReviewDao().countReview(con,enpNo);
		
		close(con);
		
		return count;
	}
	
	public int countTypeReview(String enpNo, String type) {
		Connection con = getConnection();
		int count = new ReviewDao().countTypeReview(con, enpNo, type);
		
		close(con);
		
		return count;
	}

	public List<ReviewVO> getSelectedEnpReviews(String enpNo) {
		Connection con = getConnection();
		List<ReviewVO> reviews = new ReviewDao().getSelectedEnpReviews(con, enpNo);
		List<ReviewVO> reviewsWithFiles = new ReviewDao().getReviewFilePaths(con, reviews);
		
		close(con);
		
		return reviewsWithFiles;
	}
}
