package com.kh.semi.notice.model.vo;

import java.util.Date;

public class NoticeVO implements java.io.Serializable {
	
	private String noticeNo;
	private String magagerNo;
	private String noticeTitle;
	private Date noticeDate;
	private String noticeContent;
	private String noticeType;
	
	public NoticeVO() {}

	public NoticeVO(String noticeNo, String magagerNo, String noticeTitle, Date noticeDate, String noticeContent,
			String noticeType) {
		super();
		this.noticeNo = noticeNo;
		this.magagerNo = magagerNo;
		this.noticeTitle = noticeTitle;
		this.noticeDate = noticeDate;
		this.noticeContent = noticeContent;
		this.noticeType = noticeType;
	}

	public String getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(String noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getMagagerNo() {
		return magagerNo;
	}

	public void setMagagerNo(String magagerNo) {
		this.magagerNo = magagerNo;
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

	public String getNoticeType() {
		return noticeType;
	}

	public void setNoticeType(String noticeType) {
		this.noticeType = noticeType;
	}

	@Override
	public String toString() {
		return "NoticeVO [noticeNo=" + noticeNo + ", magagerNo=" + magagerNo + ", noticeTitle=" + noticeTitle
				+ ", noticeDate=" + noticeDate + ", noticeContent=" + noticeContent + ", noticeType=" + noticeType
				+ "]";
	}
	
	
}

