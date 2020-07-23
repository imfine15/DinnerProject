package com.kh.semi.board.model.vo;

import java.util.Date;

public class History implements java.io.Serializable {

	private String uploadNo;
	private String boardNo;
	private String statusCode;
	private Date uploadDate;
	
	public History() {}

	public History(String uploadNo, String boardNo, String statusCode, Date uploadDate) {
		super();
		this.uploadNo = uploadNo;
		this.boardNo = boardNo;
		this.statusCode = statusCode;
		this.uploadDate = uploadDate;
	}

	public String getUploadNo() {
		return uploadNo;
	}

	public void setUploadNo(String uploadNo) {
		this.uploadNo = uploadNo;
	}

	public String getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(String boardNo) {
		this.boardNo = boardNo;
	}

	public String getStatusCode() {
		return statusCode;
	}

	public void setStatusCode(String statusCode) {
		this.statusCode = statusCode;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	@Override
	public String toString() {
		return "History [uploadNo=" + uploadNo + ", boardNo=" + boardNo + ", statusCode=" + statusCode + ", uploadDate="
				+ uploadDate + "]";
	}
	
	
}
