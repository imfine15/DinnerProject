package com.kh.semi.review.model.vo;


import java.util.Arrays;
import java.sql.Date;

public class ReviewVO implements java.io.Serializable {
	private String reviewNo; // 리뷰번호
	private String reviewContent; // 리뷰내용
	private String memberNo; // 회원번호
	private Date reviewDate; // 작성일
	private String reviewType; // 리뷰종류(방문, 일반)
	private String enpNo; // 업체번호
	private Date visitDate; // 방문일자
	private double averageRating; // 평점
	private String reservationHistoryNo; // 예약내역번호
	private String[] filePaths; // 첨부파일경로들
	private String fileNo;
	private String originName;
	private String changeName;
	private String filePath;
	private Date uploadDate;
	private String memberId;
	private String enpName;
	
	public ReviewVO() {}

	public ReviewVO(String reviewNo, String reviewContent, String memberNo, Date reviewDate, String reviewType,
			String enpNo, Date visitDate, double averageRating, String reservationHistoryNo, String[] filePaths,
			String fileNo, String originName, String changeName, String filePath, Date uploadDate, String memberId,
			String enpName) {
		super();
		this.reviewNo = reviewNo;
		this.reviewContent = reviewContent;
		this.memberNo = memberNo;
		this.reviewDate = reviewDate;
		this.reviewType = reviewType;
		this.enpNo = enpNo;
		this.visitDate = visitDate;
		this.averageRating = averageRating;
		this.reservationHistoryNo = reservationHistoryNo;
		this.filePaths = filePaths;
		this.fileNo = fileNo;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.memberId = memberId;
		this.enpName = enpName;
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

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	public Date getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}

	public String getReviewType() {
		return reviewType;
	}

	public void setReviewType(String reviewType) {
		this.reviewType = reviewType;
	}

	public String getEnpNo() {
		return enpNo;
	}

	public void setEnpNo(String enpNo) {
		this.enpNo = enpNo;
	}

	public Date getVisitDate() {
		return visitDate;
	}

	public void setVisitDate(Date visitDate) {
		this.visitDate = visitDate;
	}

	public double getAverageRating() {
		return averageRating;
	}

	public void setAverageRating(double averageRating) {
		this.averageRating = averageRating;
	}

	public String getReservationHistoryNo() {
		return reservationHistoryNo;
	}

	public void setReservationHistoryNo(String reservationHistoryNo) {
		this.reservationHistoryNo = reservationHistoryNo;
	}

	public String[] getFilePaths() {
		return filePaths;
	}

	public void setFilePaths(String[] filePaths) {
		this.filePaths = filePaths;
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

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getEnpName() {
		return enpName;
	}

	public void setEnpName(String enpName) {
		this.enpName = enpName;
	}

	@Override
	public String toString() {
		return "ReviewVO [reviewNo=" + reviewNo + ", reviewContent=" + reviewContent + ", memberNo=" + memberNo
				+ ", reviewDate=" + reviewDate + ", reviewType=" + reviewType + ", enpNo=" + enpNo + ", visitDate="
				+ visitDate + ", averageRating=" + averageRating + ", reservationHistoryNo=" + reservationHistoryNo
				+ ", filePaths=" + Arrays.toString(filePaths) + ", fileNo=" + fileNo + ", originName=" + originName
				+ ", changeName=" + changeName + ", filePath=" + filePath + ", uploadDate=" + uploadDate + ", memberId="
				+ memberId + ", enpName=" + enpName + "]";
	}

	
	
}
