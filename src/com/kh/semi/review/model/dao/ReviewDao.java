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

	public List<ReviewVO> getSelectedEnpVisitReviews(Connection con, String enpNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("getEnpTypeReviews");
		List<ReviewVO> visitReviews = null;
		
		try {
			pstmt = con.prepareStatement(query);
			
			visitReviews = new ArrayList<>();
			
			pstmt.setString(1, enpNo);
			pstmt.setString(2, "방문");
			
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
				r.setReservationHistoryNo(rset.getString("RESERVATION_HISTORY_NO"));
				
				visitReviews.add(r);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return visitReviews;
	}

	public List<ReviewVO> getSelectedEnpNormalReviews(Connection con, String enpNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("getEnpTypeReviews");
		List<ReviewVO> normalReviews = null;
		
		try {
			pstmt = con.prepareStatement(query);
			
			normalReviews = new ArrayList<>();
			
			pstmt.setString(1, enpNo);
			pstmt.setString(2, "일반");
			
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
				r.setReservationHistoryNo(rset.getString("RESERVATION_HISTORY_NO"));
				
				normalReviews.add(r);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return normalReviews;
	}
	
	public List<ReviewVO> getReviewFilePaths(Connection con, List<ReviewVO> reviews) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("getReviewFiles");
		List<ReviewVO> reviewsWithFiles = null;
		
		try {
			pstmt = con.prepareStatement(query);
			
			reviewsWithFiles = new ArrayList<>();
			
			for(int i = 0; i < reviews.size(); i++) {
				String reviewNo = reviews.get(i).getReviewNo();

				pstmt.setString(1, reviewNo);
				
				rset = pstmt.executeQuery();
				
				String[] filePaths = new String[2];
				int j = 0;
				while(rset.next()) {
					filePaths[j] = rset.getString("FILE_PATH");
					j++;
				}
				
				reviews.get(i).setFilePaths(filePaths);
				
				reviewsWithFiles.add(reviews.get(i));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return reviewsWithFiles;
	}

	public String[] checkVisit(Connection con, String mNo, String enpNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("checkVisit");
		String[] datas = new String[3];
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, mNo);
			pstmt.setString(2, enpNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				datas[0] = rset.getString("RESERVATION_HISTORY_NO");
				datas[1] = rset.getString("VISIT_DATE");
				datas[2] = rset.getString("REVIEW_TYPE");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return datas;
	}
}
