package com.kh.semi.review.model.service;

import static com.kh.semi.common.JDBCTemplate.*;
import static com.kh.semi.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.kh.semi.admin.model.vo.PageInfo;
import com.kh.semi.review.model.dao.ReviewDao;
import com.kh.semi.review.model.vo.ReviewAttachment;
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

	public List<ReviewVO> getSelectedEnpVisitReviews(String enpNo) {
		Connection con = getConnection();
		List<ReviewVO> visitReviews = new ReviewDao().getSelectedEnpVisitReviews(con, enpNo);
		List<ReviewVO> visitReviewsWithFiles = new ReviewDao().getReviewFilePaths(con, visitReviews);
		
		close(con);
		
		return visitReviewsWithFiles;
	}

	public List<ReviewVO> getSelectedEnpNormalReviews(String enpNo) {
		Connection con = getConnection();
		List<ReviewVO> normalReviews = new ReviewDao().getSelectedEnpNormalReviews(con, enpNo);
		List<ReviewVO> normalReviewsWithFiles = new ReviewDao().getReviewFilePaths(con, normalReviews);
		
		close(con);
		
		return normalReviewsWithFiles;
	}

	public int insertReview(ReviewVO review, ArrayList<ReviewAttachment> fileList) {
		Connection con = getConnection();
		int result = 0;
		int result1 = 0;
		int result2 = 0;
		int result3 = 0;
		int result4 = 0;
		
		
		result1 = new ReviewDao().insertReview(con, review);
		System.out.println("result : " + result1);
		result3 = new ReviewDao().insertPoint(con, review);
		String pointNo = new ReviewDao().selectPointCurrval(con);
		if(result3 > 0) {
			result4 = new ReviewDao().insertPointHistory(con, pointNo, review);
			
		}
		if(result1 > 0) {
			
			String reviewNo = new ReviewDao().selectCurrval(con);
			System.out.println("reviewNo : " + reviewNo);
			for(int i = 0; i < fileList.size(); i++) {
				fileList.get(i).setReviewNo(reviewNo);
				review.setReviewNo(reviewNo);
				
				result2 += new ReviewDao().insertAttachment(con, fileList.get(i));
				
			}
		}
		
		System.out.println("result2 : " + result2);
		
		if(result1 > 0 && result2 == fileList.size() && result3 > 0 &result4 > 0) {
			commit(con);
			result = 1;
		} else {
			rollback(con);
		}
		
		close(con);
		return result;
	}

	public String[] checkVisit(String mNo, String enpNo) {
		Connection con = getConnection();
		String[] datas = new ReviewDao().checkVisit(con, mNo, enpNo);
		
		close(con);
		
		return datas;
	}

	public int getListCount() {
		Connection con = getConnection();
		int result = new ReviewDao().getListCount(con);
		
		close(con);
		
		return result;
	}

	public ArrayList<ReviewVO> selectList(PageInfo pi) {
		Connection con  = getConnection();
		ArrayList<ReviewVO> list = new ReviewDao().selectList(con, pi);
		
		close(con);
		
		return list;
	}

	public int deleteReview(String reviewNo) {
		Connection con = getConnection();
		int result = 0;
		int result2 = new ReviewDao().deleteAttachment(con, reviewNo);
		System.out.println("result2 : " + result2);
		
			int result1 = new ReviewDao().deleteReview(con, reviewNo);
		
			System.out.println("result : " + result1);
		
		if(result1 > 0 && result2 > 0) {
			commit(con);
			result = 1;
		} else {
			rollback(con);
		}
		
		return result;
	}

	public String getEnpName(String enpNo) {
		Connection con = getConnection();
		String enpName = new ReviewDao().getEnpName(con, enpNo);
		
		close(con);
		
		return enpName;
	}
}
