package com.kh.semi.board.model.vo;

import java.util.Arrays;

public class BoardVO implements java.io.Serializable {
	private String boardNo; // 게시글번호
	private String boardTitle; // 게시글제목
	private String memberNo; // 회원번호
	private String managerNo; // 관리자번호
	private String boardKeyword; // 키워드(한식, 양식,...)
	private String boardContent; // 게시글내용
	private String boardCategory;// 카테고리(맛집, 코스)
	private String enpNo; // 업체번호
	private int viewCount; // 조회수
	private String hashTags; // 해시태그
	private String courseNo; // 코스게시글번호
	private String[] filePaths; // 파일경로들
	
	public BoardVO() {}

	public BoardVO(String boardNo, String boardTitle, String memberNo, String managerNo, String boardKeyword,
			String boardContent, String boardCategory, String enpNo, int viewCount, String hashTags, String courseNo,
			String[] filePaths) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.memberNo = memberNo;
		this.managerNo = managerNo;
		this.boardKeyword = boardKeyword;
		this.boardContent = boardContent;
		this.boardCategory = boardCategory;
		this.enpNo = enpNo;
		this.viewCount = viewCount;
		this.hashTags = hashTags;
		this.courseNo = courseNo;
		this.filePaths = filePaths;
	}

	public String getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(String boardNo) {
		this.boardNo = boardNo;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	public String getManagerNo() {
		return managerNo;
	}

	public void setManagerNo(String managerNo) {
		this.managerNo = managerNo;
	}

	public String getBoardKeyword() {
		return boardKeyword;
	}

	public void setBoardKeyword(String boardKeyword) {
		this.boardKeyword = boardKeyword;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public String getBoardCategory() {
		return boardCategory;
	}

	public void setBoardCategory(String boardCategory) {
		this.boardCategory = boardCategory;
	}

	public String getEnpNo() {
		return enpNo;
	}

	public void setEnpNo(String enpNo) {
		this.enpNo = enpNo;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	public String getHashTags() {
		return hashTags;
	}

	public void setHashTags(String hashTags) {
		this.hashTags = hashTags;
	}

	public String getCourseNo() {
		return courseNo;
	}

	public void setCourseNo(String courseNo) {
		this.courseNo = courseNo;
	}

	public String[] getFilePaths() {
		return filePaths;
	}

	public void setFilePaths(String[] filePaths) {
		this.filePaths = filePaths;
	}

	@Override
	public String toString() {
		return "BoardVO [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", memberNo=" + memberNo + ", managerNo="
				+ managerNo + ", boardKeyword=" + boardKeyword + ", boardContent=" + boardContent + ", boardCategory="
				+ boardCategory + ", enpNo=" + enpNo + ", viewCount=" + viewCount + ", hashTags=" + hashTags
				+ ", courseNo=" + courseNo + ", filePaths=" + Arrays.toString(filePaths) + "]";
	}

}