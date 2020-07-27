package com.kh.semi.member.model.vo;

import java.sql.Date;

public class MemberAdminVo implements java.io.Serializable {

	private String memberNo;
	private String memberId;
	private String memberName;
	private String memberEmail;
	private String memberPhone;
	private String memberGender;
	private String memberNickname;
	private String memberGrade;
	private String memberStatus;
	private String noshowCount;
	private String reservationNo;
	private Date reservationDate;
	private Date visitDate;
	private String reservationHistoryNo;
	private int memberCount;
	private int reservationCount;
	
	public MemberAdminVo() {}

	public MemberAdminVo(String memberNo, String memberId, String memberName, String memberEmail, String memberPhone,
			String memberGender, String memberNickname, String memberGrade, String memberStatus, String noshowCount,
			String reservationNo, Date reservationDate, Date visitDate, String reservationHistoryNo, int memberCount,
			int reservationCount) {
		super();
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.memberName = memberName;
		this.memberEmail = memberEmail;
		this.memberPhone = memberPhone;
		this.memberGender = memberGender;
		this.memberNickname = memberNickname;
		this.memberGrade = memberGrade;
		this.memberStatus = memberStatus;
		this.noshowCount = noshowCount;
		this.reservationNo = reservationNo;
		this.reservationDate = reservationDate;
		this.visitDate = visitDate;
		this.reservationHistoryNo = reservationHistoryNo;
		this.memberCount = memberCount;
		this.reservationCount = reservationCount;
	}

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getMemberPhone() {
		return memberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}

	public String getMemberGender() {
		return memberGender;
	}

	public void setMemberGender(String memberGender) {
		this.memberGender = memberGender;
	}

	public String getMemberNickname() {
		return memberNickname;
	}

	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}

	public String getMemberGrade() {
		return memberGrade;
	}

	public void setMemberGrade(String memberGrade) {
		this.memberGrade = memberGrade;
	}

	public String getMemberStatus() {
		return memberStatus;
	}

	public void setMemberStatus(String memberStatus) {
		this.memberStatus = memberStatus;
	}

	public String getNoshowCount() {
		return noshowCount;
	}

	public void setNoshowCount(String noshowCount) {
		this.noshowCount = noshowCount;
	}

	public String getReservationNo() {
		return reservationNo;
	}

	public void setReservationNo(String reservationNo) {
		this.reservationNo = reservationNo;
	}

	public Date getReservationDate() {
		return reservationDate;
	}

	public void setReservationDate(Date reservationDate) {
		this.reservationDate = reservationDate;
	}

	public Date getVisitDate() {
		return visitDate;
	}

	public void setVisitDate(Date visitDate) {
		this.visitDate = visitDate;
	}

	public String getReservationHistoryNo() {
		return reservationHistoryNo;
	}

	public void setReservationHistoryNo(String reservationHistoryNo) {
		this.reservationHistoryNo = reservationHistoryNo;
	}

	public int getMemberCount() {
		return memberCount;
	}

	public void setMemberCount(int memberCount) {
		this.memberCount = memberCount;
	}

	public int getReservationCount() {
		return reservationCount;
	}

	public void setReservationCount(int reservationCount) {
		this.reservationCount = reservationCount;
	}

	@Override
	public String toString() {
		return "MemberAdminVo [memberNo=" + memberNo + ", memberId=" + memberId + ", memberName=" + memberName
				+ ", memberEmail=" + memberEmail + ", memberPhone=" + memberPhone + ", memberGender=" + memberGender
				+ ", memberNickname=" + memberNickname + ", memberGrade=" + memberGrade + ", memberStatus="
				+ memberStatus + ", noshowCount=" + noshowCount + ", reservationNo=" + reservationNo
				+ ", reservationDate=" + reservationDate + ", visitDate=" + visitDate + ", reservationHistoryNo="
				+ reservationHistoryNo + ", memberCount=" + memberCount + ", reservationCount=" + reservationCount
				+ "]";
	}


	
	
	
	
}
