package com.kh.semi.payment.model.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class AdminReservationVo implements java.io.Serializable {
	
	private String reservationNo;
	private Timestamp reservationDate;
	private String memberNo;
	private String memberId;
	private String memberName;
	private String enpNo;
	private String enpName;
	private String calcNo;
	private String requestMemo;
	private int pointAmmount;
	private int people;
	private int deposit;
	private Date payDate;
	private String statusCode;
	private String statusName;
	
	public AdminReservationVo() {}

	public AdminReservationVo(String reservationNo, Timestamp reservationDate, String memberNo, String memberId,
			String memberName, String enpNo, String enpName, String calcNo, String requestMemo, int pointAmmount,
			int people, int deposit, Date payDate, String statusCode, String statusName) {
		super();
		this.reservationNo = reservationNo;
		this.reservationDate = reservationDate;
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.memberName = memberName;
		this.enpNo = enpNo;
		this.enpName = enpName;
		this.calcNo = calcNo;
		this.requestMemo = requestMemo;
		this.pointAmmount = pointAmmount;
		this.people = people;
		this.deposit = deposit;
		this.payDate = payDate;
		this.statusCode = statusCode;
		this.statusName = statusName;
	}

	public String getReservationNo() {
		return reservationNo;
	}

	public void setReservationNo(String reservationNo) {
		this.reservationNo = reservationNo;
	}

	public Timestamp getReservationDate() {
		return reservationDate;
	}

	public void setReservationDate(Timestamp reservationDate) {
		this.reservationDate = reservationDate;
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

	public String getEnpNo() {
		return enpNo;
	}

	public void setEnpNo(String enpNo) {
		this.enpNo = enpNo;
	}

	public String getEnpName() {
		return enpName;
	}

	public void setEnpName(String enpName) {
		this.enpName = enpName;
	}

	public String getCalcNo() {
		return calcNo;
	}

	public void setCalcNo(String calcNo) {
		this.calcNo = calcNo;
	}

	public String getRequestMemo() {
		return requestMemo;
	}

	public void setRequestMemo(String requestMemo) {
		this.requestMemo = requestMemo;
	}

	public int getPointAmmount() {
		return pointAmmount;
	}

	public void setPointAmmount(int pointAmmount) {
		this.pointAmmount = pointAmmount;
	}

	public int getPeople() {
		return people;
	}

	public void setPeople(int people) {
		this.people = people;
	}

	public int getDeposit() {
		return deposit;
	}

	public void setDeposit(int deposit) {
		this.deposit = deposit;
	}

	public Date getPayDate() {
		return payDate;
	}

	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}

	public String getStatusCode() {
		return statusCode;
	}

	public void setStatusCode(String statusCode) {
		this.statusCode = statusCode;
	}

	public String getStatusName() {
		return statusName;
	}

	public void setStatusName(String statusName) {
		this.statusName = statusName;
	}

	@Override
	public String toString() {
		return "AdminReservationVo [reservationNo=" + reservationNo + ", reservationDate=" + reservationDate
				+ ", memberNo=" + memberNo + ", memberId=" + memberId + ", memberName=" + memberName + ", enpNo="
				+ enpNo + ", enpName=" + enpName + ", calcNo=" + calcNo + ", requestMemo=" + requestMemo
				+ ", pointAmmount=" + pointAmmount + ", people=" + people + ", deposit=" + deposit + ", payDate="
				+ payDate + ", statusCode=" + statusCode + ", statusName=" + statusName + "]";
	}
	
	
	
	
	
}
