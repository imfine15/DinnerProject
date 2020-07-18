package com.kh.semi.enterprise.model.vo;

import java.sql.Date;

public class ForCmVO implements java.io.Serializable{
	 /*ENP_NO
     , R.REVIEW_NO
     , R.REVIEW_CONTENT
     , R.REVIEW_TYPE
     , R.VISIT_DATE
     , R.REVIEW_DATE
     , R.AVERAGE_RATING
     , RR.REPLY_CONTENT
     , MEMBER_NO
     , M.MEMBER_NAME
     , E.ENP_NAME 
     , M.MEMBER_NICKNAME
     , MF.FILE_NO     
     , MF.ORIGIN_NAME
     , MF.CHANGE_NAME
     , MF.FILE_PATH */
	private String enpNo;
	private String reviewNo;
	private String reviewContent;
	private String reviewType;
	private Date visitDate;
	private Date reviewDate;
	private double averageRating;
	private String replyContent;
	private String memberNo;
	private String memberName;
	private String enpName;
	private String memberNickname;
	private String fileNo;
	private String originName;
	private String changeName;
	private String filePath;
	
	public ForCmVO() {
		// TODO Auto-generated constructor stub
	}

	public ForCmVO(String enpNo, String reviewNo, String reviewContent, String reviewType, Date visitDate,
			Date reviewDate, double averageRating, String replyContent, String memberNo, String memberName,
			String enpName, String memberNickname, String fileNo, String originName, String changeName,
			String filePath) {
		super();
		this.enpNo = enpNo;
		this.reviewNo = reviewNo;
		this.reviewContent = reviewContent;
		this.reviewType = reviewType;
		this.visitDate = visitDate;
		this.reviewDate = reviewDate;
		this.averageRating = averageRating;
		this.replyContent = replyContent;
		this.memberNo = memberNo;
		this.memberName = memberName;
		this.enpName = enpName;
		this.memberNickname = memberNickname;
		this.fileNo = fileNo;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
	}

	public String getEnpNo() {
		return enpNo;
	}

	public void setEnpNo(String enpNo) {
		this.enpNo = enpNo;
	}

	public String getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(String reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public String getReviewType() {
		return reviewType;
	}

	public void setReviewType(String reviewType) {
		this.reviewType = reviewType;
	}

	public Date getVisitDate() {
		return visitDate;
	}

	public void setVisitDate(Date visitDate) {
		this.visitDate = visitDate;
	}

	public Date getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}

	public double getAverageRating() {
		return averageRating;
	}

	public void setAverageRating(double averageRating) {
		this.averageRating = averageRating;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getEnpName() {
		return enpName;
	}

	public void setEnpName(String enpName) {
		this.enpName = enpName;
	}

	public String getMemberNickname() {
		return memberNickname;
	}

	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}

	public String getFileNo() {
		return fileNo;
	}

	public void setFileNo(String fileNo) {
		this.fileNo = fileNo;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	@Override
	public String toString() {
		return "ForCmVO [enpNo=" + enpNo + ", reviewNo=" + reviewNo + ", reviewContent=" + reviewContent
				+ ", reviewType=" + reviewType + ", visitDate=" + visitDate + ", reviewDate=" + reviewDate
				+ ", averageRating=" + averageRating + ", replyContent=" + replyContent + ", memberNo=" + memberNo
				+ ", memberName=" + memberName + ", enpName=" + enpName + ", memberNickname=" + memberNickname
				+ ", fileNo=" + fileNo + ", originName=" + originName + ", changeName=" + changeName + ", filePath="
				+ filePath + "]";
	}
	
}
