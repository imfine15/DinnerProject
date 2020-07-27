package com.kh.semi.search.model.service;

import static com.kh.semi.common.JDBCTemplate.close;
import static com.kh.semi.common.JDBCTemplate.commit;
import static com.kh.semi.common.JDBCTemplate.getConnection;
import static com.kh.semi.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kh.semi.board.model.vo.BoardVO;
import com.kh.semi.enterprise.model.vo.EnpVO;
import com.kh.semi.search.model.dao.SearchDao;
import com.kh.semi.search.model.vo.PageInfo;

public class SearchService {
	public List<EnpVO> searchKeyword(PageInfo pi, String[] words) {
		Connection con = getConnection();
		List<EnpVO> enpList = new SearchDao().searchKeyword(con, pi, words);
		ArrayList<EnpVO> enpListWithRating = new SearchDao().getRating(con, (ArrayList<EnpVO>)enpList);
		
		close(con);
		
		return enpListWithRating;
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

	public ArrayList<BoardVO> getBestCourse() {
		Connection con = getConnection();
		ArrayList<BoardVO> bestCourse = new SearchDao().getBestCourse(con);
		ArrayList<BoardVO> bestCourseDetail = new SearchDao().getBestFile(con, bestCourse);
		
		close(con);
		
		return bestCourseDetail;
	}

	public int doLike(String enpNo, String mNo) {
		Connection con = getConnection();
		// 좋아요를 이미 눌렀는지, 아닌지 검증
		int count1 = new SearchDao().likeConfirm(con, enpNo, mNo);
		
		int count2 = 0;
		if(count1 > 0) {
			// 이미 좋아요를 누른 상태일경우
			count2 = 0;
		} else {
			// 아직 좋아요를 누르지 않은 상태일 경우
			count2 = new SearchDao().doLike(con, enpNo, mNo);
		}
		
		int previousLikeCount = 0;
		int result = 0;
		if(count2 > 0) {
			previousLikeCount = new SearchDao().getPreLike(con, enpNo);
			
			result = new SearchDao().likeUpdate(con, previousLikeCount, enpNo);
		}
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		return result;
	}

	public int getLikeCount(String enpNo) {
		Connection con = getConnection();
		int likeCount = new SearchDao().getLikeCount(con, enpNo);
		
		close(con);
		
		return likeCount;
	}

	public String findId(String requestName, String requestEmail) {
		Connection con = getConnection();
		String responseId = new SearchDao().findId(con, requestName, requestEmail);
		
		close(con);
		
		return responseId;
	}

	public int checkMemberPwd(String[] datas) {
		Connection con = getConnection();
		int check = new SearchDao().checkMemberPwd(con, datas);
		
		close(con);
		
		return check;
	}

	public int changePassword(String[] datas) {
		Connection con = getConnection();
		int result = new SearchDao().changePassword(con, datas);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		return result;
	}

	public EnpVO getRating(EnpVO selectedEnp) {
		Connection con = getConnection();
		EnpVO selectedEnpWithRating = new SearchDao().getRating(con, selectedEnp);
		
		close(con);
		
		return selectedEnpWithRating;
	}

}
