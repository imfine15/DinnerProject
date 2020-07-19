package com.kh.semi.review.model.dao;

import static com.kh.semi.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.kh.semi.review.model.vo.ReviewVO;

public class ReviewDao {
	Properties prop = new Properties();
	
	public ReviewDao() {
		String fileName = ReviewDao.class.getResource("/sql/review/review-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int countReview(Connection con, String enpNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("countReview");
		int count = 0;
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, enpNo);
			
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

	public int countTypeReview(Connection con, String enpNo, String type) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("countTypeReview");
		int count = 0;
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, enpNo);
			pstmt.setString(2, type);
			
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

	public List<ReviewVO> getSelectedEnpReviews(Connection con, String enpNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("getEnpReviews");
		List<ReviewVO> reviews = null;
		
		try {
			pstmt = con.prepareStatement(query);
			
			reviews = new ArrayList<>();
			
			pstmt.setString(1, enpNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				ReviewVO r = new ReviewVO();
				r.setReviewNo(rset.getString("REVIEW_NO"));
				r.setReviewContent(rset.getString("REVIEW_CONTENT"));
				r.setMemberNo(rset.getString("MEMBER_NO"));
				r.setReviewDate(rset.getDate("REVIEW_DATE"));
				r.setReviewType(rset.getString("REVIEW_TYPE"));
				r.setEnpNo(rset.getString("ENP_NO"));
				r.setVisitDate(rset.getDate("VISIT_DATE"));
				r.setAverageRating(rset.getDouble("AVERAGE_RATING"));
				r.setReservationHistoryNo(rset.getString("RESETVATION_HISTORY_NO"));
				
				reviews.add(r);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return reviews;
	}

	public List<ReviewVO> getReviewFilePaths(Connection con, List<ReviewVO> reviews) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("getReviewFiles");
		List<ReviewVO> reviewsWithFiles = null;
		
		try {
			pstmt = con.prepareStatement(query);
			
			reviewsWithFiles = new ArrayList<>();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return reviewsWithFiles;
	}
}
