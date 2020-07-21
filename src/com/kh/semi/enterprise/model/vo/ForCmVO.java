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
	private String filePath1;
	private String filePath2;
	/*, RF.ORIGIN_NAME
    , RF.CHANGE_NAME
    , RF.UPLOAD_DATE*/
	private String rfOriginName1;
	private String rfOriginName2;
	private String rfChangeName1;
	private String rfChangeName2;
	private Date rfUploadDate;
	
	public ForCmVO() {
		// TODO Auto-generated constructor stub
	}

	public ForCmVO(String enpNo, String reviewNo, String reviewContent, String reviewType, Date visitDate,
			Date reviewDate, double averageRating, String replyContent, String memberNo, String memberName,
			String enpName, String memberNickname, String fileNo, String originName, String changeName,
			String filePath1, String filePath2, String rfOriginName1, String rfOriginName2, String rfChangeName1,
			String rfChangeName2, Date rfUploadDate) {
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
		this.filePath1 = filePath1;
		this.filePath2 = filePath2;
		this.rfOriginName1 = rfOriginName1;
		this.rfOriginName2 = rfOriginName2;
		this.rfChangeName1 = rfChangeName1;
		this.rfChangeName2 = rfChangeName2;
		this.rfUploadDate = rfUploadDate;
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

	public String getFilePath1() {
		return filePath1;
	}

	public void setFilePath1(String filePath1) {
		this.filePath1 = filePath1;
	}

	public String getFilePath2() {
		return filePath2;
	}

	public void setFilePath2(String filePath2) {
		this.filePath2 = filePath2;
	}

	public String getRfOriginName1() {
		return rfOriginName1;
	}

	public void setRfOriginName1(String rfOriginName1) {
		this.rfOriginName1 = rfOriginName1;
	}

	public String getRfOriginName2() {
		return rfOriginName2;
	}

	public void setRfOriginName2(String rfOriginName2) {
		this.rfOriginName2 = rfOriginName2;
	}

	public String getRfChangeName1() {
		return rfChangeName1;
	}

	public void setRfChangeName1(String rfChangeName1) {
		this.rfChangeName1 = rfChangeName1;
	}

	public String getRfChangeName2() {
		return rfChangeName2;
	}

	public void setRfChangeName2(String rfChangeName2) {
		this.rfChangeName2 = rfChangeName2;
	}

	public Date getRfUploadDate() {
		return rfUploadDate;
	}

	public void setRfUploadDate(Date rfUploadDate) {
		this.rfUploadDate = rfUploadDate;
	}

	@Override
	public String toString() {
		return "ForCmVO [enpNo=" + enpNo + ", reviewNo=" + reviewNo + ", reviewContent=" + reviewContent
				+ ", reviewType=" + reviewType + ", visitDate=" + visitDate + ", reviewDate=" + reviewDate
				+ ", averageRating=" + averageRating + ", replyContent=" + replyContent + ", memberNo=" + memberNo
				+ ", memberName=" + memberName + ", enpName=" + enpName + ", memberNickname=" + memberNickname
				+ ", fileNo=" + fileNo + ", originName=" + originName + ", changeName=" + changeName + ", filePath1="
				+ filePath1 + ", filePath2=" + filePath2 + ", rfOriginName1=" + rfOriginName1 + ", rfOriginName2="
				+ rfOriginName2 + ", rfChangeName1=" + rfChangeName1 + ", rfChangeName2=" + rfChangeName2
				+ ", rfUploadDate=" + rfUploadDate + "]";
	}

	

	
	
}
