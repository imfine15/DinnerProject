package com.kh.semi.notice.model.vo;

import java.util.Date;

public class AdminNoticeVO {

	private String noticeNo;
	private String managerNo;
	private String noticeTitle;
	private Date noticeDate;
	private String noticeContent;
	private String noticeTypeCode;
	
	public AdminNoticeVO() {}

	public AdminNoticeVO(String noticeNo, String managerNo, String noticeTitle, Date noticeDate, String noticeContent,
			String noticeTypeCode) {
		super();
		this.noticeNo = noticeNo;
		this.managerNo = managerNo;
		this.noticeTitle = noticeTitle;
		this.noticeDate = noticeDate;
		this.noticeContent = noticeContent;
		this.noticeTypeCode = noticeTypeCode;
	}

	public String getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(String noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getManagerNo() {
		return managerNo;
	}

	public void setManagerNo(String managerNo) {
		this.managerNo = managerNo;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public Date getNoticeDate() {
		return noticeDate;
	}

	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public String getNoticeTypeCode() {
		return noticeTypeCode;
	}

	public void setNoticeTypeCode(String noticeTypeCode) {
		this.noticeTypeCode = noticeTypeCode;
	}

	@Override
	public String toString() {
		return "AdminNoticeVO [noticeNo=" + noticeNo + ", managerNo=" + managerNo + ", noticeTitle=" + noticeTitle
				+ ", noticeDate=" + noticeDate + ", noticeContent=" + noticeContent + ", noticeTypeCode="
				+ noticeTypeCode + "]";
	}
	
}
